# 410 · resource sdwan_cedge_igmp_feature_template · 11. (Classic) feature templates
# This resource can manage a cEdge IGMP feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cedge_igmp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_410 = yamldecode(file("${path.module}/../models/sdwan_cedge_igmp_feature_template.yml"))["sdwan_cedge_igmp_feature_template"]
}

resource "sdwan_cedge_igmp_feature_template" "n410" {
  description  = local.m_410["description"]
  device_types = local.m_410["device_types"]
  interfaces   = local.m_410["interfaces"]
  name         = local.m_410["name"]
}
