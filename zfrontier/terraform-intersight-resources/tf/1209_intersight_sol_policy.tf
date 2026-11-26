# Sample resource intersight_sol_policy — reads ../models/intersight_sol_policy.yml
locals { m1209 = yamldecode(file("${path.module}/../models/intersight_sol_policy.yml"))["intersight_sol_policy"] }

resource "intersight_sol_policy" "n1209" {
  account_moid = try(local.m1209["account_moid"], null)
  additional_properties = try(local.m1209["additional_properties"], null)
  ancestors = try(local.m1209["ancestors"], null)
  baud_rate = try(local.m1209["baud_rate"], null)
  class_id = try(local.m1209["class_id"], null)
  com_port = try(local.m1209["com_port"], null)
  create_time = try(local.m1209["create_time"], null)
  description = try(local.m1209["description"], null)
  domain_group_moid = try(local.m1209["domain_group_moid"], null)
  enabled = try(local.m1209["enabled"], null)
  id = try(local.m1209["id"], null)
  mod_time = try(local.m1209["mod_time"], null)
  moid = try(local.m1209["moid"], null)
  name = try(local.m1209["name"], null)
  object_type = try(local.m1209["object_type"], null)
  organization = try(local.m1209["organization"], null)
  owners = try(local.m1209["owners"], null)
  parent = try(local.m1209["parent"], null)
  permission_resources = try(local.m1209["permission_resources"], null)
  profiles = try(local.m1209["profiles"], null)
  shared_scope = try(local.m1209["shared_scope"], null)
  ssh_port = try(local.m1209["ssh_port"], null)
  tags = try(local.m1209["tags"], null)
  version_context = try(local.m1209["version_context"], null)
}
