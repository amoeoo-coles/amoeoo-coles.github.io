# 172 · resource catalystcenter_wireless_cleanair_configuration · 8. Wireless
# This resource manages a Wireless CleanAir Configuration feature template. CleanAir feature templates define spectrum-intelligence settings (per radio band) that detect and classify RF interferers, and can be attached to wireless network profiles.
# Reads models/catalystcenter_wireless_cleanair_configuration.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_172 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_cleanair_configuration.yml"))["catalystcenter_wireless_cleanair_configuration"]
}

resource "catalystcenter_wireless_cleanair_configuration" "n172" {
  ble_beacon = local.m_172["ble_beacon"]
  bluetooth_paging_inquiry = local.m_172["bluetooth_paging_inquiry"]
  bluetooth_sco_acl = local.m_172["bluetooth_sco_acl"]
  clean_air = local.m_172["clean_air"]
  clean_air_device_reporting = local.m_172["clean_air_device_reporting"]
  continuous_transmitter = local.m_172["continuous_transmitter"]
  description = local.m_172["description"]
  design_name = local.m_172["design_name"]
  generic_dect = local.m_172["generic_dect"]
  generic_tdd = local.m_172["generic_tdd"]
  jammer = local.m_172["jammer"]
  microwave_oven = local.m_172["microwave_oven"]
  motorola_canopy = local.m_172["motorola_canopy"]
  persistent_device_propagation = local.m_172["persistent_device_propagation"]
  radio_band = local.m_172["radio_band"]
  si_fhss = local.m_172["si_fhss"]
  spectrum_80211_fh = local.m_172["spectrum_80211_fh"]
  spectrum_80211_non_standard_channel = local.m_172["spectrum_80211_non_standard_channel"]
  spectrum_802154 = local.m_172["spectrum_802154"]
  spectrum_inverted = local.m_172["spectrum_inverted"]
  super_ag = local.m_172["super_ag"]
  unlocked_attributes = local.m_172["unlocked_attributes"]
  video_camera = local.m_172["video_camera"]
  wimax_fixed = local.m_172["wimax_fixed"]
  wimax_mobile = local.m_172["wimax_mobile"]
  xbox = local.m_172["xbox"]
}
