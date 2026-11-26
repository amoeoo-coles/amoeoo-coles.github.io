# Sample data source intersight_iam_end_point_privilege — reads ../models/data_intersight_iam_end_point_privilege.yml
locals { m698 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_privilege.yml"))["data_intersight_iam_end_point_privilege"] }

data "intersight_iam_end_point_privilege" "n698" {
  account_moid = try(local.m698["account_moid"], null)
  additional_properties = try(local.m698["additional_properties"], null)
  class_id = try(local.m698["class_id"], null)
  create_time = try(local.m698["create_time"], null)
  description = try(local.m698["description"], null)
  domain_group_moid = try(local.m698["domain_group_moid"], null)
  id = try(local.m698["id"], null)
  mod_time = try(local.m698["mod_time"], null)
  moid = try(local.m698["moid"], null)
  name = try(local.m698["name"], null)
  object_type = try(local.m698["object_type"], null)
  owners = try(local.m698["owners"], null)
  results = try(local.m698["results"], null)
  shared_scope = try(local.m698["shared_scope"], null)
  type = try(local.m698["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m698["ancestors"], null) == null ? [] : local.m698["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m698["parent"], null) == null ? [] : local.m698["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m698["permission_resources"], null) == null ? [] : local.m698["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m698["system"], null) == null ? [] : local.m698["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m698["tags"], null) == null ? [] : local.m698["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m698["version_context"], null) == null ? [] : local.m698["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
