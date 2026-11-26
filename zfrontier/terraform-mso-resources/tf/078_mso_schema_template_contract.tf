# 078 · resource mso_schema_template_contract · 7. Contracts, filters and external EPGs
# Manages MSO Schema Template Contract.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_078 = yamldecode(file("${path.module}/../models/mso_schema_template_contract.yml"))["mso_schema_template_contract"]
}

resource "mso_schema_template_contract" "n078" {
  contract_name        = local.m_078["contract_name"]
  description          = local.m_078["description"]
  directives           = local.m_078["directives"]
  display_name         = local.m_078["display_name"]
  filter_relationships = local.m_078["filter_relationships"]
  filter_type          = local.m_078["filter_type"]
  priority             = local.m_078["priority"]
  schema_id            = local.m_078["schema_id"]
  scope                = local.m_078["scope"]
  target_dscp          = local.m_078["target_dscp"]
  template_name        = local.m_078["template_name"]
  dynamic "filter_relationship" {
    for_each = local.m_078["filter_relationship"] == null ? [] : local.m_078["filter_relationship"]
    content {
      action               = lookup(filter_relationship.value, "action", null)
      directives           = lookup(filter_relationship.value, "directives", null)
      filter_name          = lookup(filter_relationship.value, "filter_name", null)
      filter_schema_id     = lookup(filter_relationship.value, "filter_schema_id", null)
      filter_template_name = lookup(filter_relationship.value, "filter_template_name", null)
      filter_type          = lookup(filter_relationship.value, "filter_type", null)
      priority             = lookup(filter_relationship.value, "priority", null)
    }
  }
}
