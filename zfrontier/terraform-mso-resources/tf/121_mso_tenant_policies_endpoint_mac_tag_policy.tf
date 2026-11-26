# 121 · resource mso_tenant_policies_endpoint_mac_tag_policy · 10. Tenant policy templates
# Manages Endpoint MAC Tag Policy on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_endpoint_mac_tag_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_121 = yamldecode(file("${path.module}/../models/mso_tenant_policies_endpoint_mac_tag_policy.yml"))["mso_tenant_policies_endpoint_mac_tag_policy"]
}

resource "mso_tenant_policies_endpoint_mac_tag_policy" "n121" {
  bd_uuid     = local.m_121["bd_uuid"]
  mac         = local.m_121["mac"]
  template_id = local.m_121["template_id"]
  vrf_uuid    = local.m_121["vrf_uuid"]
  dynamic "policy_tags" {
    for_each = local.m_121["policy_tags"] == null ? [] : local.m_121["policy_tags"]
    content {
      key   = lookup(policy_tags.value, "key", null)
      value = lookup(policy_tags.value, "value", null)
    }
  }
  dynamic "tag_annotations" {
    for_each = local.m_121["tag_annotations"] == null ? [] : local.m_121["tag_annotations"]
    content {
      key   = lookup(tag_annotations.value, "key", null)
      value = lookup(tag_annotations.value, "value", null)
    }
  }
}
