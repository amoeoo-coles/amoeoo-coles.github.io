# 419 · data source fmc_vpn_ra_address_assignment_policy · 5. VPN
# This data source reads the VPN RA Address Assignment Policy.
# Reads models/data_fmc_vpn_ra_address_assignment_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_419 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_address_assignment_policy.yml"))["data_fmc_vpn_ra_address_assignment_policy"]
}

data "fmc_vpn_ra_address_assignment_policy" "n419" {
  domain    = local.m_419["domain"]
  id        = local.m_419["id"]
  vpn_ra_id = local.m_419["vpn_ra_id"]
}

output "n419_data_fmc_vpn_ra_address_assignment_policy_id" {
  value = data.fmc_vpn_ra_address_assignment_policy.n419.id
}
