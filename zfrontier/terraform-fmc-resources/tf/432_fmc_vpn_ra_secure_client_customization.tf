# 432 · resource fmc_vpn_ra_secure_client_customization · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) Secure Client Customizations.
# Reads models/fmc_vpn_ra_secure_client_customization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_432 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_secure_client_customization.yml"))["fmc_vpn_ra_secure_client_customization"]
}

resource "fmc_vpn_ra_secure_client_customization" "n432" {
  binaries                       = local.m_432["binaries"]
  custom_installer_transforms    = local.m_432["custom_installer_transforms"]
  domain                         = local.m_432["domain"]
  gui_and_text_messages          = local.m_432["gui_and_text_messages"]
  icons_and_images               = local.m_432["icons_and_images"]
  localized_installer_transforms = local.m_432["localized_installer_transforms"]
  scripts                        = local.m_432["scripts"]
  vpn_ra_id                      = local.m_432["vpn_ra_id"]
}
