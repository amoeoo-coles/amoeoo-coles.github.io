# 637 · resource aci_cloud_l4_l7_third_party_device · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Cloud L4-L7 Third Party Device
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_l4_l7_third_party_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_637 = yamldecode(file("${path.module}/../models/aci_cloud_l4_l7_third_party_device.yml"))["aci_cloud_l4_l7_third_party_device"]
}

resource "aci_cloud_l4_l7_third_party_device" "n637" {
  aaa_domain_dn                          = local.m_637["aaa_domain_dn"]
  active_active                          = local.m_637["active_active"]
  annotation                             = local.m_637["annotation"]
  context_aware                          = local.m_637["context_aware"]
  custom_resource_group                  = local.m_637["custom_resource_group"]
  device_type                            = local.m_637["device_type"]
  function_type                          = local.m_637["function_type"]
  instance_count                         = local.m_637["instance_count"]
  is_copy                                = local.m_637["is_copy"]
  is_instantiation                       = local.m_637["is_instantiation"]
  l4l7_device_application_security_group = local.m_637["l4l7_device_application_security_group"]
  l4l7_third_party_device                = local.m_637["l4l7_third_party_device"]
  managed                                = local.m_637["managed"]
  name                                   = local.m_637["name"]
  name_alias                             = local.m_637["name_alias"]
  package_model                          = local.m_637["package_model"]
  promiscuous_mode                       = local.m_637["promiscuous_mode"]
  relation_cloud_rs_ldev_to_ctx          = local.m_637["relation_cloud_rs_ldev_to_ctx"]
  service_type                           = local.m_637["service_type"]
  target_mode                            = local.m_637["target_mode"]
  tenant_dn                              = local.m_637["tenant_dn"]
  trunking                               = local.m_637["trunking"]
  version                                = local.m_637["version"]
  dynamic "interface_selectors" {
    for_each = local.m_637["interface_selectors"] == null ? [] : local.m_637["interface_selectors"]
    content {
      allow_all = lookup(interface_selectors.value, "allow_all", null)
      name      = lookup(interface_selectors.value, "name", null)
      dynamic "end_point_selectors" {
        for_each = lookup(interface_selectors.value, "end_point_selectors", null) == null ? [] : interface_selectors.value["end_point_selectors"]
        content {
          match_expression = lookup(end_point_selectors.value, "match_expression", null)
          name             = lookup(end_point_selectors.value, "name", null)
        }
      }
    }
  }
}
