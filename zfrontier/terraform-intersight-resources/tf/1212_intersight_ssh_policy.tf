# Sample resource intersight_ssh_policy — reads ../models/intersight_ssh_policy.yml
locals { m1212 = yamldecode(file("${path.module}/../models/intersight_ssh_policy.yml"))["intersight_ssh_policy"] }

resource "intersight_ssh_policy" "n1212" {
  account_moid = try(local.m1212["account_moid"], null)
  additional_properties = try(local.m1212["additional_properties"], null)
  ancestors = try(local.m1212["ancestors"], null)
  class_id = try(local.m1212["class_id"], null)
  create_time = try(local.m1212["create_time"], null)
  description = try(local.m1212["description"], null)
  domain_group_moid = try(local.m1212["domain_group_moid"], null)
  enabled = try(local.m1212["enabled"], null)
  id = try(local.m1212["id"], null)
  mod_time = try(local.m1212["mod_time"], null)
  moid = try(local.m1212["moid"], null)
  name = try(local.m1212["name"], null)
  object_type = try(local.m1212["object_type"], null)
  organization = try(local.m1212["organization"], null)
  owners = try(local.m1212["owners"], null)
  parent = try(local.m1212["parent"], null)
  permission_resources = try(local.m1212["permission_resources"], null)
  port = try(local.m1212["port"], null)
  profiles = try(local.m1212["profiles"], null)
  shared_scope = try(local.m1212["shared_scope"], null)
  tags = try(local.m1212["tags"], null)
  timeout = try(local.m1212["timeout"], null)
  version_context = try(local.m1212["version_context"], null)
}
