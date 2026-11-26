# Sample data source intersight_iam_user_qualifier — reads ../models/data_intersight_iam_user_qualifier.yml
locals { m745 = yamldecode(file("${path.module}/../models/data_intersight_iam_user_qualifier.yml"))["data_intersight_iam_user_qualifier"] }

data "intersight_iam_user_qualifier" "n745" {
  account_moid = try(local.m745["account_moid"], null)
  additional_properties = try(local.m745["additional_properties"], null)
  class_id = try(local.m745["class_id"], null)
  create_time = try(local.m745["create_time"], null)
  domain_group_moid = try(local.m745["domain_group_moid"], null)
  id = try(local.m745["id"], null)
  last_notification_time = try(local.m745["last_notification_time"], null)
  mod_time = try(local.m745["mod_time"], null)
  moid = try(local.m745["moid"], null)
  notification_scope = try(local.m745["notification_scope"], null)
  notify_guest_users = try(local.m745["notify_guest_users"], null)
  object_type = try(local.m745["object_type"], null)
  owners = try(local.m745["owners"], null)
  results = try(local.m745["results"], null)
  shared_scope = try(local.m745["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m745["ancestors"], null) == null ? [] : local.m745["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m745["parent"], null) == null ? [] : local.m745["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m745["permission_resources"], null) == null ? [] : local.m745["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m745["tags"], null) == null ? [] : local.m745["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user_details" {
    for_each = try(local.m745["user_details"], null) == null ? [] : local.m745["user_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "usergroup" {
    for_each = try(local.m745["usergroup"], null) == null ? [] : local.m745["usergroup"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m745["version_context"], null) == null ? [] : local.m745["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
