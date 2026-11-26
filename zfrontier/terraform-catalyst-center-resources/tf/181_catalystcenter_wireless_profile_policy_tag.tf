# 181 · resource catalystcenter_wireless_profile_policy_tag · 8. Wireless
# This resource manages Policy Tags associated with a Wireless Profile in Cisco Catalyst Center. Policy Tags control which AP Zones are active at specific sites. They are only relevant when AP Zones are configured on the Wireless Profile. Before creating a policy tag, the Wireless Profile must first
# Reads models/catalystcenter_wireless_profile_policy_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_181 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_profile_policy_tag.yml"))["catalystcenter_wireless_profile_policy_tag"]
}

resource "catalystcenter_wireless_profile_policy_tag" "n181" {
  ap_zones = local.m_181["ap_zones"]
  policy_tag_id = local.m_181["policy_tag_id"]
  policy_tag_name = local.m_181["policy_tag_name"]
  site_ids = local.m_181["site_ids"]
  wireless_profile_id = local.m_181["wireless_profile_id"]
}
