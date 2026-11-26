# 085 · data source aci_l3_interface_policy · 1. System and fabric setup
# Data source for ACI L3 Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_085 = yamldecode(file("${path.module}/../models/data_aci_l3_interface_policy.yml"))["data_aci_l3_interface_policy"]
}

data "aci_l3_interface_policy" "n085" {
  annotation  = local.m_085["annotation"]
  bfd_isis    = local.m_085["bfd_isis"]
  description = local.m_085["description"]
  name        = local.m_085["name"]
  name_alias  = local.m_085["name_alias"]
}

output "n085_data_aci_l3_interface_policy_id" {
  value = data.aci_l3_interface_policy.n085.id
}
