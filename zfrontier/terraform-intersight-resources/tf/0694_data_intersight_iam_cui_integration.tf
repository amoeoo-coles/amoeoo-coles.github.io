# Sample data source intersight_iam_cui_integration — reads ../models/data_intersight_iam_cui_integration.yml
locals { m694 = yamldecode(file("${path.module}/../models/data_intersight_iam_cui_integration.yml"))["data_intersight_iam_cui_integration"] }

data "intersight_iam_cui_integration" "n694" {
  account_moid = try(local.m694["account_moid"], null)
  additional_properties = try(local.m694["additional_properties"], null)
  cisco_cloud_control_inventory_sync = try(local.m694["cisco_cloud_control_inventory_sync"], null)
  class_id = try(local.m694["class_id"], null)
  create_time = try(local.m694["create_time"], null)
  domain_group_moid = try(local.m694["domain_group_moid"], null)
  id = try(local.m694["id"], null)
  last_full_sync_time = try(local.m694["last_full_sync_time"], null)
  last_notification_modified_time = try(local.m694["last_notification_modified_time"], null)
  mod_time = try(local.m694["mod_time"], null)
  moid = try(local.m694["moid"], null)
  object_type = try(local.m694["object_type"], null)
  opt_in = try(local.m694["opt_in"], null)
  opt_in_time = try(local.m694["opt_in_time"], null)
  opt_in_user_identity = try(local.m694["opt_in_user_identity"], null)
  owners = try(local.m694["owners"], null)
  results = try(local.m694["results"], null)
  shared_scope = try(local.m694["shared_scope"], null)
  sync_status = try(local.m694["sync_status"], null)
  tenant_id = try(local.m694["tenant_id"], null)
  dynamic "account" {
    for_each = try(local.m694["account"], null) == null ? [] : local.m694["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m694["ancestors"], null) == null ? [] : local.m694["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "linked_tenants" {
    for_each = try(local.m694["linked_tenants"], null) == null ? [] : local.m694["linked_tenants"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m694["parent"], null) == null ? [] : local.m694["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m694["permission_resources"], null) == null ? [] : local.m694["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m694["tags"], null) == null ? [] : local.m694["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m694["user"], null) == null ? [] : local.m694["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m694["version_context"], null) == null ? [] : local.m694["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
