# Sample resource intersight_fabric_fc_uplink_role — reads ../models/intersight_fabric_fc_uplink_role.yml
locals { m356 = yamldecode(file("${path.module}/../models/intersight_fabric_fc_uplink_role.yml"))["intersight_fabric_fc_uplink_role"] }

resource "intersight_fabric_fc_uplink_role" "n356" {
  account_moid = try(local.m356["account_moid"], null)
  additional_properties = try(local.m356["additional_properties"], null)
  admin_speed = try(local.m356["admin_speed"], null)
  aggregate_port_id = try(local.m356["aggregate_port_id"], null)
  ancestors = try(local.m356["ancestors"], null)
  class_id = try(local.m356["class_id"], null)
  create_time = try(local.m356["create_time"], null)
  domain_group_moid = try(local.m356["domain_group_moid"], null)
  fill_pattern = try(local.m356["fill_pattern"], null)
  id = try(local.m356["id"], null)
  mod_time = try(local.m356["mod_time"], null)
  moid = try(local.m356["moid"], null)
  object_type = try(local.m356["object_type"], null)
  owners = try(local.m356["owners"], null)
  parent = try(local.m356["parent"], null)
  permission_resources = try(local.m356["permission_resources"], null)
  port_id = try(local.m356["port_id"], null)
  port_policy = try(local.m356["port_policy"], null)
  shared_scope = try(local.m356["shared_scope"], null)
  slot_id = try(local.m356["slot_id"], null)
  tags = try(local.m356["tags"], null)
  user_label = try(local.m356["user_label"], null)
  version_context = try(local.m356["version_context"], null)
  vsan_id = try(local.m356["vsan_id"], null)
}
