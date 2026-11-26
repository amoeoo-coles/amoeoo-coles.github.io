# 166 · resource catalystcenter_dot11be_profile · 8. Wireless
# This resource manages an 802.11be Profile. These profiles configure WiFi 7 parameters such as OFDMA and MU-MIMO for downlink and uplink.
# Reads models/catalystcenter_dot11be_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_166 = yamldecode(file("${path.module}/../models/catalystcenter_dot11be_profile.yml"))["catalystcenter_dot11be_profile"]
}

resource "catalystcenter_dot11be_profile" "n166" {
  mu_mimo_down_link = local.m_166["mu_mimo_down_link"]
  mu_mimo_up_link   = local.m_166["mu_mimo_up_link"]
  ofdma_down_link   = local.m_166["ofdma_down_link"]
  ofdma_multi_ru    = local.m_166["ofdma_multi_ru"]
  ofdma_up_link     = local.m_166["ofdma_up_link"]
  profile_name      = local.m_166["profile_name"]
}
