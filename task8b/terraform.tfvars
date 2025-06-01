location = "southindia"

name_prefix = "cmtr-jq46olgq-mod8b"

archive_type        = "tar.gz"
archive_source_dir  = "application"
archive_output_path = "new.tar.gz"

#storage
storage_account_name             = "suvhamsa1"
storage_account_replication_type = "LRS"
storage_account_tier             = "Standard"
storage_blob_name                = "suvham-blob1"
storage_container_access_type    = "private"
storage_container_name           = "app-content"
blob_content_type                = "application/zip"
blob_type                        = "Block"

#acr
acr_task_name     = "suvham-acr1-task1"
acr_sku           = "Basic"
platform_os       = "Linux"
dockerfile_path   = "Dockerfile"
docker_image_name = "suvham-dockerimage1"

#aci-redis
aci_os_type                = "Linux"
aci_container_name         = "suvham-aci-container1"
aci_container_image        = "mcr.microsoft.com/cbl-mariner/base/redis:6"
aci_container_cpu          = "1"
aci_container_memory       = "1"
redis_hostname_secret_name = "redis-hostname"
redis_password_secret_name = "redis-password"

#kv
kv_sku = "standard"

#aca
container_app_env_name      = "suvham-appenv1"
container_app_name          = "suvham-app1"
container_app_revision_mode = "Single"
container_cpu               = "0.25"
container_memory            = "0.5Gi"
container_name              = "suvham-appcontainer1"

#aks
system_node_pool_name       = "system"
system_node_pool_node_count = 1
system_node_pool_vm_size    = "Standard_D2ads_v5"

aca_ua_name = "suvham-aca-ua1"