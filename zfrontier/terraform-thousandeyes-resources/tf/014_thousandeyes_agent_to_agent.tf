# 014 · resource thousandeyes_agent_to_agent · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_agent_to_agent.example_agent_to_agent_test id = "resource_id" } ```
# Reads models/thousandeyes_agent_to_agent.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/thousandeyes_agent_to_agent.yml"))["thousandeyes_agent_to_agent"]
}

resource "thousandeyes_agent_to_agent" "n014" {
  agents                  = local.m_014["agents"]
  alert_rules             = local.m_014["alert_rules"]
  alerts_enabled          = local.m_014["alerts_enabled"]
  bgp_measurements        = local.m_014["bgp_measurements"]
  description             = local.m_014["description"]
  direction               = local.m_014["direction"]
  dscp_id                 = local.m_014["dscp_id"]
  enabled                 = local.m_014["enabled"]
  fixed_packet_rate       = local.m_014["fixed_packet_rate"]
  id                      = local.m_014["id"]
  interval                = local.m_014["interval"]
  monitors                = local.m_014["monitors"]
  mss                     = local.m_014["mss"]
  num_path_traces         = local.m_014["num_path_traces"]
  path_trace_mode         = local.m_014["path_trace_mode"]
  port                    = local.m_014["port"]
  protocol                = local.m_014["protocol"]
  randomized_start_time   = local.m_014["randomized_start_time"]
  shared_with_accounts    = local.m_014["shared_with_accounts"]
  target_agent_id         = local.m_014["target_agent_id"]
  test_name               = local.m_014["test_name"]
  throughput_duration     = local.m_014["throughput_duration"]
  throughput_measurements = local.m_014["throughput_measurements"]
  throughput_rate         = local.m_014["throughput_rate"]
  use_public_bgp          = local.m_014["use_public_bgp"]
  dynamic "agent_interfaces" {
    iterator = agent_interfaces_1
    for_each = local.m_014["agent_interfaces"] == null ? [] : range(length(local.m_014["agent_interfaces"]))
    content {
      agent_id   = lookup(local.m_014["agent_interfaces"][agent_interfaces_1.value], "agent_id", null)
      ip_address = lookup(local.m_014["agent_interfaces"][agent_interfaces_1.value], "ip_address", null)
    }
  }
}
