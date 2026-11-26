# 013 · resource thousandeyes_endpoint_agent_to_server · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_endpoint_agent_to_server.example id = "resource_id" } ```
# Reads models/thousandeyes_endpoint_agent_to_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/thousandeyes_endpoint_agent_to_server.yml"))["thousandeyes_endpoint_agent_to_server"]
}

resource "thousandeyes_endpoint_agent_to_server" "n013" {
  agent_selector_type = local.m_013["agent_selector_type"]
  agents              = local.m_013["agents"]
  id                  = local.m_013["id"]
  interval            = local.m_013["interval"]
  ip_version          = local.m_013["ip_version"]
  is_enabled          = local.m_013["is_enabled"]
  is_prioritized      = local.m_013["is_prioritized"]
  max_machines        = local.m_013["max_machines"]
  port                = local.m_013["port"]
  protocol            = local.m_013["protocol"]
  server              = local.m_013["server"]
  tag_ids             = local.m_013["tag_ids"]
  tcp_probe_mode      = local.m_013["tcp_probe_mode"]
  test_name           = local.m_013["test_name"]
}
