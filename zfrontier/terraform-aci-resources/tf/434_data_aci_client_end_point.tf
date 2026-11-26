# 434 · data source aci_client_end_point · 3. Tenant and networking
# Data source for ACI Client End Point
# APIC class: not collected · DN: not collected
# Reads models/data_aci_client_end_point.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_434 = yamldecode(file("${path.module}/../models/data_aci_client_end_point.yml"))["data_aci_client_end_point"]
}

data "aci_client_end_point" "n434" {
  allow_empty_result = local.m_434["allow_empty_result"]
  annotation         = local.m_434["annotation"]
  description        = local.m_434["description"]
  filter_dn          = local.m_434["filter_dn"]
  ip                 = local.m_434["ip"]
  mac                = local.m_434["mac"]
  name               = local.m_434["name"]
  vlan               = local.m_434["vlan"]
  dynamic "fvcep_objects" {
    for_each = local.m_434["fvcep_objects"] == null ? [] : local.m_434["fvcep_objects"]
    content {
      application_profile_name = lookup(fvcep_objects.value, "application_profile_name", null)
      base_epg                 = lookup(fvcep_objects.value, "base_epg", null)
      endpoint_path            = lookup(fvcep_objects.value, "endpoint_path", null)
      epg_name                 = lookup(fvcep_objects.value, "epg_name", null)
      esg_name                 = lookup(fvcep_objects.value, "esg_name", null)
      instance_profile_name    = lookup(fvcep_objects.value, "instance_profile_name", null)
      ip                       = lookup(fvcep_objects.value, "ip", null)
      ips                      = lookup(fvcep_objects.value, "ips", null)
      l2out_name               = lookup(fvcep_objects.value, "l2out_name", null)
      mac                      = lookup(fvcep_objects.value, "mac", null)
      name                     = lookup(fvcep_objects.value, "name", null)
      tenant_name              = lookup(fvcep_objects.value, "tenant_name", null)
      vlan                     = lookup(fvcep_objects.value, "vlan", null)
      vrf_name                 = lookup(fvcep_objects.value, "vrf_name", null)
    }
  }
}

output "n434_data_aci_client_end_point_id" {
  value = data.aci_client_end_point.n434.id
}
