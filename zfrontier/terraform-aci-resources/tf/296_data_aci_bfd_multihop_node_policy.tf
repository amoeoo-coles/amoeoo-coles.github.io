# 296 · data source aci_bfd_multihop_node_policy · 3. Tenant and networking
# Data source for ACI BFD Multihop Node Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bfd_multihop_node_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_296 = yamldecode(file("${path.module}/../models/data_aci_bfd_multihop_node_policy.yml"))["data_aci_bfd_multihop_node_policy"]
}

data "aci_bfd_multihop_node_policy" "n296" {
  annotation  = local.m_296["annotation"]
  description = local.m_296["description"]
  name        = local.m_296["name"]
  name_alias  = local.m_296["name_alias"]
  tenant_dn   = local.m_296["tenant_dn"]
}

output "n296_data_aci_bfd_multihop_node_policy_id" {
  value = data.aci_bfd_multihop_node_policy.n296.id
}
