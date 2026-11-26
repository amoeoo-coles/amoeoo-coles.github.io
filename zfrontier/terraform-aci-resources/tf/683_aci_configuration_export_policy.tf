# 683 · resource aci_configuration_export_policy · 8. Operational and utility
# Manages ACI Configuration Export Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_configuration_export_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_683 = yamldecode(file("${path.module}/../models/aci_configuration_export_policy.yml"))["aci_configuration_export_policy"]
}

resource "aci_configuration_export_policy" "n683" {
  admin_st                              = local.m_683["admin_st"]
  annotation                            = local.m_683["annotation"]
  description                           = local.m_683["description"]
  format                                = local.m_683["format"]
  include_secure_fields                 = local.m_683["include_secure_fields"]
  max_snapshot_count                    = local.m_683["max_snapshot_count"]
  name                                  = local.m_683["name"]
  name_alias                            = local.m_683["name_alias"]
  relation_config_rs_export_destination = local.m_683["relation_config_rs_export_destination"]
  relation_config_rs_export_scheduler   = local.m_683["relation_config_rs_export_scheduler"]
  relation_config_rs_remote_path        = local.m_683["relation_config_rs_remote_path"]
  relation_trig_rs_triggerable          = local.m_683["relation_trig_rs_triggerable"]
  snapshot                              = local.m_683["snapshot"]
  target_dn                             = local.m_683["target_dn"]
}
