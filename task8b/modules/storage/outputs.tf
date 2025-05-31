output "sas" {
  value = data.azurerm_storage_account_sas.storage_sas.sas
}

output "blob_url" {
  value = azurerm_storage_blob.storage_blob.url
}