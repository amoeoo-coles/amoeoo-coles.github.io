# 170 · data source aci_port_security_interface_policy · 2. Access policies
# Data source for ACI Port Security Interface Policy
# APIC class: l2PortSecurityPol · DN: uni/infra/portsecurityP-{name}
# Reads models/data_aci_port_security_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_170 = yamldecode(file("${path.module}/../models/data_aci_port_security_interface_policy.yml"))["data_aci_port_security_interface_policy"]
}

data "aci_port_security_interface_policy" "n170" {
  name = local.m_170["name"]
}

output "n170_data_aci_port_security_interface_policy_id" {
  value = data.aci_port_security_interface_policy.n170.id
}
