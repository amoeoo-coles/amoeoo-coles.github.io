# 029 · data source thousandeyes_alert_rule · 5. Alert rules
# - `id` (String) The ID of this resource. - `rule_id` (String) The unique ID of the alert rule.
# Reads models/data_thousandeyes_alert_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_029 = yamldecode(file("${path.module}/../models/data_thousandeyes_alert_rule.yml"))["data_thousandeyes_alert_rule"]
}

data "thousandeyes_alert_rule" "n029" {
  id        = local.m_029["id"]
  rule_name = local.m_029["rule_name"]
}

output "n029_data_thousandeyes_alert_rule_id" {
  value = data.thousandeyes_alert_rule.n029.id
}
