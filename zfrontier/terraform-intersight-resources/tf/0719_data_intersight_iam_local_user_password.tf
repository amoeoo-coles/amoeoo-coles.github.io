# Sample data source intersight_iam_local_user_password — reads ../models/data_intersight_iam_local_user_password.yml
locals { m719 = yamldecode(file("${path.module}/../models/data_intersight_iam_local_user_password.yml"))["data_intersight_iam_local_user_password"] }

data "intersight_iam_local_user_password" "n719" {
  account_moid = try(local.m719["account_moid"], null)
  additional_properties = try(local.m719["additional_properties"], null)
  class_id = try(local.m719["class_id"], null)
  create_time = try(local.m719["create_time"], null)
  current_password = try(var.secrets["data_intersight_iam_local_user_password.current_password"], local.m719["current_password"])
  domain_group_moid = try(local.m719["domain_group_moid"], null)
  id = try(local.m719["id"], null)
  initial_password = try(var.secrets["data_intersight_iam_local_user_password.initial_password"], local.m719["initial_password"])
  is_current_password_set = try(var.secrets["data_intersight_iam_local_user_password.is_current_password_set"], local.m719["is_current_password_set"])
  is_initial_password_set = try(var.secrets["data_intersight_iam_local_user_password.is_initial_password_set"], local.m719["is_initial_password_set"])
  is_new_password_set = try(var.secrets["data_intersight_iam_local_user_password.is_new_password_set"], local.m719["is_new_password_set"])
  mod_time = try(local.m719["mod_time"], null)
  moid = try(local.m719["moid"], null)
  need_password_reset = try(var.secrets["data_intersight_iam_local_user_password.need_password_reset"], local.m719["need_password_reset"])
  new_password = try(var.secrets["data_intersight_iam_local_user_password.new_password"], local.m719["new_password"])
  object_type = try(local.m719["object_type"], null)
  owners = try(local.m719["owners"], null)
  password = try(var.secrets["data_intersight_iam_local_user_password.password"], local.m719["password"])
  password_expires_in_days = try(var.secrets["data_intersight_iam_local_user_password.password_expires_in_days"], local.m719["password_expires_in_days"])
  results = try(local.m719["results"], null)
  shared_scope = try(local.m719["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m719["ancestors"], null) == null ? [] : local.m719["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m719["parent"], null) == null ? [] : local.m719["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m719["permission_resources"], null) == null ? [] : local.m719["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m719["tags"], null) == null ? [] : local.m719["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m719["user"], null) == null ? [] : local.m719["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m719["version_context"], null) == null ? [] : local.m719["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
