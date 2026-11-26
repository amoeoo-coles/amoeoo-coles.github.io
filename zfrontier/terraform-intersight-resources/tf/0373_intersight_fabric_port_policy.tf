# Sample resource intersight_fabric_port_policy — reads ../models/intersight_fabric_port_policy.yml
locals { m373 = yamldecode(file("${path.module}/../models/intersight_fabric_port_policy.yml"))["intersight_fabric_port_policy"] }

resource "intersight_fabric_port_policy" "n373" {
  account_moid = try(local.m373["account_moid"], null)
  additional_properties = try(local.m373["additional_properties"], null)
  ancestors = try(local.m373["ancestors"], null)
  class_id = try(local.m373["class_id"], null)
  create_time = try(local.m373["create_time"], null)
  description = try(local.m373["description"], null)
  device_model = try(local.m373["device_model"], null)
  domain_group_moid = try(local.m373["domain_group_moid"], null)
  id = try(local.m373["id"], null)
  mod_time = try(local.m373["mod_time"], null)
  moid = try(local.m373["moid"], null)
  name = try(local.m373["name"], null)
  object_type = try(local.m373["object_type"], null)
  organization = try(local.m373["organization"], null)
  owners = try(local.m373["owners"], null)
  parent = try(local.m373["parent"], null)
  permission_resources = try(local.m373["permission_resources"], null)
  profiles = try(local.m373["profiles"], null)
  shared_scope = try(local.m373["shared_scope"], null)
  tags = try(local.m373["tags"], null)
  version_context = try(local.m373["version_context"], null)
}
