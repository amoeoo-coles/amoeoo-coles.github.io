# 406 · resource sdwan_cedge_aaa_feature_template · 11. (Classic) feature templates
# This resource can manage a cEdge AAA feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cedge_aaa_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_406 = yamldecode(file("${path.module}/../models/sdwan_cedge_aaa_feature_template.yml"))["sdwan_cedge_aaa_feature_template"]
}

resource "sdwan_cedge_aaa_feature_template" "n406" {
  accounting_rules = local.m_406["accounting_rules"]
  authorization_config_commands = local.m_406["authorization_config_commands"]
  authorization_config_commands_variable = local.m_406["authorization_config_commands_variable"]
  authorization_console = local.m_406["authorization_console"]
  authorization_console_variable = local.m_406["authorization_console_variable"]
  authorization_rules = local.m_406["authorization_rules"]
  description = local.m_406["description"]
  device_types = local.m_406["device_types"]
  dot1x_accounting = local.m_406["dot1x_accounting"]
  dot1x_accounting_variable = local.m_406["dot1x_accounting_variable"]
  dot1x_authentication = local.m_406["dot1x_authentication"]
  dot1x_authentication_variable = local.m_406["dot1x_authentication_variable"]
  name = local.m_406["name"]
  radius_clients = local.m_406["radius_clients"]
  radius_dynamic_author_authentication_type = local.m_406["radius_dynamic_author_authentication_type"]
  radius_dynamic_author_authentication_type_variable = local.m_406["radius_dynamic_author_authentication_type_variable"]
  radius_dynamic_author_domain_stripping = local.m_406["radius_dynamic_author_domain_stripping"]
  radius_dynamic_author_domain_stripping_variable = local.m_406["radius_dynamic_author_domain_stripping_variable"]
  radius_dynamic_author_port = local.m_406["radius_dynamic_author_port"]
  radius_dynamic_author_port_variable = local.m_406["radius_dynamic_author_port_variable"]
  radius_dynamic_author_server_key = try(var.secrets["sdwan_cedge_aaa_feature_template.radius_dynamic_author_server_key"], local.m_406["radius_dynamic_author_server_key"])
  radius_dynamic_author_server_key_variable = local.m_406["radius_dynamic_author_server_key_variable"]
  radius_server_groups = local.m_406["radius_server_groups"]
  radius_trustsec_cts_authorization_list = local.m_406["radius_trustsec_cts_authorization_list"]
  radius_trustsec_cts_authorization_list_variable = local.m_406["radius_trustsec_cts_authorization_list_variable"]
  radius_trustsec_group = local.m_406["radius_trustsec_group"]
  server_groups_priority_order = local.m_406["server_groups_priority_order"]
  tacacs_server_groups = local.m_406["tacacs_server_groups"]
  users = local.m_406["users"]
}
