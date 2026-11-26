# 420 · resource sdwan_cellular_profile_feature_template · 11. (Classic) feature templates
# This resource can manage a Cellular Profile feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cellular_profile_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_420 = yamldecode(file("${path.module}/../models/sdwan_cellular_profile_feature_template.yml"))["sdwan_cellular_profile_feature_template"]
}

resource "sdwan_cellular_profile_feature_template" "n420" {
  access_point_name                 = local.m_420["access_point_name"]
  access_point_name_variable        = local.m_420["access_point_name_variable"]
  authentication_type               = local.m_420["authentication_type"]
  authentication_type_variable      = local.m_420["authentication_type_variable"]
  description                       = local.m_420["description"]
  device_types                      = local.m_420["device_types"]
  if_name                           = local.m_420["if_name"]
  if_name_variable                  = local.m_420["if_name_variable"]
  ip_address                        = local.m_420["ip_address"]
  ip_address_variable               = local.m_420["ip_address_variable"]
  name                              = local.m_420["name"]
  packet_data_network_type          = local.m_420["packet_data_network_type"]
  packet_data_network_type_variable = local.m_420["packet_data_network_type_variable"]
  primary_dns_address               = local.m_420["primary_dns_address"]
  primary_dns_address_variable      = local.m_420["primary_dns_address_variable"]
  profile_id                        = local.m_420["profile_id"]
  profile_id_variable               = local.m_420["profile_id_variable"]
  profile_name                      = local.m_420["profile_name"]
  profile_name_variable             = local.m_420["profile_name_variable"]
  profile_password                  = try(var.secrets["sdwan_cellular_profile_feature_template.profile_password"], local.m_420["profile_password"])
  profile_password_variable         = local.m_420["profile_password_variable"]
  profile_username                  = local.m_420["profile_username"]
  profile_username_variable         = local.m_420["profile_username_variable"]
  secondary_dns_address             = local.m_420["secondary_dns_address"]
  secondary_dns_address_variable    = local.m_420["secondary_dns_address_variable"]
}
