# 685 · resource aci_configuration_import_policy · 8. Operational and utility
# Manages ACI Configuration Import Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_configuration_import_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_685 = yamldecode(file("${path.module}/../models/aci_configuration_import_policy.yml"))["aci_configuration_import_policy"]
}

resource "aci_configuration_import_policy" "n685" {
  admin_st                         = local.m_685["admin_st"]
  annotation                       = local.m_685["annotation"]
  description                      = local.m_685["description"]
  fail_on_decrypt_errors           = local.m_685["fail_on_decrypt_errors"]
  file_name                        = local.m_685["file_name"]
  import_mode                      = local.m_685["import_mode"]
  import_type                      = local.m_685["import_type"]
  name                             = local.m_685["name"]
  name_alias                       = local.m_685["name_alias"]
  relation_config_rs_import_source = local.m_685["relation_config_rs_import_source"]
  relation_config_rs_remote_path   = local.m_685["relation_config_rs_remote_path"]
  relation_trig_rs_triggerable     = local.m_685["relation_trig_rs_triggerable"]
  snapshot                         = local.m_685["snapshot"]
}
