# 294 · data source aci_bfd_multihop_interface_policy · 3. Tenant and networking
# Data source for ACI BFD Multihop Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bfd_multihop_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_294 = yamldecode(file("${path.module}/../models/data_aci_bfd_multihop_interface_policy.yml"))["data_aci_bfd_multihop_interface_policy"]
}

data "aci_bfd_multihop_interface_policy" "n294" {
  annotation  = local.m_294["annotation"]
  description = local.m_294["description"]
  name        = local.m_294["name"]
  name_alias  = local.m_294["name_alias"]
  tenant_dn   = local.m_294["tenant_dn"]
}

output "n294_data_aci_bfd_multihop_interface_policy_id" {
  value = data.aci_bfd_multihop_interface_policy.n294.id
}
