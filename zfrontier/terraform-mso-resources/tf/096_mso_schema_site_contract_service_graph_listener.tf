# 096 · resource mso_schema_site_contract_service_graph_listener · 9. Service graphs and devices
# Manages MSO Site Contract Service Graph Listener for the Azure Cloud Network Controller.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_contract_service_graph_listener.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_096 = yamldecode(file("${path.module}/../models/mso_schema_site_contract_service_graph_listener.yml"))["mso_schema_site_contract_service_graph_listener"]
}

resource "mso_schema_site_contract_service_graph_listener" "n096" {
  contract_name      = local.m_096["contract_name"]
  frontend_ip_dn     = local.m_096["frontend_ip_dn"]
  listener_name      = local.m_096["listener_name"]
  port               = local.m_096["port"]
  protocol           = local.m_096["protocol"]
  schema_id          = local.m_096["schema_id"]
  security_policy    = local.m_096["security_policy"]
  service_node_index = local.m_096["service_node_index"]
  site_id            = local.m_096["site_id"]
  template_name      = local.m_096["template_name"]
  dynamic "rules" {
    for_each = local.m_096["rules"] == null ? [] : local.m_096["rules"]
    content {
      action             = lookup(rules.value, "action", null)
      action_type        = lookup(rules.value, "action_type", null)
      content_type       = lookup(rules.value, "content_type", null)
      custom_url         = lookup(rules.value, "custom_url", null)
      floating_ip        = lookup(rules.value, "floating_ip", null)
      host               = lookup(rules.value, "host", null)
      name               = lookup(rules.value, "name", null)
      path               = lookup(rules.value, "path", null)
      port               = lookup(rules.value, "port", null)
      priority           = lookup(rules.value, "priority", null)
      protocol           = lookup(rules.value, "protocol", null)
      redirect_code      = lookup(rules.value, "redirect_code", null)
      redirect_host_name = lookup(rules.value, "redirect_host_name", null)
      redirect_path      = lookup(rules.value, "redirect_path", null)
      redirect_port      = lookup(rules.value, "redirect_port", null)
      redirect_protocol  = lookup(rules.value, "redirect_protocol", null)
      redirect_query     = lookup(rules.value, "redirect_query", null)
      response_body      = lookup(rules.value, "response_body", null)
      response_code      = lookup(rules.value, "response_code", null)
      target_ip_type     = lookup(rules.value, "target_ip_type", null)
      url_type           = lookup(rules.value, "url_type", null)
      dynamic "health_check" {
        for_each = lookup(rules.value, "health_check", null) == null ? [] : rules.value["health_check"]
        content {
          host                = lookup(health_check.value, "host", null)
          interval            = lookup(health_check.value, "interval", null)
          path                = lookup(health_check.value, "path", null)
          port                = lookup(health_check.value, "port", null)
          protocol            = lookup(health_check.value, "protocol", null)
          success_code        = lookup(health_check.value, "success_code", null)
          timeout             = lookup(health_check.value, "timeout", null)
          unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
          use_host_from_rule  = lookup(health_check.value, "use_host_from_rule", null)
        }
      }
      dynamic "provider_epg_ref" {
        for_each = lookup(rules.value, "provider_epg_ref", null) == null ? [] : rules.value["provider_epg_ref"]
        content {
          anp_name      = lookup(provider_epg_ref.value, "anp_name", null)
          epg_name      = lookup(provider_epg_ref.value, "epg_name", null)
          schema_id     = lookup(provider_epg_ref.value, "schema_id", null)
          template_name = lookup(provider_epg_ref.value, "template_name", null)
        }
      }
    }
  }
  dynamic "ssl_certificates" {
    for_each = local.m_096["ssl_certificates"] == null ? [] : local.m_096["ssl_certificates"]
    content {
      certificate_store = lookup(ssl_certificates.value, "certificate_store", null)
      name              = lookup(ssl_certificates.value, "name", null)
      target_dn         = lookup(ssl_certificates.value, "target_dn", null)
    }
  }
}
