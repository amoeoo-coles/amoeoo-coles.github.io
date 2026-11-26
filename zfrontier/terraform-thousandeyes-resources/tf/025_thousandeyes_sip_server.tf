# 025 · resource thousandeyes_sip_server · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_sip_server.example_sip_server_test id = "resource_id" } ```
# Reads models/thousandeyes_sip_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/thousandeyes_sip_server.yml"))["thousandeyes_sip_server"]
}

resource "thousandeyes_sip_server" "n025" {
  agents                = local.m_025["agents"]
  alert_rules           = local.m_025["alert_rules"]
  alerts_enabled        = local.m_025["alerts_enabled"]
  bgp_measurements      = local.m_025["bgp_measurements"]
  description           = local.m_025["description"]
  enabled               = local.m_025["enabled"]
  fixed_packet_rate     = local.m_025["fixed_packet_rate"]
  id                    = local.m_025["id"]
  interval              = local.m_025["interval"]
  ipv6_policy           = local.m_025["ipv6_policy"]
  monitors              = local.m_025["monitors"]
  mtu_measurements      = local.m_025["mtu_measurements"]
  network_measurements  = local.m_025["network_measurements"]
  num_path_traces       = local.m_025["num_path_traces"]
  options_regex         = local.m_025["options_regex"]
  path_trace_mode       = local.m_025["path_trace_mode"]
  probe_mode            = local.m_025["probe_mode"]
  randomized_start_time = local.m_025["randomized_start_time"]
  register_enabled      = local.m_025["register_enabled"]
  shared_with_accounts  = local.m_025["shared_with_accounts"]
  sip_target_time       = local.m_025["sip_target_time"]
  sip_time_limit        = local.m_025["sip_time_limit"]
  test_name             = local.m_025["test_name"]
  use_public_bgp        = local.m_025["use_public_bgp"]
  dynamic "agent_interfaces" {
    iterator = agent_interfaces_1
    for_each = local.m_025["agent_interfaces"] == null ? [] : range(length(local.m_025["agent_interfaces"]))
    content {
      agent_id   = lookup(local.m_025["agent_interfaces"][agent_interfaces_1.value], "agent_id", null)
      ip_address = lookup(local.m_025["agent_interfaces"][agent_interfaces_1.value], "ip_address", null)
    }
  }
  dynamic "target_sip_credentials" {
    iterator = target_sip_credentials_1
    for_each = local.m_025["target_sip_credentials"] == null ? [] : range(length(local.m_025["target_sip_credentials"]))
    content {
      auth_user     = lookup(local.m_025["target_sip_credentials"][target_sip_credentials_1.value], "auth_user", null)
      password      = lookup(local.m_025["target_sip_credentials"][target_sip_credentials_1.value], "password", null)
      port          = lookup(local.m_025["target_sip_credentials"][target_sip_credentials_1.value], "port", null)
      protocol      = lookup(local.m_025["target_sip_credentials"][target_sip_credentials_1.value], "protocol", null)
      sip_registrar = lookup(local.m_025["target_sip_credentials"][target_sip_credentials_1.value], "sip_registrar", null)
      user          = lookup(local.m_025["target_sip_credentials"][target_sip_credentials_1.value], "user", null)
    }
  }
}
