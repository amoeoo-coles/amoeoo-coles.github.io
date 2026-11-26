# Sample data source intersight_iam_end_point_user_policy — reads ../models/data_intersight_iam_end_point_user_policy.yml
locals { m702 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_user_policy.yml"))["data_intersight_iam_end_point_user_policy"] }

data "intersight_iam_end_point_user_policy" "n702" {
  account_lockout_duration = try(local.m702["account_lockout_duration"], null)
  account_lockout_threshold = try(local.m702["account_lockout_threshold"], null)
  account_moid = try(local.m702["account_moid"], null)
  account_unlock_mode = try(local.m702["account_unlock_mode"], null)
  additional_properties = try(local.m702["additional_properties"], null)
  class_id = try(local.m702["class_id"], null)
  create_time = try(local.m702["create_time"], null)
  description = try(local.m702["description"], null)
  domain_group_moid = try(local.m702["domain_group_moid"], null)
  id = try(local.m702["id"], null)
  mod_time = try(local.m702["mod_time"], null)
  moid = try(local.m702["moid"], null)
  name = try(local.m702["name"], null)
  object_type = try(local.m702["object_type"], null)
  owners = try(local.m702["owners"], null)
  results = try(local.m702["results"], null)
  shared_scope = try(local.m702["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m702["ancestors"], null) == null ? [] : local.m702["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user_roles" {
    for_each = try(local.m702["end_point_user_roles"], null) == null ? [] : local.m702["end_point_user_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m702["organization"], null) == null ? [] : local.m702["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m702["parent"], null) == null ? [] : local.m702["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "password_properties" {
    for_each = try(local.m702["password_properties"], null) == null ? [] : local.m702["password_properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m702["permission_resources"], null) == null ? [] : local.m702["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m702["profiles"], null) == null ? [] : local.m702["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m702["tags"], null) == null ? [] : local.m702["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m702["version_context"], null) == null ? [] : local.m702["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
