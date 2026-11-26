# 444 · resource sdwan_cisco_sig_credentials_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco SIG Credentials feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_sig_credentials_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_444 = yamldecode(file("${path.module}/../models/sdwan_cisco_sig_credentials_feature_template.yml"))["sdwan_cisco_sig_credentials_feature_template"]
}

resource "sdwan_cisco_sig_credentials_feature_template" "n444" {
  description                       = local.m_444["description"]
  device_types                      = local.m_444["device_types"]
  name                              = local.m_444["name"]
  umbrella_api_key                  = try(var.secrets["sdwan_cisco_sig_credentials_feature_template.umbrella_api_key"], local.m_444["umbrella_api_key"])
  umbrella_api_key_variable         = local.m_444["umbrella_api_key_variable"]
  umbrella_api_secret               = try(var.secrets["sdwan_cisco_sig_credentials_feature_template.umbrella_api_secret"], local.m_444["umbrella_api_secret"])
  umbrella_api_secret_variable      = local.m_444["umbrella_api_secret_variable"]
  umbrella_organization_id          = local.m_444["umbrella_organization_id"]
  umbrella_organization_id_variable = local.m_444["umbrella_organization_id_variable"]
  zscaler_cloud_name                = local.m_444["zscaler_cloud_name"]
  zscaler_cloud_name_variable       = local.m_444["zscaler_cloud_name_variable"]
  zscaler_organization              = local.m_444["zscaler_organization"]
  zscaler_organization_variable     = local.m_444["zscaler_organization_variable"]
  zscaler_partner_api_key           = try(var.secrets["sdwan_cisco_sig_credentials_feature_template.zscaler_partner_api_key"], local.m_444["zscaler_partner_api_key"])
  zscaler_partner_api_key_variable  = local.m_444["zscaler_partner_api_key_variable"]
  zscaler_partner_base_uri          = local.m_444["zscaler_partner_base_uri"]
  zscaler_partner_base_uri_variable = local.m_444["zscaler_partner_base_uri_variable"]
  zscaler_partner_password          = try(var.secrets["sdwan_cisco_sig_credentials_feature_template.zscaler_partner_password"], local.m_444["zscaler_partner_password"])
  zscaler_partner_password_variable = local.m_444["zscaler_partner_password_variable"]
  zscaler_partner_username          = local.m_444["zscaler_partner_username"]
  zscaler_partner_username_variable = local.m_444["zscaler_partner_username_variable"]
  zscaler_password                  = try(var.secrets["sdwan_cisco_sig_credentials_feature_template.zscaler_password"], local.m_444["zscaler_password"])
  zscaler_password_variable         = local.m_444["zscaler_password_variable"]
  zscaler_username                  = local.m_444["zscaler_username"]
  zscaler_username_variable         = local.m_444["zscaler_username_variable"]
}
