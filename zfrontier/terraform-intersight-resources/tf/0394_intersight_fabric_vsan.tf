# Sample resource intersight_fabric_vsan — reads ../models/intersight_fabric_vsan.yml
locals { m394 = yamldecode(file("${path.module}/../models/intersight_fabric_vsan.yml"))["intersight_fabric_vsan"] }

resource "intersight_fabric_vsan" "n394" {
  account_moid = try(local.m394["account_moid"], null)
  additional_properties = try(local.m394["additional_properties"], null)
  ancestors = try(local.m394["ancestors"], null)
  class_id = try(local.m394["class_id"], null)
  create_time = try(local.m394["create_time"], null)
  default_zoning = try(local.m394["default_zoning"], null)
  domain_group_moid = try(local.m394["domain_group_moid"], null)
  fc_network_policy = try(local.m394["fc_network_policy"], null)
  fc_zone_sharing_mode = try(local.m394["fc_zone_sharing_mode"], null)
  fcoe_vlan = try(local.m394["fcoe_vlan"], null)
  id = try(local.m394["id"], null)
  mod_time = try(local.m394["mod_time"], null)
  moid = try(local.m394["moid"], null)
  name = try(local.m394["name"], null)
  object_type = try(local.m394["object_type"], null)
  owners = try(local.m394["owners"], null)
  parent = try(local.m394["parent"], null)
  permission_resources = try(local.m394["permission_resources"], null)
  shared_scope = try(local.m394["shared_scope"], null)
  tags = try(local.m394["tags"], null)
  version_context = try(local.m394["version_context"], null)
  vsan_id = try(local.m394["vsan_id"], null)
  vsan_scope = try(local.m394["vsan_scope"], null)
}
