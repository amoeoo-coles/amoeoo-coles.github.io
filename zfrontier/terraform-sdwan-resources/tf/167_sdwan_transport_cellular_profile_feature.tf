# 167 · resource sdwan_transport_cellular_profile_feature · 6. Features: transport and management
# This resource can manage a Transport Cellular Profile Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_cellular_profile_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_167 = yamldecode(file("${path.module}/../models/sdwan_transport_cellular_profile_feature.yml"))["sdwan_transport_cellular_profile_feature"]
}

resource "sdwan_transport_cellular_profile_feature" "n167" {
  access_point_name                 = local.m_167["access_point_name"]
  access_point_name_variable        = local.m_167["access_point_name_variable"]
  authentication_type               = local.m_167["authentication_type"]
  authentication_type_variable      = local.m_167["authentication_type_variable"]
  description                       = local.m_167["description"]
  feature_profile_id                = local.m_167["feature_profile_id"]
  name                              = local.m_167["name"]
  no_overwrite                      = local.m_167["no_overwrite"]
  no_overwrite_variable             = local.m_167["no_overwrite_variable"]
  packet_data_network_type          = local.m_167["packet_data_network_type"]
  packet_data_network_type_variable = local.m_167["packet_data_network_type_variable"]
  profile_id                        = local.m_167["profile_id"]
  profile_id_variable               = local.m_167["profile_id_variable"]
  profile_password                  = try(var.secrets["sdwan_transport_cellular_profile_feature.profile_password"], local.m_167["profile_password"])
  profile_password_variable         = local.m_167["profile_password_variable"]
  profile_password_wo               = local.m_167["profile_password_wo"]
  profile_password_wo_version       = local.m_167["profile_password_wo_version"]
  profile_username                  = local.m_167["profile_username"]
  profile_username_variable         = local.m_167["profile_username_variable"]
  requires_authentication           = local.m_167["requires_authentication"]
  slice_differentiator              = local.m_167["slice_differentiator"]
  slice_differentiator_variable     = local.m_167["slice_differentiator_variable"]
  slice_type                        = local.m_167["slice_type"]
  slice_type_variable               = local.m_167["slice_type_variable"]
}
