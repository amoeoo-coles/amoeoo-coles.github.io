# 170 · resource catalystcenter_power_profile · 8. Wireless
# This resource manages AP Power Profiles. Power Profiles configure interface-level power rules (Ethernet speed, radio spatial streams, USB state) to control AP power consumption.
# Reads models/catalystcenter_power_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_170 = yamldecode(file("${path.module}/../models/catalystcenter_power_profile.yml"))["catalystcenter_power_profile"]
}

resource "catalystcenter_power_profile" "n170" {
  description  = local.m_170["description"]
  profile_name = local.m_170["profile_name"]
  rules        = local.m_170["rules"]
}
