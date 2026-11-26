# 065 · resource catalystcenter_telemetry_settings · 3. Network settings and tags
# This resource can manage a Telemetry Settings.
# Reads models/catalystcenter_telemetry_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_065 = yamldecode(file("${path.module}/../models/catalystcenter_telemetry_settings.yml"))["catalystcenter_telemetry_settings"]
}

resource "catalystcenter_telemetry_settings" "n065" {
  enable_netflow_collector_on_devices = local.m_065["enable_netflow_collector_on_devices"]
  enable_wired_data_collection = local.m_065["enable_wired_data_collection"]
  enable_wireless_telemetry = local.m_065["enable_wireless_telemetry"]
  external_syslog_servers = local.m_065["external_syslog_servers"]
  external_trap_servers = local.m_065["external_trap_servers"]
  netflow_collector = local.m_065["netflow_collector"]
  netflow_collector_ip_address = local.m_065["netflow_collector_ip_address"]
  netflow_collector_port = local.m_065["netflow_collector_port"]
  site_id = local.m_065["site_id"]
  use_builtin_syslog_server = local.m_065["use_builtin_syslog_server"]
  use_builtin_trap_server = local.m_065["use_builtin_trap_server"]
}
