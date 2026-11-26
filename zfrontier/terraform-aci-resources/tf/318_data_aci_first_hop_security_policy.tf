# 318 · data source aci_first_hop_security_policy · 3. Tenant and networking
# Data source for ACI First Hop Security Policy
# APIC class: fhsBDPol · DN: uni/tn-{name}/bdpol-{name}
# Reads models/data_aci_first_hop_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_318 = yamldecode(file("${path.module}/../models/data_aci_first_hop_security_policy.yml"))["data_aci_first_hop_security_policy"]
}

data "aci_first_hop_security_policy" "n318" {
  name      = local.m_318["name"]
  parent_dn = local.m_318["parent_dn"]
}

output "n318_data_aci_first_hop_security_policy_id" {
  value = data.aci_first_hop_security_policy.n318.id
}
