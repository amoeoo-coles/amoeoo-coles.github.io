# Sample resource intersight_hyperflex_capability_info — reads ../models/intersight_hyperflex_capability_info.yml
locals { m553 = yamldecode(file("${path.module}/../models/intersight_hyperflex_capability_info.yml"))["intersight_hyperflex_capability_info"] }

resource "intersight_hyperflex_capability_info" "n553" {
  account_moid = try(local.m553["account_moid"], null)
  additional_properties = try(local.m553["additional_properties"], null)
  ancestors = try(local.m553["ancestors"], null)
  app_catalog = try(local.m553["app_catalog"], null)
  capability_constraints = try(local.m553["capability_constraints"], null)
  class_id = try(local.m553["class_id"], null)
  create_time = try(local.m553["create_time"], null)
  domain_group_moid = try(local.m553["domain_group_moid"], null)
  id = try(local.m553["id"], null)
  mod_time = try(local.m553["mod_time"], null)
  moid = try(local.m553["moid"], null)
  name = try(local.m553["name"], null)
  object_type = try(local.m553["object_type"], null)
  owners = try(local.m553["owners"], null)
  parent = try(local.m553["parent"], null)
  permission_resources = try(local.m553["permission_resources"], null)
  shared_scope = try(local.m553["shared_scope"], null)
  tags = try(local.m553["tags"], null)
  value = try(local.m553["value"], null)
  version_context = try(local.m553["version_context"], null)
}
