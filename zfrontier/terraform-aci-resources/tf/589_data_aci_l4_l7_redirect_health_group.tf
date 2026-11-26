# 589 · data source aci_l4_l7_redirect_health_group · 5. L4-L7 service graphs
# Data source for ACI L4-L7 Redirect Health Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l4_l7_redirect_health_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_589 = yamldecode(file("${path.module}/../models/data_aci_l4_l7_redirect_health_group.yml"))["data_aci_l4_l7_redirect_health_group"]
}

data "aci_l4_l7_redirect_health_group" "n589" {
  annotation  = local.m_589["annotation"]
  description = local.m_589["description"]
  name        = local.m_589["name"]
  name_alias  = local.m_589["name_alias"]
  tenant_dn   = local.m_589["tenant_dn"]
}

output "n589_data_aci_l4_l7_redirect_health_group_id" {
  value = data.aci_l4_l7_redirect_health_group.n589.id
}
