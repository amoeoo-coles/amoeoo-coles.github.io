# Sample resource intersight_workflow_template_evaluation — reads ../models/intersight_workflow_template_evaluation.yml
locals { m1512 = yamldecode(file("${path.module}/../models/intersight_workflow_template_evaluation.yml"))["intersight_workflow_template_evaluation"] }

resource "intersight_workflow_template_evaluation" "n1512" {
  account_moid = try(local.m1512["account_moid"], null)
  additional_properties = try(local.m1512["additional_properties"], null)
  ancestors = try(local.m1512["ancestors"], null)
  class_id = try(local.m1512["class_id"], null)
  create_time = try(local.m1512["create_time"], null)
  domain_group_moid = try(local.m1512["domain_group_moid"], null)
  expected_output_data_type = try(local.m1512["expected_output_data_type"], null)
  id = try(local.m1512["id"], null)
  mod_time = try(local.m1512["mod_time"], null)
  moid = try(local.m1512["moid"], null)
  object_type = try(local.m1512["object_type"], null)
  output = try(local.m1512["output"], null)
  owners = try(local.m1512["owners"], null)
  parent = try(local.m1512["parent"], null)
  permission_resources = try(local.m1512["permission_resources"], null)
  preview_template = try(local.m1512["preview_template"], null)
  shared_scope = try(local.m1512["shared_scope"], null)
  stages = try(local.m1512["stages"], null)
  tags = try(local.m1512["tags"], null)
  values = try(local.m1512["values"], null)
  version_context = try(local.m1512["version_context"], null)
}
