# Sample data source intersight_iam_end_point_user_role_inventory — reads ../models/data_intersight_iam_end_point_user_role_inventory.yml
locals { m705 = yamldecode(file("${path.module}/../models/data_intersight_iam_end_point_user_role_inventory.yml"))["data_intersight_iam_end_point_user_role_inventory"] }

data "intersight_iam_end_point_user_role_inventory" "n705" {
  account_moid = try(local.m705["account_moid"], null)
  account_type_user_defined = try(local.m705["account_type_user_defined"], null)
  additional_properties = try(local.m705["additional_properties"], null)
  change_password = try(var.secrets["data_intersight_iam_end_point_user_role_inventory.change_password"], local.m705["change_password"])
  class_id = try(local.m705["class_id"], null)
  create_time = try(local.m705["create_time"], null)
  device_mo_id = try(local.m705["device_mo_id"], null)
  domain_group_moid = try(local.m705["domain_group_moid"], null)
  enabled = try(local.m705["enabled"], null)
  id = try(local.m705["id"], null)
  is_password_set = try(var.secrets["data_intersight_iam_end_point_user_role_inventory.is_password_set"], local.m705["is_password_set"])
  mod_time = try(local.m705["mod_time"], null)
  moid = try(local.m705["moid"], null)
  object_type = try(local.m705["object_type"], null)
  owners = try(local.m705["owners"], null)
  password = try(var.secrets["data_intersight_iam_end_point_user_role_inventory.password"], local.m705["password"])
  results = try(local.m705["results"], null)
  shared_scope = try(local.m705["shared_scope"], null)
  dynamic "account_types" {
    for_each = try(local.m705["account_types"], null) == null ? [] : local.m705["account_types"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m705["ancestors"], null) == null ? [] : local.m705["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_role" {
    for_each = try(local.m705["end_point_role"], null) == null ? [] : local.m705["end_point_role"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user" {
    for_each = try(local.m705["end_point_user"], null) == null ? [] : local.m705["end_point_user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_point_user_policy" {
    for_each = try(local.m705["end_point_user_policy"], null) == null ? [] : local.m705["end_point_user_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m705["parent"], null) == null ? [] : local.m705["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m705["permission_resources"], null) == null ? [] : local.m705["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m705["tags"], null) == null ? [] : local.m705["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m705["version_context"], null) == null ? [] : local.m705["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
