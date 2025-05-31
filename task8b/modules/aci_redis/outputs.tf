output "aci_ip_address" {
  value = azurerm_container_group.cg.ip_address
}
output "aci_fqdn" {
  value = azurerm_container_group.container_group.fqdn
}

output "kv_secret_redis_hostname_id" {
  value = azurerm_key_vault_secret.redis_hostname.id 
}

output "kv_secret_redis_password_id" {
  value = azurerm_key_vault_secret.redis_password.id 
}