# Sample resource intersight_workflow_ui_display_metadata — reads ../models/intersight_workflow_ui_display_metadata.yml
locals { m1514 = yamldecode(file("${path.module}/../models/intersight_workflow_ui_display_metadata.yml"))["intersight_workflow_ui_display_metadata"] }

resource "intersight_workflow_ui_display_metadata" "n1514" {
  account_moid = try(local.m1514["account_moid"], null)
  additional_properties = try(local.m1514["additional_properties"], null)
  ancestors = try(local.m1514["ancestors"], null)
  class_id = try(local.m1514["class_id"], null)
  create_time = try(local.m1514["create_time"], null)
  domain_group_moid = try(local.m1514["domain_group_moid"], null)
  id = try(local.m1514["id"], null)
  meta_definition = try(local.m1514["meta_definition"], null)
  mod_time = try(local.m1514["mod_time"], null)
  moid = try(local.m1514["moid"], null)
  object_type = try(local.m1514["object_type"], null)
  owners = try(local.m1514["owners"], null)
  parent = try(local.m1514["parent"], null)
  permission_resources = try(local.m1514["permission_resources"], null)
  shared_scope = try(local.m1514["shared_scope"], null)
  tags = try(local.m1514["tags"], null)
  ui_form_configs = try(local.m1514["ui_form_configs"], null)
  ui_view_configs = try(local.m1514["ui_view_configs"], null)
  version_context = try(local.m1514["version_context"], null)
}
