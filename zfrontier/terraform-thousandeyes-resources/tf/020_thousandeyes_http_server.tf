# 020 · resource thousandeyes_http_server · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_http_server.example_http_server_test id = "resource_id" } ```
# Reads models/thousandeyes_http_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_020 = yamldecode(file("${path.module}/../models/thousandeyes_http_server.yml"))["thousandeyes_http_server"]
}

resource "thousandeyes_http_server" "n020" {
  agents = local.m_020["agents"]
  alert_rules = local.m_020["alert_rules"]
  alerts_enabled = local.m_020["alerts_enabled"]
  allow_unsafe_legacy_renegotiation = local.m_020["allow_unsafe_legacy_renegotiation"]
  auth_type = local.m_020["auth_type"]
  bandwidth_measurements = local.m_020["bandwidth_measurements"]
  bgp_measurements = local.m_020["bgp_measurements"]
  client_certificate = local.m_020["client_certificate"]
  collect_proxy_network_data = local.m_020["collect_proxy_network_data"]
  content_regex = local.m_020["content_regex"]
  description = local.m_020["description"]
  desired_status_code = local.m_020["desired_status_code"]
  distributed_tracing = local.m_020["distributed_tracing"]
  dns_override = local.m_020["dns_override"]
  download_limit = local.m_020["download_limit"]
  enabled = local.m_020["enabled"]
  fixed_packet_rate = local.m_020["fixed_packet_rate"]
  follow_redirects = local.m_020["follow_redirects"]
  headers = local.m_020["headers"]
  http_target_time = local.m_020["http_target_time"]
  http_time_limit = local.m_020["http_time_limit"]
  http_version = local.m_020["http_version"]
  id = local.m_020["id"]
  include_headers = local.m_020["include_headers"]
  interval = local.m_020["interval"]
  ipv6_policy = local.m_020["ipv6_policy"]
  monitors = local.m_020["monitors"]
  mtu_measurements = local.m_020["mtu_measurements"]
  network_measurements = local.m_020["network_measurements"]
  num_path_traces = local.m_020["num_path_traces"]
  override_agent_proxy = local.m_020["override_agent_proxy"]
  override_proxy_id = local.m_020["override_proxy_id"]
  password = local.m_020["password"]
  path_trace_mode = local.m_020["path_trace_mode"]
  post_body = local.m_020["post_body"]
  probe_mode = local.m_020["probe_mode"]
  protocol = local.m_020["protocol"]
  randomized_start_time = local.m_020["randomized_start_time"]
  request_method = local.m_020["request_method"]
  shared_with_accounts = local.m_020["shared_with_accounts"]
  ssl_version_id = local.m_020["ssl_version_id"]
  test_name = local.m_020["test_name"]
  url = local.m_020["url"]
  use_ntlm = local.m_020["use_ntlm"]
  use_public_bgp = local.m_020["use_public_bgp"]
  user_agent = local.m_020["user_agent"]
  username = local.m_020["username"]
  verify_certificate = local.m_020["verify_certificate"]
  dynamic "agent_interfaces" {
    iterator = agent_interfaces_1
    for_each = local.m_020["agent_interfaces"] == null ? [] : range(length(local.m_020["agent_interfaces"]))
    content {
      agent_id = lookup(local.m_020["agent_interfaces"][agent_interfaces_1.value], "agent_id", null)
      ip_address = lookup(local.m_020["agent_interfaces"][agent_interfaces_1.value], "ip_address", null)
    }
  }
  dynamic "custom_headers" {
    iterator = custom_headers_1
    for_each = local.m_020["custom_headers"] == null ? [] : range(length(local.m_020["custom_headers"]))
    content {
      all = lookup(local.m_020["custom_headers"][custom_headers_1.value], "all", null)
      domains = lookup(local.m_020["custom_headers"][custom_headers_1.value], "domains", null)
      root = lookup(local.m_020["custom_headers"][custom_headers_1.value], "root", null)
    }
  }
  dynamic "oauth" {
    iterator = oauth_1
    for_each = local.m_020["oauth"] == null ? [] : range(length(local.m_020["oauth"]))
    content {
      auth_type = lookup(local.m_020["oauth"][oauth_1.value], "auth_type", null)
      headers = lookup(local.m_020["oauth"][oauth_1.value], "headers", null)
      password = lookup(local.m_020["oauth"][oauth_1.value], "password", null)
      post_body = lookup(local.m_020["oauth"][oauth_1.value], "post_body", null)
      request_method = lookup(local.m_020["oauth"][oauth_1.value], "request_method", null)
      test_url = lookup(local.m_020["oauth"][oauth_1.value], "test_url", null)
      username = lookup(local.m_020["oauth"][oauth_1.value], "username", null)
    }
  }
}
