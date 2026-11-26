# 418 · resource sdwan_cellular_controller_feature_template · 11. (Classic) feature templates
# This resource can manage a Cellular Controller feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cellular_controller_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_418 = yamldecode(file("${path.module}/../models/sdwan_cellular_controller_feature_template.yml"))["sdwan_cellular_controller_feature_template"]
}

resource "sdwan_cellular_controller_feature_template" "n418" {
  cellular_interface_id = local.m_418["cellular_interface_id"]
  cellular_interface_id_variable = local.m_418["cellular_interface_id_variable"]
  data_profiles = local.m_418["data_profiles"]
  description = local.m_418["description"]
  device_types = local.m_418["device_types"]
  firmware_auto_sim = local.m_418["firmware_auto_sim"]
  firmware_auto_sim_variable = local.m_418["firmware_auto_sim_variable"]
  name = local.m_418["name"]
  primary_sim_slot = local.m_418["primary_sim_slot"]
  primary_sim_slot_variable = local.m_418["primary_sim_slot_variable"]
  sim_failover_retries = local.m_418["sim_failover_retries"]
  sim_failover_retries_variable = local.m_418["sim_failover_retries_variable"]
  sim_failover_timeout = local.m_418["sim_failover_timeout"]
  sim_failover_timeout_variable = local.m_418["sim_failover_timeout_variable"]
}
