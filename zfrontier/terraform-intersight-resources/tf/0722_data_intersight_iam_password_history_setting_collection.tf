# Sample data source intersight_iam_password_history_setting_collection — reads ../models/data_intersight_iam_password_history_setting_collection.yml
locals { m722 = yamldecode(file("${path.module}/../models/data_intersight_iam_password_history_setting_collection.yml"))["data_intersight_iam_password_history_setting_collection"] }

data "intersight_iam_password_history_setting_collection" "n722" {
  account_moid = try(local.m722["account_moid"], null)
  additional_properties = try(local.m722["additional_properties"], null)
  class_id = try(local.m722["class_id"], null)
  create_time = try(local.m722["create_time"], null)
  domain_group_moid = try(local.m722["domain_group_moid"], null)
  id = try(local.m722["id"], null)
  mod_time = try(local.m722["mod_time"], null)
  moid = try(local.m722["moid"], null)
  object_type = try(local.m722["object_type"], null)
  orphaned = try(local.m722["orphaned"], null)
  owners = try(local.m722["owners"], null)
  password_history_window = try(var.secrets["data_intersight_iam_password_history_setting_collection.password_history_window"], local.m722["password_history_window"])
  results = try(local.m722["results"], null)
  shared_scope = try(local.m722["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m722["account"], null) == null ? [] : local.m722["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m722["ancestors"], null) == null ? [] : local.m722["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m722["parent"], null) == null ? [] : local.m722["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "password_history_objects" {
    for_each = try(local.m722["password_history_objects"], null) == null ? [] : local.m722["password_history_objects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m722["permission_resources"], null) == null ? [] : local.m722["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m722["policy"], null) == null ? [] : local.m722["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m722["profile"], null) == null ? [] : local.m722["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m722["server"], null) == null ? [] : local.m722["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m722["tags"], null) == null ? [] : local.m722["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m722["version_context"], null) == null ? [] : local.m722["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
