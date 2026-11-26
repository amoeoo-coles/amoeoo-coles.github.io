# 026 · resource thousandeyes_voice · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_voice.example_voice_test id = "resource_id" } ```
# Reads models/thousandeyes_voice.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/thousandeyes_voice.yml"))["thousandeyes_voice"]
}

resource "thousandeyes_voice" "n026" {
  agents = local.m_026["agents"]
  alert_rules = local.m_026["alert_rules"]
  alerts_enabled = local.m_026["alerts_enabled"]
  bgp_measurements = local.m_026["bgp_measurements"]
  codec_id = local.m_026["codec_id"]
  description = local.m_026["description"]
  dscp_id = local.m_026["dscp_id"]
  duration = local.m_026["duration"]
  enabled = local.m_026["enabled"]
  id = local.m_026["id"]
  interval = local.m_026["interval"]
  jitter_buffer = local.m_026["jitter_buffer"]
  monitors = local.m_026["monitors"]
  num_path_traces = local.m_026["num_path_traces"]
  randomized_start_time = local.m_026["randomized_start_time"]
  shared_with_accounts = local.m_026["shared_with_accounts"]
  target_agent_id = local.m_026["target_agent_id"]
  test_name = local.m_026["test_name"]
  use_public_bgp = local.m_026["use_public_bgp"]
  dynamic "agent_interfaces" {
    iterator = agent_interfaces_1
    for_each = local.m_026["agent_interfaces"] == null ? [] : range(length(local.m_026["agent_interfaces"]))
    content {
      agent_id = lookup(local.m_026["agent_interfaces"][agent_interfaces_1.value], "agent_id", null)
      ip_address = lookup(local.m_026["agent_interfaces"][agent_interfaces_1.value], "ip_address", null)
    }
  }
}
