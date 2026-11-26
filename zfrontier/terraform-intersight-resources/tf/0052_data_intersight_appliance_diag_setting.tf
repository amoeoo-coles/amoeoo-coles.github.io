# Sample data source intersight_appliance_diag_setting — reads ../models/data_intersight_appliance_diag_setting.yml
locals { m052 = yamldecode(file("${path.module}/../models/data_intersight_appliance_diag_setting.yml"))["data_intersight_appliance_diag_setting"] }

data "intersight_appliance_diag_setting" "n052" {
  account_moid = try(local.m052["account_moid"], null)
  additional_properties = try(local.m052["additional_properties"], null)
  class_id = try(local.m052["class_id"], null)
  create_time = try(local.m052["create_time"], null)
  domain_group_moid = try(local.m052["domain_group_moid"], null)
  id = try(local.m052["id"], null)
  is_password_set = try(var.secrets["data_intersight_appliance_diag_setting.is_password_set"], local.m052["is_password_set"])
  message = try(local.m052["message"], null)
  mod_time = try(local.m052["mod_time"], null)
  moid = try(local.m052["moid"], null)
  object_type = try(local.m052["object_type"], null)
  owners = try(local.m052["owners"], null)
  password = try(var.secrets["data_intersight_appliance_diag_setting.password"], local.m052["password"])
  results = try(local.m052["results"], null)
  shared_scope = try(local.m052["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m052["account"], null) == null ? [] : local.m052["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m052["ancestors"], null) == null ? [] : local.m052["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m052["parent"], null) == null ? [] : local.m052["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m052["permission_resources"], null) == null ? [] : local.m052["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m052["tags"], null) == null ? [] : local.m052["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m052["version_context"], null) == null ? [] : local.m052["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
