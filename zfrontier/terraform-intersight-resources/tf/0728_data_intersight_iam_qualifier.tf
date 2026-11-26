# Sample data source intersight_iam_qualifier — reads ../models/data_intersight_iam_qualifier.yml
locals { m728 = yamldecode(file("${path.module}/../models/data_intersight_iam_qualifier.yml"))["data_intersight_iam_qualifier"] }

data "intersight_iam_qualifier" "n728" {
  account_moid = try(local.m728["account_moid"], null)
  additional_properties = try(local.m728["additional_properties"], null)
  class_id = try(local.m728["class_id"], null)
  create_time = try(local.m728["create_time"], null)
  domain_group_moid = try(local.m728["domain_group_moid"], null)
  id = try(local.m728["id"], null)
  mod_time = try(local.m728["mod_time"], null)
  moid = try(local.m728["moid"], null)
  name = try(local.m728["name"], null)
  object_type = try(local.m728["object_type"], null)
  owners = try(local.m728["owners"], null)
  results = try(local.m728["results"], null)
  shared_scope = try(local.m728["shared_scope"], null)
  value = try(local.m728["value"], null)
  dynamic "ancestors" {
    for_each = try(local.m728["ancestors"], null) == null ? [] : local.m728["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m728["parent"], null) == null ? [] : local.m728["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m728["permission_resources"], null) == null ? [] : local.m728["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m728["tags"], null) == null ? [] : local.m728["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usergroup" {
    for_each = try(local.m728["usergroup"], null) == null ? [] : local.m728["usergroup"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m728["version_context"], null) == null ? [] : local.m728["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
