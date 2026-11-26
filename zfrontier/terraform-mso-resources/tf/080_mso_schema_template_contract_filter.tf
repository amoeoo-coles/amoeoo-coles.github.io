# 080 · resource mso_schema_template_contract_filter · 7. Contracts, filters and external EPGs
# Manages MSO Schema Template Contract Filter.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_contract_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_080 = yamldecode(file("${path.module}/../models/mso_schema_template_contract_filter.yml"))["mso_schema_template_contract_filter"]
}

resource "mso_schema_template_contract_filter" "n080" {
  action               = local.m_080["action"]
  contract_name        = local.m_080["contract_name"]
  directives           = local.m_080["directives"]
  filter_name          = local.m_080["filter_name"]
  filter_schema_id     = local.m_080["filter_schema_id"]
  filter_template_name = local.m_080["filter_template_name"]
  filter_type          = local.m_080["filter_type"]
  priority             = local.m_080["priority"]
  schema_id            = local.m_080["schema_id"]
  template_name        = local.m_080["template_name"]
}
