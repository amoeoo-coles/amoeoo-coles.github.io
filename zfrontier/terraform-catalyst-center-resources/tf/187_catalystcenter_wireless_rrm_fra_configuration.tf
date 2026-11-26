# 187 · resource catalystcenter_wireless_rrm_fra_configuration · 8. Wireless
# This resource manages a Wireless RRM Flexible Radio Assignment (FRA) Configuration feature template. FRA feature templates define global/controller-level FRA settings per radio band pair and can be attached to wireless network profiles.
# Reads models/catalystcenter_wireless_rrm_fra_configuration.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_187 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_rrm_fra_configuration.yml"))["catalystcenter_wireless_rrm_fra_configuration"]
}

resource "catalystcenter_wireless_rrm_fra_configuration" "n187" {
  design_name         = local.m_187["design_name"]
  fra_freeze          = local.m_187["fra_freeze"]
  fra_interval        = local.m_187["fra_interval"]
  fra_sensitivity     = local.m_187["fra_sensitivity"]
  fra_status          = local.m_187["fra_status"]
  radio_band          = local.m_187["radio_band"]
  unlocked_attributes = local.m_187["unlocked_attributes"]
}
