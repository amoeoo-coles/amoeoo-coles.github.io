# Sample data source intersight_iam_local_user_password_policy — reads ../models/data_intersight_iam_local_user_password_policy.yml
locals { m720 = yamldecode(file("${path.module}/../models/data_intersight_iam_local_user_password_policy.yml"))["data_intersight_iam_local_user_password_policy"] }

data "intersight_iam_local_user_password_policy" "n720" {
  account_moid = try(local.m720["account_moid"], null)
  additional_properties = try(local.m720["additional_properties"], null)
  class_id = try(local.m720["class_id"], null)
  create_time = try(local.m720["create_time"], null)
  domain_group_moid = try(local.m720["domain_group_moid"], null)
  enable_lock_out_for_admin_user = try(local.m720["enable_lock_out_for_admin_user"], null)
  failed_login_tracker_window = try(local.m720["failed_login_tracker_window"], null)
  id = try(local.m720["id"], null)
  lock_out_time_period = try(local.m720["lock_out_time_period"], null)
  max_days_allowed_with_same_password = try(var.secrets["data_intersight_iam_local_user_password_policy.max_days_allowed_with_same_password"], local.m720["max_days_allowed_with_same_password"])
  max_failed_logins_allowed = try(local.m720["max_failed_logins_allowed"], null)
  min_char_difference = try(local.m720["min_char_difference"], null)
  min_days_between_password_change = try(var.secrets["data_intersight_iam_local_user_password_policy.min_days_between_password_change"], local.m720["min_days_between_password_change"])
  min_length_password = try(var.secrets["data_intersight_iam_local_user_password_policy.min_length_password"], local.m720["min_length_password"])
  min_lower_case = try(local.m720["min_lower_case"], null)
  min_numeric = try(local.m720["min_numeric"], null)
  min_special_char = try(local.m720["min_special_char"], null)
  min_upper_case = try(local.m720["min_upper_case"], null)
  mod_time = try(local.m720["mod_time"], null)
  moid = try(local.m720["moid"], null)
  num_previous_passwords_disallowed = try(var.secrets["data_intersight_iam_local_user_password_policy.num_previous_passwords_disallowed"], local.m720["num_previous_passwords_disallowed"])
  object_type = try(local.m720["object_type"], null)
  owners = try(local.m720["owners"], null)
  results = try(local.m720["results"], null)
  shared_scope = try(local.m720["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m720["account"], null) == null ? [] : local.m720["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m720["ancestors"], null) == null ? [] : local.m720["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m720["parent"], null) == null ? [] : local.m720["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m720["permission_resources"], null) == null ? [] : local.m720["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m720["tags"], null) == null ? [] : local.m720["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m720["version_context"], null) == null ? [] : local.m720["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
