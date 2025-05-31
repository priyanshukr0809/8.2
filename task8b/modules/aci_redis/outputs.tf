output "aci_ip_address" {
  value = azurerm_container_group.cg.ip_address
}
output "aci_fqdn" {
  value = azurerm_container_group.container_group.fqdn
}