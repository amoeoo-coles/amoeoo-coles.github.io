output "tenant_dn" {
  value = aci_tenant.this.id
}

output "vrf_dn" {
  value = aci_vrf.this.id
}
