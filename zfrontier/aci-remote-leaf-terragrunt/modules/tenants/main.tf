resource "aci_tenant" "this" {
  name        = var.tenant_name
  description = "Example tenant from the Terragrunt workbench (${var.environment})"
}

resource "aci_vrf" "this" {
  tenant_dn = aci_tenant.this.id
  name      = var.vrf_name
}

resource "aci_bridge_domain" "this" {
  tenant_dn          = aci_tenant.this.id
  name               = var.bd_name
  relation_fv_rs_ctx = aci_vrf.this.id
}

resource "aci_subnet" "bd" {
  parent_dn = aci_bridge_domain.this.id
  ip        = var.bd_subnet
  scope     = ["public"]
}
