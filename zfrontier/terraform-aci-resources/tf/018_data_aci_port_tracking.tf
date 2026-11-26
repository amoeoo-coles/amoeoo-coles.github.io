# 018 · data source aci_port_tracking · 1. System and fabric setup
# Data source for ACI Port Tracking
# APIC class: not collected · DN: not collected
# Reads models/data_aci_port_tracking.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/data_aci_port_tracking.yml"))["data_aci_port_tracking"]
}

data "aci_port_tracking" "n018" {
  admin_st           = local.m_018["admin_st"]
  annotation         = local.m_018["annotation"]
  delay              = local.m_018["delay"]
  description        = local.m_018["description"]
  include_apic_ports = local.m_018["include_apic_ports"]
  minlinks           = local.m_018["minlinks"]
  name_alias         = local.m_018["name_alias"]
}

output "n018_data_aci_port_tracking_id" {
  value = data.aci_port_tracking.n018.id
}
