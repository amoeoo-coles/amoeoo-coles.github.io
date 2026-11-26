# Sample resource intersight_fabric_fc_storage_role — reads ../models/intersight_fabric_fc_storage_role.yml
locals { m354 = yamldecode(file("${path.module}/../models/intersight_fabric_fc_storage_role.yml"))["intersight_fabric_fc_storage_role"] }

resource "intersight_fabric_fc_storage_role" "n354" {
  account_moid = try(local.m354["account_moid"], null)
  additional_properties = try(local.m354["additional_properties"], null)
  admin_speed = try(local.m354["admin_speed"], null)
  aggregate_port_id = try(local.m354["aggregate_port_id"], null)
  ancestors = try(local.m354["ancestors"], null)
  class_id = try(local.m354["class_id"], null)
  create_time = try(local.m354["create_time"], null)
  domain_group_moid = try(local.m354["domain_group_moid"], null)
  id = try(local.m354["id"], null)
  mod_time = try(local.m354["mod_time"], null)
  moid = try(local.m354["moid"], null)
  object_type = try(local.m354["object_type"], null)
  owners = try(local.m354["owners"], null)
  parent = try(local.m354["parent"], null)
  permission_resources = try(local.m354["permission_resources"], null)
  port_id = try(local.m354["port_id"], null)
  port_policy = try(local.m354["port_policy"], null)
  shared_scope = try(local.m354["shared_scope"], null)
  slot_id = try(local.m354["slot_id"], null)
  tags = try(local.m354["tags"], null)
  user_label = try(local.m354["user_label"], null)
  version_context = try(local.m354["version_context"], null)
  vsan_id = try(local.m354["vsan_id"], null)
}
