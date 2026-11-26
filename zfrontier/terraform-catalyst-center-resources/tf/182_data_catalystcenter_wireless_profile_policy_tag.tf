# 182 · data source catalystcenter_wireless_profile_policy_tag · 8. Wireless
# This data source can read the Wireless Profile Policy Tag.
# Reads models/data_catalystcenter_wireless_profile_policy_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_182 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_profile_policy_tag.yml"))["data_catalystcenter_wireless_profile_policy_tag"]
}

data "catalystcenter_wireless_profile_policy_tag" "n182" {
  id = local.m_182["id"]
  policy_tag_id = local.m_182["policy_tag_id"]
  wireless_profile_id = local.m_182["wireless_profile_id"]
}

output "n182_data_catalystcenter_wireless_profile_policy_tag_id" {
  value = data.catalystcenter_wireless_profile_policy_tag.n182.id
}
