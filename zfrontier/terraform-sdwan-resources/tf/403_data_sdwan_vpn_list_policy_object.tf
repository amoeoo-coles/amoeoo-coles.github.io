# 403 · data source sdwan_vpn_list_policy_object · 10. (Classic) policy objects
# This data source can read the VPN List Policy Object .
# Reads models/data_sdwan_vpn_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_403 = yamldecode(file("${path.module}/../models/data_sdwan_vpn_list_policy_object.yml"))["data_sdwan_vpn_list_policy_object"]
}

data "sdwan_vpn_list_policy_object" "n403" {
  id = local.m_403["id"]
}

output "n403_data_sdwan_vpn_list_policy_object_id" {
  value = data.sdwan_vpn_list_policy_object.n403.id
}
