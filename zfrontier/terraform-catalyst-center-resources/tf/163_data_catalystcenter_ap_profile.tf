# 163 · data source catalystcenter_ap_profile · 8. Wireless
# This data source can read the AP Profile.
# Reads models/data_catalystcenter_ap_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_163 = yamldecode(file("${path.module}/../models/data_catalystcenter_ap_profile.yml"))["data_catalystcenter_ap_profile"]
}

data "catalystcenter_ap_profile" "n163" {
  ap_profile_name = local.m_163["ap_profile_name"]
}

output "n163_data_catalystcenter_ap_profile_id" {
  value = data.catalystcenter_ap_profile.n163.id
}
