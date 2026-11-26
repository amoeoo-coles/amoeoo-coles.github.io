# 022 · resource thousandeyes_web_transaction · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_web_transaction.example_web_transaction_test id = "resource_id" } ```
# Reads models/thousandeyes_web_transaction.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_022 = yamldecode(file("${path.module}/../models/thousandeyes_web_transaction.yml"))["thousandeyes_web_transaction"]
}

resource "thousandeyes_web_transaction" "n022" {
  agents = local.m_022["agents"]
  alert_rules = local.m_022["alert_rules"]
  alerts_enabled = local.m_022["alerts_enabled"]
  allow_geolocation = local.m_022["allow_geolocation"]
  allow_mic_and_camera = local.m_022["allow_mic_and_camera"]
  allow_unsafe_legacy_renegotiation = local.m_022["allow_unsafe_legacy_renegotiation"]
  auth_type = local.m_022["auth_type"]
  bandwidth_measurements = local.m_022["bandwidth_measurements"]
  bgp_measurements = local.m_022["bgp_measurements"]
  block_domains = local.m_022["block_domains"]
  browser_language = local.m_022["browser_language"]
  chromium_track = local.m_022["chromium_track"]
  client_certificate = local.m_022["client_certificate"]
  collect_proxy_network_data = local.m_022["collect_proxy_network_data"]
  content_regex = local.m_022["content_regex"]
  credentials = local.m_022["credentials"]
  description = local.m_022["description"]
  desired_status_code = local.m_022["desired_status_code"]
  disable_screenshot = local.m_022["disable_screenshot"]
  distributed_tracing = local.m_022["distributed_tracing"]
  dns_override = local.m_022["dns_override"]
  download_limit = local.m_022["download_limit"]
  emulated_device_id = local.m_022["emulated_device_id"]
  enabled = local.m_022["enabled"]
  fixed_packet_rate = local.m_022["fixed_packet_rate"]
  flag_collect_console_logs = local.m_022["flag_collect_console_logs"]
  follow_redirects = local.m_022["follow_redirects"]
  http_target_time = local.m_022["http_target_time"]
  http_time_limit = local.m_022["http_time_limit"]
  http_version = local.m_022["http_version"]
  id = local.m_022["id"]
  identify_agent_traffic_with_user_agent = local.m_022["identify_agent_traffic_with_user_agent"]
  include_headers = local.m_022["include_headers"]
  interval = local.m_022["interval"]
  monitors = local.m_022["monitors"]
  mtu_measurements = local.m_022["mtu_measurements"]
  network_measurements = local.m_022["network_measurements"]
  num_path_traces = local.m_022["num_path_traces"]
  override_agent_proxy = local.m_022["override_agent_proxy"]
  override_proxy_id = local.m_022["override_proxy_id"]
  page_loading_strategy = local.m_022["page_loading_strategy"]
  password = local.m_022["password"]
  path_trace_mode = local.m_022["path_trace_mode"]
  probe_mode = local.m_022["probe_mode"]
  protocol = local.m_022["protocol"]
  randomized_start_time = local.m_022["randomized_start_time"]
  shared_with_accounts = local.m_022["shared_with_accounts"]
  ssl_version_id = local.m_022["ssl_version_id"]
  subinterval = local.m_022["subinterval"]
  target_time = local.m_022["target_time"]
  test_name = local.m_022["test_name"]
  time_limit = local.m_022["time_limit"]
  transaction_script = local.m_022["transaction_script"]
  url = local.m_022["url"]
  use_ntlm = local.m_022["use_ntlm"]
  use_public_bgp = local.m_022["use_public_bgp"]
  user_agent = local.m_022["user_agent"]
  username = local.m_022["username"]
  verify_certificate = local.m_022["verify_certificate"]
  dynamic "custom_headers" {
    iterator = custom_headers_1
    for_each = local.m_022["custom_headers"] == null ? [] : range(length(local.m_022["custom_headers"]))
    content {
      all = lookup(local.m_022["custom_headers"][custom_headers_1.value], "all", null)
      domains = lookup(local.m_022["custom_headers"][custom_headers_1.value], "domains", null)
      root = lookup(local.m_022["custom_headers"][custom_headers_1.value], "root", null)
    }
  }
}
