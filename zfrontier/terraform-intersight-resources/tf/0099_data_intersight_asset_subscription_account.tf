# Sample data source intersight_asset_subscription_account — reads ../models/data_intersight_asset_subscription_account.yml
locals { m099 = yamldecode(file("${path.module}/../models/data_intersight_asset_subscription_account.yml"))["data_intersight_asset_subscription_account"] }

data "intersight_asset_subscription_account" "n099" {
  account_moid = try(local.m099["account_moid"], null)
  additional_properties = try(local.m099["additional_properties"], null)
  class_id = try(local.m099["class_id"], null)
  create_time = try(local.m099["create_time"], null)
  domain_group_moid = try(local.m099["domain_group_moid"], null)
  id = try(local.m099["id"], null)
  mod_time = try(local.m099["mod_time"], null)
  moid = try(local.m099["moid"], null)
  object_type = try(local.m099["object_type"], null)
  owners = try(local.m099["owners"], null)
  results = try(local.m099["results"], null)
  shared_scope = try(local.m099["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m099["account"], null) == null ? [] : local.m099["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m099["ancestors"], null) == null ? [] : local.m099["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m099["parent"], null) == null ? [] : local.m099["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m099["permission_resources"], null) == null ? [] : local.m099["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m099["tags"], null) == null ? [] : local.m099["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m099["version_context"], null) == null ? [] : local.m099["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
