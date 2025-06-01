output "aca_dns" {
  value = module.aca.aca_dns
}
output "aks_lb_ip" {
  value       = data.kubernetes_service.k8_service.status[0].load_balancer[0].ingress[0].ip
  description = "value"
}

output "aci_ip_address" {
  value = module.aci-redis.aci_ip_address 
}