output "tenant" {
  value       = var.tenant
  description = "Lab tenant name."
}

output "bridge_domain_ids" {
  value       = { for k, bd in aci_bridge_domain.this : k => bd.id }
  description = "Map of scenario id to bridge domain DN."
}
