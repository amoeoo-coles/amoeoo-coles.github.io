# 536 · resource sdwan_object_group_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Object Group Policy Definition .
# Reads models/sdwan_object_group_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_536 = yamldecode(file("${path.module}/../models/sdwan_object_group_policy_definition.yml"))["sdwan_object_group_policy_definition"]
}

resource "sdwan_object_group_policy_definition" "n536" {
  data_fqdn_prefix_list_id = local.m_536["data_fqdn_prefix_list_id"]
  data_fqdn_prefix_list_version = local.m_536["data_fqdn_prefix_list_version"]
  data_ipv4_prefix_list_id = local.m_536["data_ipv4_prefix_list_id"]
  data_ipv4_prefix_list_version = local.m_536["data_ipv4_prefix_list_version"]
  description = local.m_536["description"]
  fqdn = local.m_536["fqdn"]
  geo_location = local.m_536["geo_location"]
  geo_location_list_id = local.m_536["geo_location_list_id"]
  geo_location_list_version = local.m_536["geo_location_list_version"]
  ipv4_prefix = local.m_536["ipv4_prefix"]
  ipv4_prefix_variable = local.m_536["ipv4_prefix_variable"]
  name = local.m_536["name"]
  port = local.m_536["port"]
  port_list_id = local.m_536["port_list_id"]
  port_list_version = local.m_536["port_list_version"]
}
