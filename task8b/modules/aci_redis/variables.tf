variable "container_group_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "os_type" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_cpu" {
  type = string
}

variable "container_memory" {
  type = string
}

variable "container_environment_variables" {
  type = map(string)
}

variable "container_secure_environment_variables" {
  type      = map(string)
  sensitive = true
}
/*
variable "acr_login_server" {
  type = string
}
variable "acr_admin_password" {
  type = string
}
variable "acr_admin_username" {
  type = string
}
*/

variable "key_vault_id" {
  type = string 
}

variable "keyvault_secret_redis_hostname_name" {
  type = string 
}

variable "keyvault_secret_redis_password_name" {
  type = string 
}