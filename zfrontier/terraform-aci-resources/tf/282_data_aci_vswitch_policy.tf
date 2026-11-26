# 282 · data source aci_vswitch_policy · 2. Access policies
# Data source for ACI VSwitch Policy Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vswitch_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_282 = yamldecode(file("${path.module}/../models/data_aci_vswitch_policy.yml"))["data_aci_vswitch_policy"]
}

data "aci_vswitch_policy" "n282" {
  annotation    = local.m_282["annotation"]
  description   = local.m_282["description"]
  name_alias    = local.m_282["name_alias"]
  vmm_domain_dn = local.m_282["vmm_domain_dn"]
}

output "n282_data_aci_vswitch_policy_id" {
  value = data.aci_vswitch_policy.n282.id
}
