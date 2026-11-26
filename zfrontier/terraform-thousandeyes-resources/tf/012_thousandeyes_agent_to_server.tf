# 012 · resource thousandeyes_agent_to_server · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_agent_to_server.example_agent_to_server_test id = "resource_id" } ```
# Reads models/thousandeyes_agent_to_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/thousandeyes_agent_to_server.yml"))["thousandeyes_agent_to_server"]
}

resource "thousandeyes_agent_to_server" "n012" {
  agents = local.m_012["agents"]
  alert_rules = local.m_012["alert_rules"]
  alerts_enabled = local.m_012["alerts_enabled"]
  bandwidth_measurements = local.m_012["bandwidth_measurements"]
  bgp_measurements = local.m_012["bgp_measurements"]
  continuous_mode = local.m_012["continuous_mode"]
  description = local.m_012["description"]
  dscp_id = local.m_012["dscp_id"]
  enabled = local.m_012["enabled"]
  fixed_packet_rate = local.m_012["fixed_packet_rate"]
  id = local.m_012["id"]
  interval = local.m_012["interval"]
  ipv6_policy = local.m_012["ipv6_policy"]
  monitors = local.m_012["monitors"]
  mtu_measurements = local.m_012["mtu_measurements"]
  network_measurements = local.m_012["network_measurements"]
  num_path_traces = local.m_012["num_path_traces"]
  path_trace_mode = local.m_012["path_trace_mode"]
  ping_payload_size = local.m_012["ping_payload_size"]
  port = local.m_012["port"]
  probe_mode = local.m_012["probe_mode"]
  protocol = local.m_012["protocol"]
  randomized_start_time = local.m_012["randomized_start_time"]
  server = local.m_012["server"]
  shared_with_accounts = local.m_012["shared_with_accounts"]
  test_name = local.m_012["test_name"]
  use_public_bgp = local.m_012["use_public_bgp"]
  dynamic "agent_interfaces" {
    iterator = agent_interfaces_1
    for_each = local.m_012["agent_interfaces"] == null ? [] : range(length(local.m_012["agent_interfaces"]))
    content {
      agent_id = lookup(local.m_012["agent_interfaces"][agent_interfaces_1.value], "agent_id", null)
      ip_address = lookup(local.m_012["agent_interfaces"][agent_interfaces_1.value], "ip_address", null)
    }
  }
}
