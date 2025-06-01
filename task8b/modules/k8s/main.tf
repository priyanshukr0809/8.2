provider "kubectl" {
  host                   = yamldecode(module.aks.aks_kube_config).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(module.aks.aks_kube_config).clusters[0].cluster.certificate-authority-data)
  load_config_file       = false
}

provider "kubernetes" {
  host                   = yamldecode(module.aks.aks_kube_config).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(module.aks.aks_kube_config).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(module.aks.aks_kube_config).clusters[0].cluster.certificate-authority-data)
}
resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.aks_kv_access_identity_id
    kv_name                    = var.kv_name
    redis_url_secret_name      = var.redis_hostname_secret_name
    redis_password_secret_name = var.redis_password_secret_name
    tenant_id                  = data.azurerm_client_config.client_config.tenant_id
  })

  depends_on = [module.aks, module.aci-redis, module.kv]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = var.acr_login_server
    app_image_name   = var.docker_image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }
  depends_on = [module.aks, kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  depends_on = [module.aks, kubectl_manifest.deployment]
}

data "kubernetes_service" "k8_service" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}