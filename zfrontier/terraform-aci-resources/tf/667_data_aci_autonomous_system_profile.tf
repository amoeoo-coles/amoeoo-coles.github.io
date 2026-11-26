# 667 · data source aci_autonomous_system_profile · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Autonomous System Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_autonomous_system_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_667 = yamldecode(file("${path.module}/../models/data_aci_autonomous_system_profile.yml"))["data_aci_autonomous_system_profile"]
}

data "aci_autonomous_system_profile" "n667" {
  annotation  = local.m_667["annotation"]
  asn         = local.m_667["asn"]
  description = local.m_667["description"]
  name_alias  = local.m_667["name_alias"]
}

output "n667_data_aci_autonomous_system_profile_id" {
  value = data.aci_autonomous_system_profile.n667.id
}
