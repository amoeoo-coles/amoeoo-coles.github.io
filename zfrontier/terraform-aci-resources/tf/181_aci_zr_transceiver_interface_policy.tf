# 181 · resource aci_zr_transceiver_interface_policy · 2. Access policies
# Manages ACI ZR Transceiver Interface Policy
# APIC class: xcvrZRIfPol · DN: uni/infra/zr-{name}
# Reads models/aci_zr_transceiver_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_181 = yamldecode(file("${path.module}/../models/aci_zr_transceiver_interface_policy.yml"))["aci_zr_transceiver_interface_policy"]
}

resource "aci_zr_transceiver_interface_policy" "n181" {
  admin_state                  = local.m_181["admin_state"]
  annotation                   = local.m_181["annotation"]
  annotations                  = local.m_181["annotations"]
  dac_rate                     = local.m_181["dac_rate"]
  description                  = local.m_181["description"]
  dwdm_carrier_grid            = local.m_181["dwdm_carrier_grid"]
  fec_mode                     = local.m_181["fec_mode"]
  frequency_100_mhz            = local.m_181["frequency_100_mhz"]
  frequency_50_ghz             = local.m_181["frequency_50_ghz"]
  itu_channel_50_ghz           = local.m_181["itu_channel_50_ghz"]
  maximum_chromatic_dispersion = local.m_181["maximum_chromatic_dispersion"]
  minimum_chromatic_dispersion = local.m_181["minimum_chromatic_dispersion"]
  modulation                   = local.m_181["modulation"]
  muxponder_mode               = local.m_181["muxponder_mode"]
  name                         = local.m_181["name"]
  name_alias                   = local.m_181["name_alias"]
  owner_key                    = local.m_181["owner_key"]
  owner_tag                    = local.m_181["owner_tag"]
  tags                         = local.m_181["tags"]
  transmit_power               = local.m_181["transmit_power"]
  wavelength_50_ghz            = local.m_181["wavelength_50_ghz"]
}
