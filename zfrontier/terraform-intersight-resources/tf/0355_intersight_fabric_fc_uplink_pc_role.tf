# Sample resource intersight_fabric_fc_uplink_pc_role — reads ../models/intersight_fabric_fc_uplink_pc_role.yml
locals { m355 = yamldecode(file("${path.module}/../models/intersight_fabric_fc_uplink_pc_role.yml"))["intersight_fabric_fc_uplink_pc_role"] }

resource "intersight_fabric_fc_uplink_pc_role" "n355" {
  account_moid = try(local.m355["account_moid"], null)
  additional_properties = try(local.m355["additional_properties"], null)
  admin_speed = try(local.m355["admin_speed"], null)
  ancestors = try(local.m355["ancestors"], null)
  class_id = try(local.m355["class_id"], null)
  create_time = try(local.m355["create_time"], null)
  domain_group_moid = try(local.m355["domain_group_moid"], null)
  fill_pattern = try(local.m355["fill_pattern"], null)
  id = try(local.m355["id"], null)
  mod_time = try(local.m355["mod_time"], null)
  moid = try(local.m355["moid"], null)
  object_type = try(local.m355["object_type"], null)
  owners = try(local.m355["owners"], null)
  parent = try(local.m355["parent"], null)
  pc_id = try(local.m355["pc_id"], null)
  permission_resources = try(local.m355["permission_resources"], null)
  port_policy = try(local.m355["port_policy"], null)
  ports = try(local.m355["ports"], null)
  shared_scope = try(local.m355["shared_scope"], null)
  tags = try(local.m355["tags"], null)
  user_label = try(local.m355["user_label"], null)
  version_context = try(local.m355["version_context"], null)
  vsan_id = try(local.m355["vsan_id"], null)
}
