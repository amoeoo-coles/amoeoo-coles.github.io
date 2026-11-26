# 028 · resource thousandeyes_alert_rule · 5. Alert rules
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_alert_rule.example_alert_rule id = "resource_id" } ```
# Reads models/thousandeyes_alert_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_028 = yamldecode(file("${path.module}/../models/thousandeyes_alert_rule.yml"))["thousandeyes_alert_rule"]
}

resource "thousandeyes_alert_rule" "n028" {
  alert_group_type = local.m_028["alert_group_type"]
  alert_type = local.m_028["alert_type"]
  direction = local.m_028["direction"]
  endpoint_agent_ids = local.m_028["endpoint_agent_ids"]
  endpoint_label_ids = local.m_028["endpoint_label_ids"]
  expression = local.m_028["expression"]
  id = local.m_028["id"]
  include_covered_prefixes = local.m_028["include_covered_prefixes"]
  is_default = local.m_028["is_default"]
  minimum_sources = local.m_028["minimum_sources"]
  minimum_sources_pct = local.m_028["minimum_sources_pct"]
  notify_on_clear = local.m_028["notify_on_clear"]
  rounds_violating_mode = local.m_028["rounds_violating_mode"]
  rounds_violating_out_of = local.m_028["rounds_violating_out_of"]
  rounds_violating_required = local.m_028["rounds_violating_required"]
  rule_name = local.m_028["rule_name"]
  sensitivity_level = local.m_028["sensitivity_level"]
  severity = local.m_028["severity"]
  visited_sites_filter = local.m_028["visited_sites_filter"]
  dynamic "notifications" {
    iterator = notifications_1
    for_each = local.m_028["notifications"] == null ? [] : range(length(local.m_028["notifications"]))
    content {
      dynamic "custom_webhook" {
        iterator = custom_webhook_2
        for_each = lookup(local.m_028["notifications"][notifications_1.value], "custom_webhook", null) == null ? [] : range(length(local.m_028["notifications"][notifications_1.value]["custom_webhook"]))
        content {
          integration_id = lookup(local.m_028["notifications"][notifications_1.value]["custom_webhook"][custom_webhook_2.value], "integration_id", null)
          integration_type = lookup(local.m_028["notifications"][notifications_1.value]["custom_webhook"][custom_webhook_2.value], "integration_type", null)
        }
      }
      dynamic "email" {
        iterator = email_2
        for_each = lookup(local.m_028["notifications"][notifications_1.value], "email", null) == null ? [] : range(length(local.m_028["notifications"][notifications_1.value]["email"]))
        content {
          message = lookup(local.m_028["notifications"][notifications_1.value]["email"][email_2.value], "message", null)
          recipients = lookup(local.m_028["notifications"][notifications_1.value]["email"][email_2.value], "recipients", null)
        }
      }
      dynamic "third_party" {
        iterator = third_party_2
        for_each = lookup(local.m_028["notifications"][notifications_1.value], "third_party", null) == null ? [] : range(length(local.m_028["notifications"][notifications_1.value]["third_party"]))
        content {
          integration_id = lookup(local.m_028["notifications"][notifications_1.value]["third_party"][third_party_2.value], "integration_id", null)
          integration_type = lookup(local.m_028["notifications"][notifications_1.value]["third_party"][third_party_2.value], "integration_type", null)
        }
      }
      dynamic "webhook" {
        iterator = webhook_2
        for_each = lookup(local.m_028["notifications"][notifications_1.value], "webhook", null) == null ? [] : range(length(local.m_028["notifications"][notifications_1.value]["webhook"]))
        content {
          integration_id = lookup(local.m_028["notifications"][notifications_1.value]["webhook"][webhook_2.value], "integration_id", null)
          integration_type = lookup(local.m_028["notifications"][notifications_1.value]["webhook"][webhook_2.value], "integration_type", null)
        }
      }
    }
  }
}
