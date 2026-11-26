# 184 · data source catalystcenter_wireless_profile_site_tag · 8. Wireless
# This data source can read the Wireless Profile Site Tag.
# Reads models/data_catalystcenter_wireless_profile_site_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_184 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_profile_site_tag.yml"))["data_catalystcenter_wireless_profile_site_tag"]
}

data "catalystcenter_wireless_profile_site_tag" "n184" {
  id                  = local.m_184["id"]
  site_tag_id         = local.m_184["site_tag_id"]
  wireless_profile_id = local.m_184["wireless_profile_id"]
}

output "n184_data_catalystcenter_wireless_profile_site_tag_id" {
  value = data.catalystcenter_wireless_profile_site_tag.n184.id
}
