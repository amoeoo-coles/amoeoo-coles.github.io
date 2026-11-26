# Sample resource intersight_fabric_fcoe_uplink_role — reads ../models/intersight_fabric_fcoe_uplink_role.yml
locals { m359 = yamldecode(file("${path.module}/../models/intersight_fabric_fcoe_uplink_role.yml"))["intersight_fabric_fcoe_uplink_role"] }

resource "intersight_fabric_fcoe_uplink_role" "n359" {
  account_moid = try(local.m359["account_moid"], null)
  additional_properties = try(local.m359["additional_properties"], null)
  admin_speed = try(local.m359["admin_speed"], null)
  aggregate_port_id = try(local.m359["aggregate_port_id"], null)
  ancestors = try(local.m359["ancestors"], null)
  class_id = try(local.m359["class_id"], null)
  create_time = try(local.m359["create_time"], null)
  domain_group_moid = try(local.m359["domain_group_moid"], null)
  fec = try(local.m359["fec"], null)
  id = try(local.m359["id"], null)
  link_control_policy = try(local.m359["link_control_policy"], null)
  mod_time = try(local.m359["mod_time"], null)
  moid = try(local.m359["moid"], null)
  object_type = try(local.m359["object_type"], null)
  owners = try(local.m359["owners"], null)
  parent = try(local.m359["parent"], null)
  permission_resources = try(local.m359["permission_resources"], null)
  port_id = try(local.m359["port_id"], null)
  port_policy = try(local.m359["port_policy"], null)
  shared_scope = try(local.m359["shared_scope"], null)
  slot_id = try(local.m359["slot_id"], null)
  tags = try(local.m359["tags"], null)
  user_label = try(local.m359["user_label"], null)
  version_context = try(local.m359["version_context"], null)
}
