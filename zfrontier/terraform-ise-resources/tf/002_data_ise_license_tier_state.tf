# 002 · data source ise_license_tier_state · 1. System
# This data source can read the License Tier State.
# Reads models/data_ise_license_tier_state.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_ise_license_tier_state.yml"))["data_ise_license_tier_state"]
}

data "ise_license_tier_state" "n002" {
  id = local.m_002["id"]
}

output "n002_data_ise_license_tier_state_id" {
  value = data.ise_license_tier_state.n002.id
}
