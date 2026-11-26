# 183 · resource aci_zrp_transceiver_interface_policy · 2. Access policies
# Manages ACI ZRP (ZR+) Transceiver Interface Policy
# APIC class: xcvrZRPIfPol · DN: uni/infra/zrp-{name}
# Reads models/aci_zrp_transceiver_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_183 = yamldecode(file("${path.module}/../models/aci_zrp_transceiver_interface_policy.yml"))["aci_zrp_transceiver_interface_policy"]
}

resource "aci_zrp_transceiver_interface_policy" "n183" {
  admin_state                  = local.m_183["admin_state"]
  annotation                   = local.m_183["annotation"]
  annotations                  = local.m_183["annotations"]
  dac_rate                     = local.m_183["dac_rate"]
  description                  = local.m_183["description"]
  dwdm_carrier_grid            = local.m_183["dwdm_carrier_grid"]
  fec_mode                     = local.m_183["fec_mode"]
  frequency_100_mhz            = local.m_183["frequency_100_mhz"]
  frequency_50_ghz             = local.m_183["frequency_50_ghz"]
  itu_channel_50_ghz           = local.m_183["itu_channel_50_ghz"]
  maximum_chromatic_dispersion = local.m_183["maximum_chromatic_dispersion"]
  minimum_chromatic_dispersion = local.m_183["minimum_chromatic_dispersion"]
  modulation                   = local.m_183["modulation"]
  muxponder_mode               = local.m_183["muxponder_mode"]
  name                         = local.m_183["name"]
  name_alias                   = local.m_183["name_alias"]
  owner_key                    = local.m_183["owner_key"]
  owner_tag                    = local.m_183["owner_tag"]
  tags                         = local.m_183["tags"]
  transmit_power               = local.m_183["transmit_power"]
  wavelength_50_ghz            = local.m_183["wavelength_50_ghz"]
}
