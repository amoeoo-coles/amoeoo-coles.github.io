# Sample resource intersight_workflow_template_parser — reads ../models/intersight_workflow_template_parser.yml
locals { m1513 = yamldecode(file("${path.module}/../models/intersight_workflow_template_parser.yml"))["intersight_workflow_template_parser"] }

resource "intersight_workflow_template_parser" "n1513" {
  account_moid = try(local.m1513["account_moid"], null)
  additional_properties = try(local.m1513["additional_properties"], null)
  ancestors = try(local.m1513["ancestors"], null)
  class_id = try(local.m1513["class_id"], null)
  create_time = try(local.m1513["create_time"], null)
  domain_group_moid = try(local.m1513["domain_group_moid"], null)
  id = try(local.m1513["id"], null)
  mod_time = try(local.m1513["mod_time"], null)
  moid = try(local.m1513["moid"], null)
  object_type = try(local.m1513["object_type"], null)
  owners = try(local.m1513["owners"], null)
  parent = try(local.m1513["parent"], null)
  permission_resources = try(local.m1513["permission_resources"], null)
  placeholders = try(local.m1513["placeholders"], null)
  shared_scope = try(local.m1513["shared_scope"], null)
  tags = try(local.m1513["tags"], null)
  template_content = try(local.m1513["template_content"], null)
  version_context = try(local.m1513["version_context"], null)
}
