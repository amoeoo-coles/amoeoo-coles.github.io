# 116 · resource catalystcenter_apply_pending_fabric_events · 7. SD-Access
# Apply a pending SDA fabric event.
# Reads models/catalystcenter_apply_pending_fabric_events.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_116 = yamldecode(file("${path.module}/../models/catalystcenter_apply_pending_fabric_events.yml"))["catalystcenter_apply_pending_fabric_events"]
}

resource "catalystcenter_apply_pending_fabric_events" "n116" {
  event_id = local.m_116["event_id"]
  fabric_id = local.m_116["fabric_id"]
}
