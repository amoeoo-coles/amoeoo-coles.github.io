# Sample resource intersight_catalystsdwan_wan_edge_device_maintenance_check — reads ../models/intersight_catalystsdwan_wan_edge_device_maintenance_check.yml
locals { m198 = yamldecode(file("${path.module}/../models/intersight_catalystsdwan_wan_edge_device_maintenance_check.yml"))["intersight_catalystsdwan_wan_edge_device_maintenance_check"] }

resource "intersight_catalystsdwan_wan_edge_device_maintenance_check" "n198" {
  account_moid = try(local.m198["account_moid"], null)
  action = try(local.m198["action"], null)
  activities = try(local.m198["activities"], null)
  additional_properties = try(local.m198["additional_properties"], null)
  ancestors = try(local.m198["ancestors"], null)
  class_id = try(local.m198["class_id"], null)
  create_time = try(local.m198["create_time"], null)
  domain_group_moid = try(local.m198["domain_group_moid"], null)
  id = try(local.m198["id"], null)
  mod_time = try(local.m198["mod_time"], null)
  moid = try(local.m198["moid"], null)
  object_type = try(local.m198["object_type"], null)
  owners = try(local.m198["owners"], null)
  parent = try(local.m198["parent"], null)
  permission_resources = try(local.m198["permission_resources"], null)
  shared_scope = try(local.m198["shared_scope"], null)
  status = try(local.m198["status"], null)
  tags = try(local.m198["tags"], null)
  target_chassis = try(local.m198["target_chassis"], null)
  user = try(local.m198["user"], null)
  version_context = try(local.m198["version_context"], null)
  wait_for_completion = try(local.m198["wait_for_completion"], null)
  workflow_info = try(local.m198["workflow_info"], null)
}
