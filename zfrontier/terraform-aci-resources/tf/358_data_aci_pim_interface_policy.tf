# 358 · data source aci_pim_interface_policy · 3. Tenant and networking
# Data source for ACI PIM Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_pim_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_358 = yamldecode(file("${path.module}/../models/data_aci_pim_interface_policy.yml"))["data_aci_pim_interface_policy"]
}

data "aci_pim_interface_policy" "n358" {
  annotation  = local.m_358["annotation"]
  description = local.m_358["description"]
  name        = local.m_358["name"]
  name_alias  = local.m_358["name_alias"]
  tenant_dn   = local.m_358["tenant_dn"]
}

output "n358_data_aci_pim_interface_policy_id" {
  value = data.aci_pim_interface_policy.n358.id
}
