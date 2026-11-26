# 023 · resource thousandeyes_api · 4. Tests
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_api.api_test_example id = "resource_id" } ```
# Reads models/thousandeyes_api.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/thousandeyes_api.yml"))["thousandeyes_api"]
}

resource "thousandeyes_api" "n023" {
  agents                     = local.m_023["agents"]
  alert_rules                = local.m_023["alert_rules"]
  alerts_enabled             = local.m_023["alerts_enabled"]
  bgp_measurements           = local.m_023["bgp_measurements"]
  client_certificate         = local.m_023["client_certificate"]
  collect_proxy_network_data = local.m_023["collect_proxy_network_data"]
  credentials                = local.m_023["credentials"]
  description                = local.m_023["description"]
  distributed_tracing        = local.m_023["distributed_tracing"]
  enabled                    = local.m_023["enabled"]
  follow_redirects           = local.m_023["follow_redirects"]
  id                         = local.m_023["id"]
  interval                   = local.m_023["interval"]
  monitors                   = local.m_023["monitors"]
  mtu_measurements           = local.m_023["mtu_measurements"]
  network_measurements       = local.m_023["network_measurements"]
  num_path_traces            = local.m_023["num_path_traces"]
  override_agent_proxy       = local.m_023["override_agent_proxy"]
  override_proxy_id          = local.m_023["override_proxy_id"]
  path_trace_mode            = local.m_023["path_trace_mode"]
  probe_mode                 = local.m_023["probe_mode"]
  protocol                   = local.m_023["protocol"]
  randomized_start_time      = local.m_023["randomized_start_time"]
  shared_with_accounts       = local.m_023["shared_with_accounts"]
  ssl_version_id             = local.m_023["ssl_version_id"]
  target_time                = local.m_023["target_time"]
  test_name                  = local.m_023["test_name"]
  time_limit                 = local.m_023["time_limit"]
  url                        = local.m_023["url"]
  use_public_bgp             = local.m_023["use_public_bgp"]
  dynamic "predefined_variables" {
    iterator = predefined_variables_1
    for_each = local.m_023["predefined_variables"] == null ? [] : range(length(local.m_023["predefined_variables"]))
    content {
      name  = lookup(local.m_023["predefined_variables"][predefined_variables_1.value], "name", null)
      value = lookup(local.m_023["predefined_variables"][predefined_variables_1.value], "value", null)
    }
  }
  dynamic "requests" {
    iterator = requests_1
    for_each = local.m_023["requests"] == null ? [] : range(length(local.m_023["requests"]))
    content {
      auth_type             = lookup(local.m_023["requests"][requests_1.value], "auth_type", null)
      bearer_token          = lookup(local.m_023["requests"][requests_1.value], "bearer_token", null)
      body                  = lookup(local.m_023["requests"][requests_1.value], "body", null)
      client_authentication = lookup(local.m_023["requests"][requests_1.value], "client_authentication", null)
      client_id             = lookup(local.m_023["requests"][requests_1.value], "client_id", null)
      client_secret         = lookup(local.m_023["requests"][requests_1.value], "client_secret", null)
      collect_api_response  = lookup(local.m_023["requests"][requests_1.value], "collect_api_response", null)
      method                = lookup(local.m_023["requests"][requests_1.value], "method", null)
      name                  = lookup(local.m_023["requests"][requests_1.value], "name", null)
      password              = lookup(local.m_023["requests"][requests_1.value], "password", null)
      scope                 = lookup(local.m_023["requests"][requests_1.value], "scope", null)
      token_url             = lookup(local.m_023["requests"][requests_1.value], "token_url", null)
      url                   = lookup(local.m_023["requests"][requests_1.value], "url", null)
      username              = lookup(local.m_023["requests"][requests_1.value], "username", null)
      verify_certificate    = lookup(local.m_023["requests"][requests_1.value], "verify_certificate", null)
      wait_time_ms          = lookup(local.m_023["requests"][requests_1.value], "wait_time_ms", null)
      dynamic "assertions" {
        iterator = assertions_2
        for_each = lookup(local.m_023["requests"][requests_1.value], "assertions", null) == null ? [] : range(length(local.m_023["requests"][requests_1.value]["assertions"]))
        content {
          name     = lookup(local.m_023["requests"][requests_1.value]["assertions"][assertions_2.value], "name", null)
          operator = lookup(local.m_023["requests"][requests_1.value]["assertions"][assertions_2.value], "operator", null)
          value    = lookup(local.m_023["requests"][requests_1.value]["assertions"][assertions_2.value], "value", null)
        }
      }
      dynamic "headers" {
        iterator = headers_2
        for_each = lookup(local.m_023["requests"][requests_1.value], "headers", null) == null ? [] : range(length(local.m_023["requests"][requests_1.value]["headers"]))
        content {
          key   = lookup(local.m_023["requests"][requests_1.value]["headers"][headers_2.value], "key", null)
          value = lookup(local.m_023["requests"][requests_1.value]["headers"][headers_2.value], "value", null)
        }
      }
      dynamic "variables" {
        iterator = variables_2
        for_each = lookup(local.m_023["requests"][requests_1.value], "variables", null) == null ? [] : range(length(local.m_023["requests"][requests_1.value]["variables"]))
        content {
          name  = lookup(local.m_023["requests"][requests_1.value]["variables"][variables_2.value], "name", null)
          value = lookup(local.m_023["requests"][requests_1.value]["variables"][variables_2.value], "value", null)
        }
      }
    }
  }
}
