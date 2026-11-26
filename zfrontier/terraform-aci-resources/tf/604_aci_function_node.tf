# 604 · resource aci_function_node · 5. L4-L7 service graphs
# Manages ACI Function Node
# APIC class: not collected · DN: not collected
# Reads models/aci_function_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_604 = yamldecode(file("${path.module}/../models/aci_function_node.yml"))["aci_function_node"]
}

resource "aci_function_node" "n604" {
  annotation                                              = local.m_604["annotation"]
  description                                             = local.m_604["description"]
  func_template_type                                      = local.m_604["func_template_type"]
  func_type                                               = local.m_604["func_type"]
  is_copy                                                 = local.m_604["is_copy"]
  l4_l7_device_interface_consumer_attachment_notification = local.m_604["l4_l7_device_interface_consumer_attachment_notification"]
  l4_l7_device_interface_consumer_connector_type          = local.m_604["l4_l7_device_interface_consumer_connector_type"]
  l4_l7_device_interface_consumer_name                    = local.m_604["l4_l7_device_interface_consumer_name"]
  l4_l7_device_interface_provider_attachment_notification = local.m_604["l4_l7_device_interface_provider_attachment_notification"]
  l4_l7_device_interface_provider_connector_type          = local.m_604["l4_l7_device_interface_provider_connector_type"]
  l4_l7_device_interface_provider_name                    = local.m_604["l4_l7_device_interface_provider_name"]
  l4_l7_service_graph_template_dn                         = local.m_604["l4_l7_service_graph_template_dn"]
  managed                                                 = local.m_604["managed"]
  name                                                    = local.m_604["name"]
  name_alias                                              = local.m_604["name_alias"]
  relation_vns_rs_default_scope_to_term                   = local.m_604["relation_vns_rs_default_scope_to_term"]
  relation_vns_rs_node_to_abs_func_prof                   = local.m_604["relation_vns_rs_node_to_abs_func_prof"]
  relation_vns_rs_node_to_cloud_l_dev                     = local.m_604["relation_vns_rs_node_to_cloud_l_dev"]
  relation_vns_rs_node_to_l_dev                           = local.m_604["relation_vns_rs_node_to_l_dev"]
  relation_vns_rs_node_to_m_func                          = local.m_604["relation_vns_rs_node_to_m_func"]
  routing_mode                                            = local.m_604["routing_mode"]
  sequence_number                                         = local.m_604["sequence_number"]
  share_encap                                             = local.m_604["share_encap"]
}
