# 362 · data source aci_trust_control_policy · 3. Tenant and networking
# Data source for ACI Trust Control Policy
# APIC class: fhsTrustCtrlPol · DN: uni/tn-{name}/trustctrlpol-{name}
# Reads models/data_aci_trust_control_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_362 = yamldecode(file("${path.module}/../models/data_aci_trust_control_policy.yml"))["data_aci_trust_control_policy"]
}

data "aci_trust_control_policy" "n362" {
  name      = local.m_362["name"]
  parent_dn = local.m_362["parent_dn"]
}

output "n362_data_aci_trust_control_policy_id" {
  value = data.aci_trust_control_policy.n362.id
}
