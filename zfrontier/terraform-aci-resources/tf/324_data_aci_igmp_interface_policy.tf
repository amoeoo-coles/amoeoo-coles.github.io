# 324 · data source aci_igmp_interface_policy · 3. Tenant and networking
# Data source for ACI IGMP Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_igmp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_324 = yamldecode(file("${path.module}/../models/data_aci_igmp_interface_policy.yml"))["data_aci_igmp_interface_policy"]
}

data "aci_igmp_interface_policy" "n324" {
  annotation  = local.m_324["annotation"]
  description = local.m_324["description"]
  name        = local.m_324["name"]
  name_alias  = local.m_324["name_alias"]
  tenant_dn   = local.m_324["tenant_dn"]
}

output "n324_data_aci_igmp_interface_policy_id" {
  value = data.aci_igmp_interface_policy.n324.id
}
