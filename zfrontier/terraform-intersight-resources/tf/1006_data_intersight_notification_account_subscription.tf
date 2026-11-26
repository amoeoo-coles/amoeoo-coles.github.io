# Sample data source intersight_notification_account_subscription — reads ../models/data_intersight_notification_account_subscription.yml
locals { m1006 = yamldecode(file("${path.module}/../models/data_intersight_notification_account_subscription.yml"))["data_intersight_notification_account_subscription"] }

data "intersight_notification_account_subscription" "n1006" {
  account_moid = try(local.m1006["account_moid"], null)
  additional_properties = try(local.m1006["additional_properties"], null)
  class_id = try(local.m1006["class_id"], null)
  condition_operator = try(local.m1006["condition_operator"], null)
  create_time = try(local.m1006["create_time"], null)
  description = try(local.m1006["description"], null)
  domain_group_moid = try(local.m1006["domain_group_moid"], null)
  enabled = try(local.m1006["enabled"], null)
  id = try(local.m1006["id"], null)
  mod_time = try(local.m1006["mod_time"], null)
  moid = try(local.m1006["moid"], null)
  name = try(local.m1006["name"], null)
  object_type = try(local.m1006["object_type"], null)
  owners = try(local.m1006["owners"], null)
  results = try(local.m1006["results"], null)
  shared_scope = try(local.m1006["shared_scope"], null)
  type = try(local.m1006["type"], null)
  verify = try(local.m1006["verify"], null)
  dynamic "account" {
    for_each = try(local.m1006["account"], null) == null ? [] : local.m1006["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "actions" {
    for_each = try(local.m1006["actions"], null) == null ? [] : local.m1006["actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1006["ancestors"], null) == null ? [] : local.m1006["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m1006["certificate"], null) == null ? [] : local.m1006["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "conditions" {
    for_each = try(local.m1006["conditions"], null) == null ? [] : local.m1006["conditions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "filter_refs" {
    for_each = try(local.m1006["filter_refs"], null) == null ? [] : local.m1006["filter_refs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1006["parent"], null) == null ? [] : local.m1006["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1006["permission_resources"], null) == null ? [] : local.m1006["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1006["tags"], null) == null ? [] : local.m1006["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1006["version_context"], null) == null ? [] : local.m1006["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
