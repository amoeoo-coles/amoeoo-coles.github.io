# 015 · resource thousandeyes_bgp · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_bgp.example_bgp_test id = "resource_id" } ```
# Reads models/thousandeyes_bgp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/thousandeyes_bgp.yml"))["thousandeyes_bgp"]
}

resource "thousandeyes_bgp" "n015" {
  alert_rules = local.m_015["alert_rules"]
  alerts_enabled = local.m_015["alerts_enabled"]
  description = local.m_015["description"]
  enabled = local.m_015["enabled"]
  id = local.m_015["id"]
  include_covered_prefixes = local.m_015["include_covered_prefixes"]
  monitors = local.m_015["monitors"]
  prefix = local.m_015["prefix"]
  shared_with_accounts = local.m_015["shared_with_accounts"]
  test_name = local.m_015["test_name"]
  use_public_bgp = local.m_015["use_public_bgp"]
}
