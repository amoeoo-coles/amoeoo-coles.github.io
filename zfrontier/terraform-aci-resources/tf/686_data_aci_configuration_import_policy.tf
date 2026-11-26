# 686 · data source aci_configuration_import_policy · 8. Operational and utility
# Data source for ACI Configuration Import Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_configuration_import_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_686 = yamldecode(file("${path.module}/../models/data_aci_configuration_import_policy.yml"))["data_aci_configuration_import_policy"]
}

data "aci_configuration_import_policy" "n686" {
  admin_st               = local.m_686["admin_st"]
  annotation             = local.m_686["annotation"]
  description            = local.m_686["description"]
  fail_on_decrypt_errors = local.m_686["fail_on_decrypt_errors"]
  file_name              = local.m_686["file_name"]
  import_mode            = local.m_686["import_mode"]
  import_type            = local.m_686["import_type"]
  name                   = local.m_686["name"]
  name_alias             = local.m_686["name_alias"]
  snapshot               = local.m_686["snapshot"]
}

output "n686_data_aci_configuration_import_policy_id" {
  value = data.aci_configuration_import_policy.n686.id
}
