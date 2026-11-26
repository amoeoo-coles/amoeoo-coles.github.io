# 016 · data source aci_mgmt_preference · 1. System and fabric setup
# Data source for ACI Mgmt Preference
# APIC class: not collected · DN: not collected
# Reads models/data_aci_mgmt_preference.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/data_aci_mgmt_preference.yml"))["data_aci_mgmt_preference"]
}

data "aci_mgmt_preference" "n016" {
  annotation     = local.m_016["annotation"]
  description    = local.m_016["description"]
  interface_pref = local.m_016["interface_pref"]
  name_alias     = local.m_016["name_alias"]
}

output "n016_data_aci_mgmt_preference_id" {
  value = data.aci_mgmt_preference.n016.id
}
