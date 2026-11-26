# 308 · data source aci_custom_qos_policy · 3. Tenant and networking
# Data source for ACI Custom QoS Policy
# APIC class: qosCustomPol · DN: uni/tn-{name}/qoscustom-{name}
# Reads models/data_aci_custom_qos_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_308 = yamldecode(file("${path.module}/../models/data_aci_custom_qos_policy.yml"))["data_aci_custom_qos_policy"]
}

data "aci_custom_qos_policy" "n308" {
  name      = local.m_308["name"]
  parent_dn = local.m_308["parent_dn"]
}

output "n308_data_aci_custom_qos_policy_id" {
  value = data.aci_custom_qos_policy.n308.id
}
