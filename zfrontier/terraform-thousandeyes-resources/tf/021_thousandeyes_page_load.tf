# 021 · resource thousandeyes_page_load · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_page_load.example_page_load_test id = "resource_id" } ```
# Reads models/thousandeyes_page_load.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/thousandeyes_page_load.yml"))["thousandeyes_page_load"]
}

resource "thousandeyes_page_load" "n021" {
  agents                                 = local.m_021["agents"]
  alert_rules                            = local.m_021["alert_rules"]
  alerts_enabled                         = local.m_021["alerts_enabled"]
  allow_geolocation                      = local.m_021["allow_geolocation"]
  allow_mic_and_camera                   = local.m_021["allow_mic_and_camera"]
  allow_unsafe_legacy_renegotiation      = local.m_021["allow_unsafe_legacy_renegotiation"]
  auth_type                              = local.m_021["auth_type"]
  bandwidth_measurements                 = local.m_021["bandwidth_measurements"]
  bgp_measurements                       = local.m_021["bgp_measurements"]
  block_domains                          = local.m_021["block_domains"]
  browser_language                       = local.m_021["browser_language"]
  chromium_track                         = local.m_021["chromium_track"]
  client_certificate                     = local.m_021["client_certificate"]
  collect_proxy_network_data             = local.m_021["collect_proxy_network_data"]
  content_regex                          = local.m_021["content_regex"]
  description                            = local.m_021["description"]
  desired_status_code                    = local.m_021["desired_status_code"]
  disable_screenshot                     = local.m_021["disable_screenshot"]
  distributed_tracing                    = local.m_021["distributed_tracing"]
  dns_override                           = local.m_021["dns_override"]
  download_limit                         = local.m_021["download_limit"]
  emulated_device_id                     = local.m_021["emulated_device_id"]
  enabled                                = local.m_021["enabled"]
  fixed_packet_rate                      = local.m_021["fixed_packet_rate"]
  follow_redirects                       = local.m_021["follow_redirects"]
  http_interval                          = local.m_021["http_interval"]
  http_target_time                       = local.m_021["http_target_time"]
  http_time_limit                        = local.m_021["http_time_limit"]
  http_version                           = local.m_021["http_version"]
  id                                     = local.m_021["id"]
  identify_agent_traffic_with_user_agent = local.m_021["identify_agent_traffic_with_user_agent"]
  include_headers                        = local.m_021["include_headers"]
  interval                               = local.m_021["interval"]
  monitors                               = local.m_021["monitors"]
  mtu_measurements                       = local.m_021["mtu_measurements"]
  network_measurements                   = local.m_021["network_measurements"]
  num_path_traces                        = local.m_021["num_path_traces"]
  override_agent_proxy                   = local.m_021["override_agent_proxy"]
  override_proxy_id                      = local.m_021["override_proxy_id"]
  page_load_target_time                  = local.m_021["page_load_target_time"]
  page_load_time_limit                   = local.m_021["page_load_time_limit"]
  page_loading_strategy                  = local.m_021["page_loading_strategy"]
  password                               = local.m_021["password"]
  path_trace_mode                        = local.m_021["path_trace_mode"]
  probe_mode                             = local.m_021["probe_mode"]
  protocol                               = local.m_021["protocol"]
  randomized_start_time                  = local.m_021["randomized_start_time"]
  shared_with_accounts                   = local.m_021["shared_with_accounts"]
  ssl_version_id                         = local.m_021["ssl_version_id"]
  subinterval                            = local.m_021["subinterval"]
  test_name                              = local.m_021["test_name"]
  url                                    = local.m_021["url"]
  use_ntlm                               = local.m_021["use_ntlm"]
  use_public_bgp                         = local.m_021["use_public_bgp"]
  user_agent                             = local.m_021["user_agent"]
  username                               = local.m_021["username"]
  verify_certificate                     = local.m_021["verify_certificate"]
  dynamic "custom_headers" {
    iterator = custom_headers_1
    for_each = local.m_021["custom_headers"] == null ? [] : range(length(local.m_021["custom_headers"]))
    content {
      all     = lookup(local.m_021["custom_headers"][custom_headers_1.value], "all", null)
      domains = lookup(local.m_021["custom_headers"][custom_headers_1.value], "domains", null)
      root    = lookup(local.m_021["custom_headers"][custom_headers_1.value], "root", null)
    }
  }
}
