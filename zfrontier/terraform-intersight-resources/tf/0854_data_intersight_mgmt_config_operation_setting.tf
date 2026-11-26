# Sample data source intersight_mgmt_config_operation_setting — reads ../models/data_intersight_mgmt_config_operation_setting.yml
locals { m854 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_operation_setting.yml"))["data_intersight_mgmt_config_operation_setting"] }

data "intersight_mgmt_config_operation_setting" "n854" {
  account_moid = try(local.m854["account_moid"], null)
  additional_properties = try(local.m854["additional_properties"], null)
  class_id = try(local.m854["class_id"], null)
  create_time = try(local.m854["create_time"], null)
  domain_group_moid = try(local.m854["domain_group_moid"], null)
  id = try(local.m854["id"], null)
  is_account_key_set = try(local.m854["is_account_key_set"], null)
  mod_time = try(local.m854["mod_time"], null)
  moid = try(local.m854["moid"], null)
  object_type = try(local.m854["object_type"], null)
  owners = try(local.m854["owners"], null)
  results = try(local.m854["results"], null)
  shared_scope = try(local.m854["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m854["account"], null) == null ? [] : local.m854["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m854["ancestors"], null) == null ? [] : local.m854["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m854["parent"], null) == null ? [] : local.m854["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m854["permission_resources"], null) == null ? [] : local.m854["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m854["tags"], null) == null ? [] : local.m854["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m854["version_context"], null) == null ? [] : local.m854["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
