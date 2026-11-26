# Sample data source intersight_iam_session_limits — reads ../models/data_intersight_iam_session_limits.yml
locals { m736 = yamldecode(file("${path.module}/../models/data_intersight_iam_session_limits.yml"))["data_intersight_iam_session_limits"] }

data "intersight_iam_session_limits" "n736" {
  account_moid = try(local.m736["account_moid"], null)
  additional_properties = try(local.m736["additional_properties"], null)
  class_id = try(local.m736["class_id"], null)
  create_time = try(local.m736["create_time"], null)
  domain_group_moid = try(local.m736["domain_group_moid"], null)
  id = try(local.m736["id"], null)
  idle_time_out = try(local.m736["idle_time_out"], null)
  maximum_limit = try(local.m736["maximum_limit"], null)
  mod_time = try(local.m736["mod_time"], null)
  moid = try(local.m736["moid"], null)
  object_type = try(local.m736["object_type"], null)
  owners = try(local.m736["owners"], null)
  per_user_limit = try(local.m736["per_user_limit"], null)
  results = try(local.m736["results"], null)
  session_time_out = try(local.m736["session_time_out"], null)
  shared_scope = try(local.m736["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m736["account"], null) == null ? [] : local.m736["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m736["ancestors"], null) == null ? [] : local.m736["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m736["parent"], null) == null ? [] : local.m736["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m736["permission"], null) == null ? [] : local.m736["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m736["permission_resources"], null) == null ? [] : local.m736["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m736["tags"], null) == null ? [] : local.m736["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m736["version_context"], null) == null ? [] : local.m736["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
