# 128 · data source mso_tenant_policies_ipsla_track_list · 10. Tenant policy templates
# Data source for IPSLA Track List.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_ipsla_track_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_128 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_ipsla_track_list.yml"))["data_mso_tenant_policies_ipsla_track_list"]
}

data "mso_tenant_policies_ipsla_track_list" "n128" {
  name        = local.m_128["name"]
  template_id = local.m_128["template_id"]
}

output "n128_data_mso_tenant_policies_ipsla_track_list_id" {
  value = data.mso_tenant_policies_ipsla_track_list.n128.id
}
