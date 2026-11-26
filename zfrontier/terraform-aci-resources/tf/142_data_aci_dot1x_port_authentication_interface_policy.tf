# 142 · data source aci_dot1x_port_authentication_interface_policy · 2. Access policies
# Data source for ACI 802.1x Port Authentication Interface Policy
# APIC class: l2PortAuthPol · DN: uni/infra/portauthpol-{name}
# Reads models/data_aci_dot1x_port_authentication_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_142 = yamldecode(file("${path.module}/../models/data_aci_dot1x_port_authentication_interface_policy.yml"))["data_aci_dot1x_port_authentication_interface_policy"]
}

data "aci_dot1x_port_authentication_interface_policy" "n142" {
  name = local.m_142["name"]
}

output "n142_data_aci_dot1x_port_authentication_interface_policy_id" {
  value = data.aci_dot1x_port_authentication_interface_policy.n142.id
}
