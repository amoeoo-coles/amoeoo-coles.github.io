# 009 · data source thousandeyes_bgp_monitor · 2. Agents and monitors
# - `id` (String) The ID of this resource. - `ip_address` (String) The IP address of the BGP monitor. - `monitor_type` (String) The type of BGP monitor (either Public or Private). - `network` (String) The name of the autonomous system in which the monitor is found.
# Reads models/data_thousandeyes_bgp_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/data_thousandeyes_bgp_monitor.yml"))["data_thousandeyes_bgp_monitor"]
}

data "thousandeyes_bgp_monitor" "n009" {
  id           = local.m_009["id"]
  monitor_id   = local.m_009["monitor_id"]
  monitor_name = local.m_009["monitor_name"]
}

output "n009_data_thousandeyes_bgp_monitor_id" {
  value = data.thousandeyes_bgp_monitor.n009.id
}
