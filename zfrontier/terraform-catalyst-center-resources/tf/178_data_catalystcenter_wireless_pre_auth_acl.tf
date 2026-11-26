# 178 · data source catalystcenter_wireless_pre_auth_acl · 8. Wireless
# This data source can read the Wireless Pre Auth ACL.
# Reads models/data_catalystcenter_wireless_pre_auth_acl.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_178 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_pre_auth_acl.yml"))["data_catalystcenter_wireless_pre_auth_acl"]
}

data "catalystcenter_wireless_pre_auth_acl" "n178" {
  id = local.m_178["id"]
}

output "n178_data_catalystcenter_wireless_pre_auth_acl_id" {
  value = data.catalystcenter_wireless_pre_auth_acl.n178.id
}
