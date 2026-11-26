# 014 · resource ise_endpoint_custom_attribute · 2. Identity management
# This resource can manage an Endpoint Custom Attribute.
# Reads models/ise_endpoint_custom_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/ise_endpoint_custom_attribute.yml"))["ise_endpoint_custom_attribute"]
}

resource "ise_endpoint_custom_attribute" "n014" {
  attribute_name = local.m_014["attribute_name"]
  attribute_type = local.m_014["attribute_type"]
}
