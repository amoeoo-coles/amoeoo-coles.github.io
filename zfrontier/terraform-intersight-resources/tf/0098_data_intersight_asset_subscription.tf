# Sample data source intersight_asset_subscription — reads ../models/data_intersight_asset_subscription.yml
locals { m098 = yamldecode(file("${path.module}/../models/data_intersight_asset_subscription.yml"))["data_intersight_asset_subscription"] }

data "intersight_asset_subscription" "n098" {
  account_moid = try(local.m098["account_moid"], null)
  additional_properties = try(local.m098["additional_properties"], null)
  application_name = try(local.m098["application_name"], null)
  class_id = try(local.m098["class_id"], null)
  create_time = try(local.m098["create_time"], null)
  domain_group_moid = try(local.m098["domain_group_moid"], null)
  id = try(local.m098["id"], null)
  mod_time = try(local.m098["mod_time"], null)
  moid = try(local.m098["moid"], null)
  object_type = try(local.m098["object_type"], null)
  owners = try(local.m098["owners"], null)
  results = try(local.m098["results"], null)
  shared_scope = try(local.m098["shared_scope"], null)
  subscription_ref_id = try(local.m098["subscription_ref_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m098["ancestors"], null) == null ? [] : local.m098["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "deployments" {
    for_each = try(local.m098["deployments"], null) == null ? [] : local.m098["deployments"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m098["parent"], null) == null ? [] : local.m098["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m098["permission_resources"], null) == null ? [] : local.m098["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "subscription_account" {
    for_each = try(local.m098["subscription_account"], null) == null ? [] : local.m098["subscription_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m098["tags"], null) == null ? [] : local.m098["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m098["version_context"], null) == null ? [] : local.m098["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
