# 237 · resource sdwan_service_appqoe_feature · 7. Features: service
# appqoe_device_role selects which subtree is sent — forwarder_* for role forwarder, combined_* for forwarderAndServiceNode(WithDre), service_node_* for serviceNode(WithDre); attributes for the wrong role are silently dropped from the request and show as a permanent terraform plan diff. combined_con
# Reads models/sdwan_service_appqoe_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_237 = yamldecode(file("${path.module}/../models/sdwan_service_appqoe_feature.yml"))["sdwan_service_appqoe_feature"]
}

resource "sdwan_service_appqoe_feature" "n237" {
  appqoe_device_role = local.m_237["appqoe_device_role"]
  combined_controller_groups = local.m_237["combined_controller_groups"]
  combined_service_contexts = local.m_237["combined_service_contexts"]
  combined_service_node_groups = local.m_237["combined_service_node_groups"]
  description = local.m_237["description"]
  feature_profile_id = local.m_237["feature_profile_id"]
  forwarder_controller_groups = local.m_237["forwarder_controller_groups"]
  forwarder_service_contexts = local.m_237["forwarder_service_contexts"]
  forwarder_service_node_groups = local.m_237["forwarder_service_node_groups"]
  name = local.m_237["name"]
  service_node_service_node_groups = local.m_237["service_node_service_node_groups"]
  virtual_applications = local.m_237["virtual_applications"]
}
