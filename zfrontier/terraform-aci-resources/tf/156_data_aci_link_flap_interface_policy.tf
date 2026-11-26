# 156 · data source aci_link_flap_interface_policy · 2. Access policies
# Data source for ACI Link Flap Interface Policy
# APIC class: fabricLinkFlapPol · DN: uni/infra/linkflappol-{name}
# Reads models/data_aci_link_flap_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_156 = yamldecode(file("${path.module}/../models/data_aci_link_flap_interface_policy.yml"))["data_aci_link_flap_interface_policy"]
}

data "aci_link_flap_interface_policy" "n156" {
  name = local.m_156["name"]
}

output "n156_data_aci_link_flap_interface_policy_id" {
  value = data.aci_link_flap_interface_policy.n156.id
}
