# 161 · resource sdwan_transport_cellular_controller_feature · 6. Features: transport and management
# This resource can manage a Transport Cellular Controller Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_cellular_controller_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_161 = yamldecode(file("${path.module}/../models/sdwan_transport_cellular_controller_feature.yml"))["sdwan_transport_cellular_controller_feature"]
}

resource "sdwan_transport_cellular_controller_feature" "n161" {
  cellular_id                   = local.m_161["cellular_id"]
  cellular_id_variable          = local.m_161["cellular_id_variable"]
  description                   = local.m_161["description"]
  feature_profile_id            = local.m_161["feature_profile_id"]
  firmware_auto_sim             = local.m_161["firmware_auto_sim"]
  firmware_auto_sim_variable    = local.m_161["firmware_auto_sim_variable"]
  name                          = local.m_161["name"]
  primary_sim_slot              = local.m_161["primary_sim_slot"]
  primary_sim_slot_variable     = local.m_161["primary_sim_slot_variable"]
  sim_failover_retries          = local.m_161["sim_failover_retries"]
  sim_failover_retries_variable = local.m_161["sim_failover_retries_variable"]
  sim_failover_timeout          = local.m_161["sim_failover_timeout"]
  sim_failover_timeout_variable = local.m_161["sim_failover_timeout_variable"]
}
