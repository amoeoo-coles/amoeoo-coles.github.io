# 412 · resource sdwan_cedge_multicast_feature_template · 11. (Classic) feature templates
# This resource can manage a cEdge Multicast feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cedge_multicast_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_412 = yamldecode(file("${path.module}/../models/sdwan_cedge_multicast_feature_template.yml"))["sdwan_cedge_multicast_feature_template"]
}

resource "sdwan_cedge_multicast_feature_template" "n412" {
  description = local.m_412["description"]
  device_types = local.m_412["device_types"]
  local_replicator = local.m_412["local_replicator"]
  local_replicator_variable = local.m_412["local_replicator_variable"]
  name = local.m_412["name"]
  spt_only = local.m_412["spt_only"]
  spt_only_variable = local.m_412["spt_only_variable"]
  threshold = local.m_412["threshold"]
  threshold_variable = local.m_412["threshold_variable"]
}
