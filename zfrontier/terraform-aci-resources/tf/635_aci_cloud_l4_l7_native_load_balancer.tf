# 635 · resource aci_cloud_l4_l7_native_load_balancer · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Cloud L4-L7 Native Load Balancer
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_l4_l7_native_load_balancer.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_635 = yamldecode(file("${path.module}/../models/aci_cloud_l4_l7_native_load_balancer.yml"))["aci_cloud_l4_l7_native_load_balancer"]
}

resource "aci_cloud_l4_l7_native_load_balancer" "n635" {
  aaa_domain_dn                          = local.m_635["aaa_domain_dn"]
  active_active                          = local.m_635["active_active"]
  allow_all                              = local.m_635["allow_all"]
  annotation                             = local.m_635["annotation"]
  auto_scaling                           = local.m_635["auto_scaling"]
  cloud_l4l7_load_balancer_type          = local.m_635["cloud_l4l7_load_balancer_type"]
  context_aware                          = local.m_635["context_aware"]
  custom_resource_group                  = local.m_635["custom_resource_group"]
  device_type                            = local.m_635["device_type"]
  function_type                          = local.m_635["function_type"]
  instance_count                         = local.m_635["instance_count"]
  is_copy                                = local.m_635["is_copy"]
  is_instantiation                       = local.m_635["is_instantiation"]
  is_static_ip                           = local.m_635["is_static_ip"]
  l4l7_device_application_security_group = local.m_635["l4l7_device_application_security_group"]
  l4l7_third_party_device                = local.m_635["l4l7_third_party_device"]
  managed                                = local.m_635["managed"]
  max_instance_count                     = local.m_635["max_instance_count"]
  min_instance_count                     = local.m_635["min_instance_count"]
  name                                   = local.m_635["name"]
  name_alias                             = local.m_635["name_alias"]
  native_lb_name                         = local.m_635["native_lb_name"]
  package_model                          = local.m_635["package_model"]
  promiscuous_mode                       = local.m_635["promiscuous_mode"]
  relation_cloud_rs_ldev_to_cloud_subnet = local.m_635["relation_cloud_rs_ldev_to_cloud_subnet"]
  scheme                                 = local.m_635["scheme"]
  service_type                           = local.m_635["service_type"]
  size                                   = local.m_635["size"]
  sku                                    = local.m_635["sku"]
  static_ip_addresses                    = local.m_635["static_ip_addresses"]
  target_mode                            = local.m_635["target_mode"]
  tenant_dn                              = local.m_635["tenant_dn"]
  trunking                               = local.m_635["trunking"]
  version                                = local.m_635["version"]
}
