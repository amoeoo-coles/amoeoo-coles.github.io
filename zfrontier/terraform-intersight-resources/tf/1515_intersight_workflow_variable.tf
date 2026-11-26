# Sample resource intersight_workflow_variable — reads ../models/intersight_workflow_variable.yml
locals { m1515 = yamldecode(file("${path.module}/../models/intersight_workflow_variable.yml"))["intersight_workflow_variable"] }

resource "intersight_workflow_variable" "n1515" {
  account_moid = try(local.m1515["account_moid"], null)
  additional_properties = try(local.m1515["additional_properties"], null)
  ancestors = try(local.m1515["ancestors"], null)
  catalog = try(local.m1515["catalog"], null)
  class_id = try(local.m1515["class_id"], null)
  create_time = try(local.m1515["create_time"], null)
  create_user = try(local.m1515["create_user"], null)
  definition = try(local.m1515["definition"], null)
  domain_group_moid = try(local.m1515["domain_group_moid"], null)
  id = try(local.m1515["id"], null)
  mod_time = try(local.m1515["mod_time"], null)
  mod_user = try(local.m1515["mod_user"], null)
  moid = try(local.m1515["moid"], null)
  name = try(local.m1515["name"], null)
  object_type = try(local.m1515["object_type"], null)
  owners = try(local.m1515["owners"], null)
  parent = try(local.m1515["parent"], null)
  permission_resources = try(local.m1515["permission_resources"], null)
  shared_scope = try(local.m1515["shared_scope"], null)
  tags = try(local.m1515["tags"], null)
  value = try(local.m1515["value"], null)
  version_context = try(local.m1515["version_context"], null)
}
