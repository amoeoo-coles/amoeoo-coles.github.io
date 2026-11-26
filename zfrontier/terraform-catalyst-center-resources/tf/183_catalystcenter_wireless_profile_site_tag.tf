# 183 · resource catalystcenter_wireless_profile_site_tag · 8. Wireless
# This resource manages Site Tags associated with a Wireless Profile in Cisco Catalyst Center. Site Tags cannot be created at the Global site - they must be created at Area, Building, or Floor level. Before creating a site tag, the Wireless Profile must first be assigned to the site using the cataly
# Reads models/catalystcenter_wireless_profile_site_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_183 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_profile_site_tag.yml"))["catalystcenter_wireless_profile_site_tag"]
}

resource "catalystcenter_wireless_profile_site_tag" "n183" {
  ap_profile_name = local.m_183["ap_profile_name"]
  flex_profile_name = local.m_183["flex_profile_name"]
  site_ids = local.m_183["site_ids"]
  site_tag_id = local.m_183["site_tag_id"]
  site_tag_name = local.m_183["site_tag_name"]
  wireless_profile_id = local.m_183["wireless_profile_id"]
}
