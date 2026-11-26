# 307 · resource aci_custom_qos_policy · 3. Tenant and networking
# Manages ACI Custom QoS Policy
# APIC class: qosCustomPol · DN: uni/tn-{name}/qoscustom-{name}
# Reads models/aci_custom_qos_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_307 = yamldecode(file("${path.module}/../models/aci_custom_qos_policy.yml"))["aci_custom_qos_policy"]
}

resource "aci_custom_qos_policy" "n307" {
  annotation            = local.m_307["annotation"]
  annotations           = local.m_307["annotations"]
  description           = local.m_307["description"]
  dot1p_classifiers     = local.m_307["dot1p_classifiers"]
  dscp_to_priority_maps = local.m_307["dscp_to_priority_maps"]
  name                  = local.m_307["name"]
  name_alias            = local.m_307["name_alias"]
  owner_key             = local.m_307["owner_key"]
  owner_tag             = local.m_307["owner_tag"]
  parent_dn             = local.m_307["parent_dn"]
  tags                  = local.m_307["tags"]
}
