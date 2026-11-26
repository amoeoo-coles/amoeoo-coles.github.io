# Sample data source intersight_iaas_system_task_info — reads ../models/data_intersight_iaas_system_task_info.yml
locals { m652 = yamldecode(file("${path.module}/../models/data_intersight_iaas_system_task_info.yml"))["data_intersight_iaas_system_task_info"] }

data "intersight_iaas_system_task_info" "n652" {
  account_moid = try(local.m652["account_moid"], null)
  additional_properties = try(local.m652["additional_properties"], null)
  class_id = try(local.m652["class_id"], null)
  create_time = try(local.m652["create_time"], null)
  domain_group_moid = try(local.m652["domain_group_moid"], null)
  id = try(local.m652["id"], null)
  mod_time = try(local.m652["mod_time"], null)
  moid = try(local.m652["moid"], null)
  object_type = try(local.m652["object_type"], null)
  owners = try(local.m652["owners"], null)
  results = try(local.m652["results"], null)
  shared_scope = try(local.m652["shared_scope"], null)
  task_category = try(local.m652["task_category"], null)
  task_execution_count = try(local.m652["task_execution_count"], null)
  task_name = try(local.m652["task_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m652["ancestors"], null) == null ? [] : local.m652["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m652["guid"], null) == null ? [] : local.m652["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m652["parent"], null) == null ? [] : local.m652["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m652["permission_resources"], null) == null ? [] : local.m652["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m652["tags"], null) == null ? [] : local.m652["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m652["version_context"], null) == null ? [] : local.m652["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
