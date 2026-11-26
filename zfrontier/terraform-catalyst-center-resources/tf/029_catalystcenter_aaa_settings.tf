# 029 · resource catalystcenter_aaa_settings · 3. Network settings and tags
# This resource can manage an AAA Settings.
# Reads models/catalystcenter_aaa_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_029 = yamldecode(file("${path.module}/../models/catalystcenter_aaa_settings.yml"))["catalystcenter_aaa_settings"]
}

resource "catalystcenter_aaa_settings" "n029" {
  client_aaa_pan = local.m_029["client_aaa_pan"]
  client_aaa_primary_server_ip = local.m_029["client_aaa_primary_server_ip"]
  client_aaa_protocol = local.m_029["client_aaa_protocol"]
  client_aaa_secondary_server_ip = local.m_029["client_aaa_secondary_server_ip"]
  client_aaa_server_type = local.m_029["client_aaa_server_type"]
  client_aaa_shared_secret = local.m_029["client_aaa_shared_secret"]
  client_aaa_shared_secret_wo = try(var.secrets["catalystcenter_aaa_settings.client_aaa_shared_secret_wo"], local.m_029["client_aaa_shared_secret_wo"])
  client_aaa_shared_secret_wo_version = local.m_029["client_aaa_shared_secret_wo_version"]
  network_aaa_pan = local.m_029["network_aaa_pan"]
  network_aaa_primary_server_ip = local.m_029["network_aaa_primary_server_ip"]
  network_aaa_protocol = local.m_029["network_aaa_protocol"]
  network_aaa_secondary_server_ip = local.m_029["network_aaa_secondary_server_ip"]
  network_aaa_server_type = local.m_029["network_aaa_server_type"]
  network_aaa_shared_secret = local.m_029["network_aaa_shared_secret"]
  network_aaa_shared_secret_wo = try(var.secrets["catalystcenter_aaa_settings.network_aaa_shared_secret_wo"], local.m_029["network_aaa_shared_secret_wo"])
  network_aaa_shared_secret_wo_version = local.m_029["network_aaa_shared_secret_wo_version"]
  site_id = local.m_029["site_id"]
}
