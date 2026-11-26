# Sample resource intersight_fabric_lan_pin_group — reads ../models/intersight_fabric_lan_pin_group.yml
locals { m361 = yamldecode(file("${path.module}/../models/intersight_fabric_lan_pin_group.yml"))["intersight_fabric_lan_pin_group"] }

resource "intersight_fabric_lan_pin_group" "n361" {
  account_moid = try(local.m361["account_moid"], null)
  additional_properties = try(local.m361["additional_properties"], null)
  ancestors = try(local.m361["ancestors"], null)
  class_id = try(local.m361["class_id"], null)
  create_time = try(local.m361["create_time"], null)
  domain_group_moid = try(local.m361["domain_group_moid"], null)
  id = try(local.m361["id"], null)
  mod_time = try(local.m361["mod_time"], null)
  moid = try(local.m361["moid"], null)
  name = try(local.m361["name"], null)
  object_type = try(local.m361["object_type"], null)
  owners = try(local.m361["owners"], null)
  parent = try(local.m361["parent"], null)
  permission_resources = try(local.m361["permission_resources"], null)
  pin_target_interface_role = try(local.m361["pin_target_interface_role"], null)
  port_policy = try(local.m361["port_policy"], null)
  shared_scope = try(local.m361["shared_scope"], null)
  tags = try(local.m361["tags"], null)
  version_context = try(local.m361["version_context"], null)
}
