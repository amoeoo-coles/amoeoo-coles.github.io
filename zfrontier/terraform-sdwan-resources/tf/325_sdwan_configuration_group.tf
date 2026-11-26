# 325 · resource sdwan_configuration_group · 9. Configuration, policy and topology groups
# This resource can manage a Configuration Group . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_configuration_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_325 = yamldecode(file("${path.module}/../models/sdwan_configuration_group.yml"))["sdwan_configuration_group"]
}

resource "sdwan_configuration_group" "n325" {
  description           = local.m_325["description"]
  feature_profile_ids   = local.m_325["feature_profile_ids"]
  feature_versions      = local.m_325["feature_versions"]
  name                  = local.m_325["name"]
  solution              = local.m_325["solution"]
  topology_devices      = local.m_325["topology_devices"]
  topology_site_devices = local.m_325["topology_site_devices"]
}
