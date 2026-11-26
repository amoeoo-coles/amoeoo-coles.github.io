# 019 · resource thousandeyes_endpoint_http_server · 4. Tests
# ```terraform import { to = thousandeyes_endpoint_http_server.example id = "123456" } ```
# Reads models/thousandeyes_endpoint_http_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/thousandeyes_endpoint_http_server.yml"))["thousandeyes_endpoint_http_server"]
}

resource "thousandeyes_endpoint_http_server" "n019" {
  agent_selector_type       = local.m_019["agent_selector_type"]
  agents                    = local.m_019["agents"]
  auth_type                 = local.m_019["auth_type"]
  has_path_trace_in_session = local.m_019["has_path_trace_in_session"]
  http_time_limit           = local.m_019["http_time_limit"]
  id                        = local.m_019["id"]
  interval                  = local.m_019["interval"]
  ip_version                = local.m_019["ip_version"]
  is_enabled                = local.m_019["is_enabled"]
  is_prioritized            = local.m_019["is_prioritized"]
  max_machines              = local.m_019["max_machines"]
  network_measurements      = local.m_019["network_measurements"]
  password                  = local.m_019["password"]
  protocol                  = local.m_019["protocol"]
  ssl_version_id            = local.m_019["ssl_version_id"]
  tag_ids                   = local.m_019["tag_ids"]
  target_response_time      = local.m_019["target_response_time"]
  tcp_probe_mode            = local.m_019["tcp_probe_mode"]
  test_name                 = local.m_019["test_name"]
  url                       = local.m_019["url"]
  username                  = local.m_019["username"]
  verify_certificate        = local.m_019["verify_certificate"]
}
