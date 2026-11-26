# 001 · resource sdwan_cloud_provider_settings · 1. Settings, users and access
# This resource can manage a Cloud Provider Settings . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_cloud_provider_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/sdwan_cloud_provider_settings.yml"))["sdwan_cloud_provider_settings"]
}

resource "sdwan_cloud_provider_settings" "n001" {
  cisco_sse_auth_key = try(var.secrets["sdwan_cloud_provider_settings.cisco_sse_auth_key"], local.m_001["cisco_sse_auth_key"])
  cisco_sse_auth_key_wo = local.m_001["cisco_sse_auth_key_wo"]
  cisco_sse_auth_key_wo_version = local.m_001["cisco_sse_auth_key_wo_version"]
  cisco_sse_auth_secret = try(var.secrets["sdwan_cloud_provider_settings.cisco_sse_auth_secret"], local.m_001["cisco_sse_auth_secret"])
  cisco_sse_auth_secret_wo = local.m_001["cisco_sse_auth_secret_wo"]
  cisco_sse_auth_secret_wo_version = local.m_001["cisco_sse_auth_secret_wo_version"]
  cisco_sse_context_sharing = local.m_001["cisco_sse_context_sharing"]
  cisco_sse_org_id = local.m_001["cisco_sse_org_id"]
  umbrella_auth_key_v2 = try(var.secrets["sdwan_cloud_provider_settings.umbrella_auth_key_v2"], local.m_001["umbrella_auth_key_v2"])
  umbrella_auth_key_v2_wo = local.m_001["umbrella_auth_key_v2_wo"]
  umbrella_auth_key_v2_wo_version = local.m_001["umbrella_auth_key_v2_wo_version"]
  umbrella_auth_secret_v2 = try(var.secrets["sdwan_cloud_provider_settings.umbrella_auth_secret_v2"], local.m_001["umbrella_auth_secret_v2"])
  umbrella_auth_secret_v2_wo = local.m_001["umbrella_auth_secret_v2_wo"]
  umbrella_auth_secret_v2_wo_version = local.m_001["umbrella_auth_secret_v2_wo_version"]
  umbrella_dns_auth_key = try(var.secrets["sdwan_cloud_provider_settings.umbrella_dns_auth_key"], local.m_001["umbrella_dns_auth_key"])
  umbrella_dns_auth_key_wo = local.m_001["umbrella_dns_auth_key_wo"]
  umbrella_dns_auth_key_wo_version = local.m_001["umbrella_dns_auth_key_wo_version"]
  umbrella_dns_auth_secret = try(var.secrets["sdwan_cloud_provider_settings.umbrella_dns_auth_secret"], local.m_001["umbrella_dns_auth_secret"])
  umbrella_dns_auth_secret_wo = local.m_001["umbrella_dns_auth_secret_wo"]
  umbrella_dns_auth_secret_wo_version = local.m_001["umbrella_dns_auth_secret_wo_version"]
  umbrella_org_id = local.m_001["umbrella_org_id"]
  umbrella_sig_auth_key = try(var.secrets["sdwan_cloud_provider_settings.umbrella_sig_auth_key"], local.m_001["umbrella_sig_auth_key"])
  umbrella_sig_auth_key_wo = local.m_001["umbrella_sig_auth_key_wo"]
  umbrella_sig_auth_key_wo_version = local.m_001["umbrella_sig_auth_key_wo_version"]
  umbrella_sig_auth_secret = try(var.secrets["sdwan_cloud_provider_settings.umbrella_sig_auth_secret"], local.m_001["umbrella_sig_auth_secret"])
  umbrella_sig_auth_secret_wo = local.m_001["umbrella_sig_auth_secret_wo"]
  umbrella_sig_auth_secret_wo_version = local.m_001["umbrella_sig_auth_secret_wo_version"]
  zscaler_organization = local.m_001["zscaler_organization"]
  zscaler_partner_base_uri = local.m_001["zscaler_partner_base_uri"]
  zscaler_partner_key = try(var.secrets["sdwan_cloud_provider_settings.zscaler_partner_key"], local.m_001["zscaler_partner_key"])
  zscaler_partner_key_wo = local.m_001["zscaler_partner_key_wo"]
  zscaler_partner_key_wo_version = local.m_001["zscaler_partner_key_wo_version"]
  zscaler_password = try(var.secrets["sdwan_cloud_provider_settings.zscaler_password"], local.m_001["zscaler_password"])
  zscaler_password_wo = local.m_001["zscaler_password_wo"]
  zscaler_password_wo_version = local.m_001["zscaler_password_wo_version"]
  zscaler_username = local.m_001["zscaler_username"]
}
