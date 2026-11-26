# Sample resource intersight_fabric_fcoe_uplink_pc_role — reads ../models/intersight_fabric_fcoe_uplink_pc_role.yml
locals { m358 = yamldecode(file("${path.module}/../models/intersight_fabric_fcoe_uplink_pc_role.yml"))["intersight_fabric_fcoe_uplink_pc_role"] }

resource "intersight_fabric_fcoe_uplink_pc_role" "n358" {
  account_moid = try(local.m358["account_moid"], null)
  additional_properties = try(local.m358["additional_properties"], null)
  admin_speed = try(local.m358["admin_speed"], null)
  ancestors = try(local.m358["ancestors"], null)
  class_id = try(local.m358["class_id"], null)
  create_time = try(local.m358["create_time"], null)
  domain_group_moid = try(local.m358["domain_group_moid"], null)
  fec = try(local.m358["fec"], null)
  id = try(local.m358["id"], null)
  link_aggregation_policy = try(local.m358["link_aggregation_policy"], null)
  link_control_policy = try(local.m358["link_control_policy"], null)
  mod_time = try(local.m358["mod_time"], null)
  moid = try(local.m358["moid"], null)
  object_type = try(local.m358["object_type"], null)
  owners = try(local.m358["owners"], null)
  parent = try(local.m358["parent"], null)
  pc_id = try(local.m358["pc_id"], null)
  permission_resources = try(local.m358["permission_resources"], null)
  port_policy = try(local.m358["port_policy"], null)
  ports = try(local.m358["ports"], null)
  shared_scope = try(local.m358["shared_scope"], null)
  tags = try(local.m358["tags"], null)
  user_label = try(local.m358["user_label"], null)
  version_context = try(local.m358["version_context"], null)
}
