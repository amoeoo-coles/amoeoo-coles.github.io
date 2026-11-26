# 016 · resource thousandeyes_dns_server · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_dns_server.example_dns_server_test id = "resource_id" } ```
# Reads models/thousandeyes_dns_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/thousandeyes_dns_server.yml"))["thousandeyes_dns_server"]
}

resource "thousandeyes_dns_server" "n016" {
  agents                 = local.m_016["agents"]
  alert_rules            = local.m_016["alert_rules"]
  alerts_enabled         = local.m_016["alerts_enabled"]
  bandwidth_measurements = local.m_016["bandwidth_measurements"]
  bgp_measurements       = local.m_016["bgp_measurements"]
  description            = local.m_016["description"]
  dns_query_class        = local.m_016["dns_query_class"]
  dns_servers            = local.m_016["dns_servers"]
  dns_transport_protocol = local.m_016["dns_transport_protocol"]
  domain                 = local.m_016["domain"]
  enabled                = local.m_016["enabled"]
  fixed_packet_rate      = local.m_016["fixed_packet_rate"]
  id                     = local.m_016["id"]
  interval               = local.m_016["interval"]
  ipv6_policy            = local.m_016["ipv6_policy"]
  monitors               = local.m_016["monitors"]
  mtu_measurements       = local.m_016["mtu_measurements"]
  network_measurements   = local.m_016["network_measurements"]
  num_path_traces        = local.m_016["num_path_traces"]
  path_trace_mode        = local.m_016["path_trace_mode"]
  probe_mode             = local.m_016["probe_mode"]
  protocol               = local.m_016["protocol"]
  randomized_start_time  = local.m_016["randomized_start_time"]
  recursive_queries      = local.m_016["recursive_queries"]
  shared_with_accounts   = local.m_016["shared_with_accounts"]
  test_name              = local.m_016["test_name"]
  use_public_bgp         = local.m_016["use_public_bgp"]
}
