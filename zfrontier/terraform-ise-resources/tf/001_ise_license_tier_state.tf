# 001 · resource ise_license_tier_state · 1. System
# This resource can manage a License Tier State.
# Reads models/ise_license_tier_state.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/ise_license_tier_state.yml"))["ise_license_tier_state"]
}

resource "ise_license_tier_state" "n001" {
  licenses = local.m_001["licenses"]
}
