# Sample data source intersight_iam_end_point_user_policy_inventory — reads ../models/data_intersight_iam_end_point_user_policy_inventory.yml
locals { m703 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_user_policy_inventory.yml"))["data_intersight_iam_end_point_user_policy_inventory"] }

data "intersight_iam_end_point_user_policy_inventory" "n703" {
  account_lockout_duration = try(local.m703["account_lockout_duration"], null)
  account_lockout_threshold = try(local.m703["account_lockout_threshold"], null)
  account_moid = try(local.m703["account_moid"], null)
  account_unlock_mode = try(local.m703["account_unlock_mode"], null)
  additional_properties = try(local.m703["additional_properties"], null)
  class_id = try(local.m703["class_id"], null)
  create_time = try(local.m703["create_time"], null)
  description = try(local.m703["description"], null)
  device_mo_id = try(local.m703["device_mo_id"], null)
  domain_group_moid = try(local.m703["domain_group_moid"], null)
  id = try(local.m703["id"], null)
  mod_time = try(local.m703["mod_time"], null)
  moid = try(local.m703["moid"], null)
  name = try(local.m703["name"], null)
  object_type = try(local.m703["object_type"], null)
  owners = try(local.m703["owners"], null)
  results = try(local.m703["results"], null)
  shared_scope = try(local.m703["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m703["ancestors"], null) == null ? [] : local.m703["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user_roles" {
    for_each = try(local.m703["end_point_user_roles"], null) == null ? [] : local.m703["end_point_user_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m703["parent"], null) == null ? [] : local.m703["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "password_properties" {
    for_each = try(local.m703["password_properties"], null) == null ? [] : local.m703["password_properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m703["permission_resources"], null) == null ? [] : local.m703["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m703["tags"], null) == null ? [] : local.m703["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m703["target_mo"], null) == null ? [] : local.m703["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m703["version_context"], null) == null ? [] : local.m703["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
