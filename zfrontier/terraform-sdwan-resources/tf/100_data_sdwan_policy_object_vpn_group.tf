# 100 · data source sdwan_policy_object_vpn_group · 3. Policy objects and custom applications
# This data source can read the Policy Object VPN Group Policy_object.
# Reads models/data_sdwan_policy_object_vpn_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_100 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_vpn_group.yml"))["data_sdwan_policy_object_vpn_group"]
}

data "sdwan_policy_object_vpn_group" "n100" {
  feature_profile_id = local.m_100["feature_profile_id"]
  id = local.m_100["id"]
  name = local.m_100["name"]
}

output "n100_data_sdwan_policy_object_vpn_group_id" {
  value = data.sdwan_policy_object_vpn_group.n100.id
}
