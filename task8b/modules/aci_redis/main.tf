resource "random_password" "redis_db_password" {
  length = 20  
}

resource "azurerm_container_group" "container_group" {
  name                = var.container_group_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.os_type
  ip_address_type     = "Public"
  dns_name_label      = var.container_group_name
  exposed_port = [{
    port     = 6379,
    protocol = "TCP",
  }]

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.container_cpu
    cpu_limit = var.container_cpu
    memory = var.container_memory
    memory_limit = var.container_memory

    ports {
      port     = 6379
      protocol = "TCP"
    }
    
    commands = ["redis-server",
      "--protected-mode","no" ,
      "--requirepass" ,"suvhampass"
    ] 
     
  }
}

resource "azurerm_key_vault_secret" "redis_password" {
  name = var.keyvault_secret_redis_password_name
  value = random_password.redis_db_password.result 
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name = var.keyvault_secret_redis_hostname_name
  key_vault_id = var.key_vault_id
  value = azurerm_container_group.container_group.fqdn
}