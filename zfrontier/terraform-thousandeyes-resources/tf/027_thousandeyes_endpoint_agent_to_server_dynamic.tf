# 027 · resource thousandeyes_endpoint_agent_to_server_dynamic · 4. Tests
# ```terraform import { to = thousandeyes_endpoint_agent_to_server_dynamic.example id = "123456" } ```
# Reads models/thousandeyes_endpoint_agent_to_server_dynamic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/thousandeyes_endpoint_agent_to_server_dynamic.yml"))["thousandeyes_endpoint_agent_to_server_dynamic"]
}

resource "thousandeyes_endpoint_agent_to_server_dynamic" "n027" {
  agent_selector_type = local.m_027["agent_selector_type"]
  agents = local.m_027["agents"]
  application = local.m_027["application"]
  has_path_trace_in_session = local.m_027["has_path_trace_in_session"]
  id = local.m_027["id"]
  interval = local.m_027["interval"]
  ip_version = local.m_027["ip_version"]
  is_enabled = local.m_027["is_enabled"]
  is_prioritized = local.m_027["is_prioritized"]
  max_machines = local.m_027["max_machines"]
  protocol = local.m_027["protocol"]
  tag_ids = local.m_027["tag_ids"]
  tcp_probe_mode = local.m_027["tcp_probe_mode"]
  test_name = local.m_027["test_name"]
}
