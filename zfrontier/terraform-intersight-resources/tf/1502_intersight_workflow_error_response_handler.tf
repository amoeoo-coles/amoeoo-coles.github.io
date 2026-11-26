# Sample resource intersight_workflow_error_response_handler — reads ../models/intersight_workflow_error_response_handler.yml
locals { m1502 = yamldecode(file("${path.module}/../models/intersight_workflow_error_response_handler.yml"))["intersight_workflow_error_response_handler"] }

resource "intersight_workflow_error_response_handler" "n1502" {
  account_moid = try(local.m1502["account_moid"], null)
  additional_properties = try(local.m1502["additional_properties"], null)
  ancestors = try(local.m1502["ancestors"], null)
  catalog = try(local.m1502["catalog"], null)
  class_id = try(local.m1502["class_id"], null)
  create_time = try(local.m1502["create_time"], null)
  description = try(local.m1502["description"], null)
  domain_group_moid = try(local.m1502["domain_group_moid"], null)
  id = try(local.m1502["id"], null)
  mod_time = try(local.m1502["mod_time"], null)
  moid = try(local.m1502["moid"], null)
  name = try(local.m1502["name"], null)
  object_type = try(local.m1502["object_type"], null)
  owners = try(local.m1502["owners"], null)
  parameters = try(local.m1502["parameters"], null)
  parent = try(local.m1502["parent"], null)
  permission_resources = try(local.m1502["permission_resources"], null)
  platform_type = try(local.m1502["platform_type"], null)
  shared_scope = try(local.m1502["shared_scope"], null)
  tags = try(local.m1502["tags"], null)
  types = try(local.m1502["types"], null)
  version_context = try(local.m1502["version_context"], null)
}
