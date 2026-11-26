# Sample data source intersight_iam_end_point_user_role — reads ../models/data_intersight_iam_end_point_user_role.yml
locals { m704 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_user_role.yml"))["data_intersight_iam_end_point_user_role"] }

data "intersight_iam_end_point_user_role" "n704" {
  account_moid = try(local.m704["account_moid"], null)
  account_type_user_defined = try(local.m704["account_type_user_defined"], null)
  additional_properties = try(local.m704["additional_properties"], null)
  change_password = try(var.secrets["data_intersight_iam_end_point_user_role.change_password"], local.m704["change_password"])
  class_id = try(local.m704["class_id"], null)
  create_time = try(local.m704["create_time"], null)
  domain_group_moid = try(local.m704["domain_group_moid"], null)
  enabled = try(local.m704["enabled"], null)
  id = try(local.m704["id"], null)
  is_password_set = try(var.secrets["data_intersight_iam_end_point_user_role.is_password_set"], local.m704["is_password_set"])
  mod_time = try(local.m704["mod_time"], null)
  moid = try(local.m704["moid"], null)
  object_type = try(local.m704["object_type"], null)
  owners = try(local.m704["owners"], null)
  password = try(var.secrets["data_intersight_iam_end_point_user_role.password"], local.m704["password"])
  results = try(local.m704["results"], null)
  shared_scope = try(local.m704["shared_scope"], null)
  dynamic "account_types" {
    for_each = try(local.m704["account_types"], null) == null ? [] : local.m704["account_types"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m704["ancestors"], null) == null ? [] : local.m704["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_role" {
    for_each = try(local.m704["end_point_role"], null) == null ? [] : local.m704["end_point_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user" {
    for_each = try(local.m704["end_point_user"], null) == null ? [] : local.m704["end_point_user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user_policy" {
    for_each = try(local.m704["end_point_user_policy"], null) == null ? [] : local.m704["end_point_user_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m704["parent"], null) == null ? [] : local.m704["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m704["permission_resources"], null) == null ? [] : local.m704["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m704["tags"], null) == null ? [] : local.m704["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m704["version_context"], null) == null ? [] : local.m704["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
