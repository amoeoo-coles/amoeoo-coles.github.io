# 024 · resource thousandeyes_ftp_server · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_ftp_server.example_ftp_server_test id = "resource_id" } ```
# Reads models/thousandeyes_ftp_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/thousandeyes_ftp_server.yml"))["thousandeyes_ftp_server"]
}

resource "thousandeyes_ftp_server" "n024" {
  agents = local.m_024["agents"]
  alert_rules = local.m_024["alert_rules"]
  alerts_enabled = local.m_024["alerts_enabled"]
  bandwidth_measurements = local.m_024["bandwidth_measurements"]
  bgp_measurements = local.m_024["bgp_measurements"]
  description = local.m_024["description"]
  download_limit = local.m_024["download_limit"]
  enabled = local.m_024["enabled"]
  fixed_packet_rate = local.m_024["fixed_packet_rate"]
  ftp_target_time = local.m_024["ftp_target_time"]
  ftp_time_limit = local.m_024["ftp_time_limit"]
  id = local.m_024["id"]
  interval = local.m_024["interval"]
  ipv6_policy = local.m_024["ipv6_policy"]
  monitors = local.m_024["monitors"]
  mtu_measurements = local.m_024["mtu_measurements"]
  network_measurements = local.m_024["network_measurements"]
  num_path_traces = local.m_024["num_path_traces"]
  password = try(var.secrets["thousandeyes_ftp_server.password"], local.m_024["password"])
  path_trace_mode = local.m_024["path_trace_mode"]
  probe_mode = local.m_024["probe_mode"]
  protocol = local.m_024["protocol"]
  randomized_start_time = local.m_024["randomized_start_time"]
  request_type = local.m_024["request_type"]
  shared_with_accounts = local.m_024["shared_with_accounts"]
  test_name = local.m_024["test_name"]
  url = local.m_024["url"]
  use_active_ftp = local.m_024["use_active_ftp"]
  use_explicit_ftps = local.m_024["use_explicit_ftps"]
  use_public_bgp = local.m_024["use_public_bgp"]
  username = local.m_024["username"]
  dynamic "agent_interfaces" {
    iterator = agent_interfaces_1
    for_each = local.m_024["agent_interfaces"] == null ? [] : range(length(local.m_024["agent_interfaces"]))
    content {
      agent_id = lookup(local.m_024["agent_interfaces"][agent_interfaces_1.value], "agent_id", null)
      ip_address = lookup(local.m_024["agent_interfaces"][agent_interfaces_1.value], "ip_address", null)
    }
  }
}
