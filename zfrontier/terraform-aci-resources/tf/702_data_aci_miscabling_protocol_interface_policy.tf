# 702 · data source aci_miscabling_protocol_interface_policy · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/data_aci_miscabling_protocol_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_702 = yamldecode(file("${path.module}/../models/data_aci_miscabling_protocol_interface_policy.yml"))["data_aci_miscabling_protocol_interface_policy"]
}

data "aci_miscabling_protocol_interface_policy" "n702" {
  admin_st    = local.m_702["admin_st"]
  annotation  = local.m_702["annotation"]
  description = local.m_702["description"]
  name        = local.m_702["name"]
  name_alias  = local.m_702["name_alias"]
}

output "n702_data_aci_miscabling_protocol_interface_policy_id" {
  value = data.aci_miscabling_protocol_interface_policy.n702.id
}
