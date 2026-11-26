# 018 · resource thousandeyes_dnssec · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_dnssec.example_dnssec_test id = "resource_id" } ```
# Reads models/thousandeyes_dnssec.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/thousandeyes_dnssec.yml"))["thousandeyes_dnssec"]
}

resource "thousandeyes_dnssec" "n018" {
  agents                = local.m_018["agents"]
  alert_rules           = local.m_018["alert_rules"]
  alerts_enabled        = local.m_018["alerts_enabled"]
  description           = local.m_018["description"]
  dns_query_class       = local.m_018["dns_query_class"]
  domain                = local.m_018["domain"]
  enabled               = local.m_018["enabled"]
  id                    = local.m_018["id"]
  interval              = local.m_018["interval"]
  randomized_start_time = local.m_018["randomized_start_time"]
  shared_with_accounts  = local.m_018["shared_with_accounts"]
  test_name             = local.m_018["test_name"]
}
