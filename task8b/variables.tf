variable "location" {
  type        = string
  description = "location"
}

#acr
variable "acr_sku" {
  type        = string
  description = "sku"
}
variable "dockerfile_path" {
  type        = string
  description = "sku"
}
variable "docker_build_context_path" {
  type        = string
  description = "sku"
}
variable "docker_image_name" {
  type        = string
  description = "sku"
}
variable "platform_os" {
  type        = string
  description = "sku"
}
variable "acr_task_name" {
  type        = string
  description = "sku"
}
variable "context_access_token" {
  type        = string
  description = "sku"
}
#aci
variable "aci_container_environment_variables" {
  type        = map(string)
  description = "sku"
}

variable "aci_container_name" {
  description = "sku"
  type        = string
}

variable "aci_container_cpu" {
  description = "sku"
  type        = string
}

variable "aci_container_memory" {
  description = "sku"
  type        = string
}

variable "aci_os_type" {
  description = "sku"
  type        = string
}
variable "redis_hostname_secret_name" {
  type = string
}

variable "redis_password_secret_name" {
  type = string
}

#kv
variable "kv_sku_name" {
  description = "sku"
  type        = string
}


#aks
variable "system_node_pool_name" {
  type        = string
  description = "sku"
}
variable "system_node_pool_node_count" {
  type        = number
  description = "sku"
}
variable "system_node_pool_vm_size" {
  type        = string
  description = "sku"
}

variable "name_prefix" {
  type        = string
  description = "sku"
}

#storage
variable "storage_account_name" {
  type = string
}
variable "storage_account_tier" {
  type = string
}
variable "storage_account_replication_type" {
  type = string
}

variable "storage_container_name" {
  type = string
}
variable "storage_container_access_type" {
  type = string
}

variable "storage_blob_name" {
  type = string
}
variable "blob_content_type" {
  type = string
}
variable "blob_type" {
  type = string
}

variable "archive_type" {
  type = string
}
variable "archive_source_dir" {
  type = string
}
variable "archive_output_path" {
  type = string
}