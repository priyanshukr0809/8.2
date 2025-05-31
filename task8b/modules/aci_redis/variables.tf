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

variable "key_vault_id" {
  type = string
}

variable "redis_hostname_secret_name" {
  type = string
}

variable "redis_password_secret_name" {
  type = string
}
variable "tags" {
  type        = map(string)
  description = "sku"
}