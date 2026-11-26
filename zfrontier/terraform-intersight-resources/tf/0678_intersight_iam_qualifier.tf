# Sample resource intersight_iam_qualifier — reads ../models/intersight_iam_qualifier.yml
locals { m678 = yamldecode(file("${path.module}/../models/intersight_iam_qualifier.yml"))["intersight_iam_qualifier"] }

resource "intersight_iam_qualifier" "n678" {
  account_moid = try(local.m678["account_moid"], null)
  additional_properties = try(local.m678["additional_properties"], null)
  ancestors = try(local.m678["ancestors"], null)
  class_id = try(local.m678["class_id"], null)
  create_time = try(local.m678["create_time"], null)
  domain_group_moid = try(local.m678["domain_group_moid"], null)
  id = try(local.m678["id"], null)
  mod_time = try(local.m678["mod_time"], null)
  moid = try(local.m678["moid"], null)
  name = try(local.m678["name"], null)
  object_type = try(local.m678["object_type"], null)
  owners = try(local.m678["owners"], null)
  parent = try(local.m678["parent"], null)
  permission_resources = try(local.m678["permission_resources"], null)
  shared_scope = try(local.m678["shared_scope"], null)
  tags = try(local.m678["tags"], null)
  usergroup = try(local.m678["usergroup"], null)
  value = try(local.m678["value"], null)
  version_context = try(local.m678["version_context"], null)
}
