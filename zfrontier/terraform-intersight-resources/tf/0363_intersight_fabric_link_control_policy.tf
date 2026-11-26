# Sample resource intersight_fabric_link_control_policy — reads ../models/intersight_fabric_link_control_policy.yml
locals { m363 = yamldecode(file("${path.module}/../models/intersight_fabric_link_control_policy.yml"))["intersight_fabric_link_control_policy"] }

resource "intersight_fabric_link_control_policy" "n363" {
  account_moid = try(local.m363["account_moid"], null)
  additional_properties = try(local.m363["additional_properties"], null)
  ancestors = try(local.m363["ancestors"], null)
  class_id = try(local.m363["class_id"], null)
  create_time = try(local.m363["create_time"], null)
  description = try(local.m363["description"], null)
  domain_group_moid = try(local.m363["domain_group_moid"], null)
  id = try(local.m363["id"], null)
  mod_time = try(local.m363["mod_time"], null)
  moid = try(local.m363["moid"], null)
  name = try(local.m363["name"], null)
  object_type = try(local.m363["object_type"], null)
  organization = try(local.m363["organization"], null)
  owners = try(local.m363["owners"], null)
  parent = try(local.m363["parent"], null)
  permission_resources = try(local.m363["permission_resources"], null)
  shared_scope = try(local.m363["shared_scope"], null)
  tags = try(local.m363["tags"], null)
  udld_settings = try(local.m363["udld_settings"], null)
  version_context = try(local.m363["version_context"], null)
}
