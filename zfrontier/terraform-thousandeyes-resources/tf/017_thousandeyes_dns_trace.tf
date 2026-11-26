# 017 · resource thousandeyes_dns_trace · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_dns_trace.example_dns_trace_test id = "resource_id" } ```
# Reads models/thousandeyes_dns_trace.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/thousandeyes_dns_trace.yml"))["thousandeyes_dns_trace"]
}

resource "thousandeyes_dns_trace" "n017" {
  agents = local.m_017["agents"]
  alert_rules = local.m_017["alert_rules"]
  alerts_enabled = local.m_017["alerts_enabled"]
  description = local.m_017["description"]
  dns_query_class = local.m_017["dns_query_class"]
  dns_transport_protocol = local.m_017["dns_transport_protocol"]
  domain = local.m_017["domain"]
  enabled = local.m_017["enabled"]
  id = local.m_017["id"]
  interval = local.m_017["interval"]
  randomized_start_time = local.m_017["randomized_start_time"]
  shared_with_accounts = local.m_017["shared_with_accounts"]
  test_name = local.m_017["test_name"]
}
