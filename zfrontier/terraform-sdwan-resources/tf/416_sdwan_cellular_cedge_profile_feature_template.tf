# 416 · resource sdwan_cellular_cedge_profile_feature_template · 11. (Classic) feature templates
# This resource can manage a Cellular cEdge Profile feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cellular_cedge_profile_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_416 = yamldecode(file("${path.module}/../models/sdwan_cellular_cedge_profile_feature_template.yml"))["sdwan_cellular_cedge_profile_feature_template"]
}

resource "sdwan_cellular_cedge_profile_feature_template" "n416" {
  access_point_name                 = local.m_416["access_point_name"]
  access_point_name_variable        = local.m_416["access_point_name_variable"]
  authentication_type               = local.m_416["authentication_type"]
  authentication_type_variable      = local.m_416["authentication_type_variable"]
  description                       = local.m_416["description"]
  device_types                      = local.m_416["device_types"]
  name                              = local.m_416["name"]
  no_overwrite                      = local.m_416["no_overwrite"]
  no_overwrite_variable             = local.m_416["no_overwrite_variable"]
  packet_data_network_type          = local.m_416["packet_data_network_type"]
  packet_data_network_type_variable = local.m_416["packet_data_network_type_variable"]
  profile_id                        = local.m_416["profile_id"]
  profile_id_variable               = local.m_416["profile_id_variable"]
  profile_password                  = try(var.secrets["sdwan_cellular_cedge_profile_feature_template.profile_password"], local.m_416["profile_password"])
  profile_password_variable         = local.m_416["profile_password_variable"]
  profile_username                  = local.m_416["profile_username"]
  profile_username_variable         = local.m_416["profile_username_variable"]
}
