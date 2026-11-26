# Sample resource intersight_fabric_san_pin_group — reads ../models/intersight_fabric_san_pin_group.yml
locals { m375 = yamldecode(file("${path.module}/../models/intersight_fabric_san_pin_group.yml"))["intersight_fabric_san_pin_group"] }

resource "intersight_fabric_san_pin_group" "n375" {
  account_moid = try(local.m375["account_moid"], null)
  additional_properties = try(local.m375["additional_properties"], null)
  ancestors = try(local.m375["ancestors"], null)
  class_id = try(local.m375["class_id"], null)
  create_time = try(local.m375["create_time"], null)
  domain_group_moid = try(local.m375["domain_group_moid"], null)
  id = try(local.m375["id"], null)
  mod_time = try(local.m375["mod_time"], null)
  moid = try(local.m375["moid"], null)
  name = try(local.m375["name"], null)
  object_type = try(local.m375["object_type"], null)
  owners = try(local.m375["owners"], null)
  parent = try(local.m375["parent"], null)
  permission_resources = try(local.m375["permission_resources"], null)
  pin_target_interface_role = try(local.m375["pin_target_interface_role"], null)
  port_policy = try(local.m375["port_policy"], null)
  shared_scope = try(local.m375["shared_scope"], null)
  tags = try(local.m375["tags"], null)
  version_context = try(local.m375["version_context"], null)
}
