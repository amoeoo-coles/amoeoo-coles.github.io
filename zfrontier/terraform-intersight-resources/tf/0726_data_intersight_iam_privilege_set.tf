# Sample data source intersight_iam_privilege_set — reads ../models/data_intersight_iam_privilege_set.yml
locals { m726 = yamldecode(file("${path.module}/../models/data_intersight_iam_privilege_set.yml"))["data_intersight_iam_privilege_set"] }

data "intersight_iam_privilege_set" "n726" {
  account_moid = try(local.m726["account_moid"], null)
  additional_properties = try(local.m726["additional_properties"], null)
  allow_future_updates = try(local.m726["allow_future_updates"], null)
  class_id = try(local.m726["class_id"], null)
  create_time = try(local.m726["create_time"], null)
  description = try(local.m726["description"], null)
  domain_group_moid = try(local.m726["domain_group_moid"], null)
  id = try(local.m726["id"], null)
  is_privilege_names_updated = try(local.m726["is_privilege_names_updated"], null)
  mod_time = try(local.m726["mod_time"], null)
  moid = try(local.m726["moid"], null)
  name = try(local.m726["name"], null)
  object_type = try(local.m726["object_type"], null)
  owners = try(local.m726["owners"], null)
  privilege_names = try(local.m726["privilege_names"], null)
  privilege_set_type = try(local.m726["privilege_set_type"], null)
  results = try(local.m726["results"], null)
  scope = try(local.m726["scope"], null)
  shared_scope = try(local.m726["shared_scope"], null)
  uuid = try(local.m726["uuid"], null)
  dynamic "account" {
    for_each = try(local.m726["account"], null) == null ? [] : local.m726["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m726["ancestors"], null) == null ? [] : local.m726["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_privilege_sets" {
    for_each = try(local.m726["associated_privilege_sets"], null) == null ? [] : local.m726["associated_privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m726["parent"], null) == null ? [] : local.m726["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m726["permission_resources"], null) == null ? [] : local.m726["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "privileges" {
    for_each = try(local.m726["privileges"], null) == null ? [] : local.m726["privileges"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m726["system"], null) == null ? [] : local.m726["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m726["tags"], null) == null ? [] : local.m726["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m726["version_context"], null) == null ? [] : local.m726["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
