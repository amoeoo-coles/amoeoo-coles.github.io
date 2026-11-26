# Sample resource intersight_fabric_pc_operation — reads ../models/intersight_fabric_pc_operation.yml
locals { m370 = yamldecode(file("${path.module}/../models/intersight_fabric_pc_operation.yml"))["intersight_fabric_pc_operation"] }

resource "intersight_fabric_pc_operation" "n370" {
  account_moid = try(local.m370["account_moid"], null)
  additional_properties = try(local.m370["additional_properties"], null)
  admin_action = try(local.m370["admin_action"], null)
  admin_state = try(local.m370["admin_state"], null)
  ancestors = try(local.m370["ancestors"], null)
  class_id = try(local.m370["class_id"], null)
  config_state = try(local.m370["config_state"], null)
  create_time = try(local.m370["create_time"], null)
  domain_group_moid = try(local.m370["domain_group_moid"], null)
  id = try(local.m370["id"], null)
  mod_time = try(local.m370["mod_time"], null)
  moid = try(local.m370["moid"], null)
  network_element = try(local.m370["network_element"], null)
  object_type = try(local.m370["object_type"], null)
  owners = try(local.m370["owners"], null)
  parent = try(local.m370["parent"], null)
  pc_id = try(local.m370["pc_id"], null)
  permission_resources = try(local.m370["permission_resources"], null)
  shared_scope = try(local.m370["shared_scope"], null)
  tags = try(local.m370["tags"], null)
  user_label = try(local.m370["user_label"], null)
  version_context = try(local.m370["version_context"], null)
}
