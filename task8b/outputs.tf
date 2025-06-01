output "aca_fqdn" {
  value = module.aca.aca_dns
}
output "redis_fqdn" {
  value = module.aci-redis.redis_fqdn
}
output "aks_lb_ip" {
  value = module.k8s
}

output "aci_ip_address" {
  value = module.aci-redis.aci_ip_address
}