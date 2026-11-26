# 684 · data source aci_configuration_export_policy · 8. Operational and utility
# Data source for ACI Configuration Export Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_configuration_export_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_684 = yamldecode(file("${path.module}/../models/data_aci_configuration_export_policy.yml"))["data_aci_configuration_export_policy"]
}

data "aci_configuration_export_policy" "n684" {
  admin_st              = local.m_684["admin_st"]
  annotation            = local.m_684["annotation"]
  description           = local.m_684["description"]
  format                = local.m_684["format"]
  include_secure_fields = local.m_684["include_secure_fields"]
  max_snapshot_count    = local.m_684["max_snapshot_count"]
  name                  = local.m_684["name"]
  name_alias            = local.m_684["name_alias"]
  snapshot              = local.m_684["snapshot"]
  target_dn             = local.m_684["target_dn"]
}

output "n684_data_aci_configuration_export_policy_id" {
  value = data.aci_configuration_export_policy.n684.id
}
