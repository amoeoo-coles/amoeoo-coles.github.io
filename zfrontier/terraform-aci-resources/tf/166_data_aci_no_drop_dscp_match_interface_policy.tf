# 166 · data source aci_no_drop_dscp_match_interface_policy · 2. Access policies
# Data source for ACI No-Drop-DSCP Match Interface Policy
# APIC class: qosNodropDscpMatchIfPol · DN: uni/infra/nodropDscpMatch-{name}
# Reads models/data_aci_no_drop_dscp_match_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_166 = yamldecode(file("${path.module}/../models/data_aci_no_drop_dscp_match_interface_policy.yml"))["data_aci_no_drop_dscp_match_interface_policy"]
}

data "aci_no_drop_dscp_match_interface_policy" "n166" {
  name = local.m_166["name"]
}

output "n166_data_aci_no_drop_dscp_match_interface_policy_id" {
  value = data.aci_no_drop_dscp_match_interface_policy.n166.id
}
