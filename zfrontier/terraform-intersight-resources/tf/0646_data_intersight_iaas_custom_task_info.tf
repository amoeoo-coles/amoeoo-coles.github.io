# Sample data source intersight_iaas_custom_task_info — reads ../models/data_intersight_iaas_custom_task_info.yml
locals { m646 = yamldecode(file("${path.module}/../models/data_intersight_iaas_custom_task_info.yml"))["data_intersight_iaas_custom_task_info"] }

data "intersight_iaas_custom_task_info" "n646" {
  account_moid = try(local.m646["account_moid"], null)
  additional_properties = try(local.m646["additional_properties"], null)
  class_id = try(local.m646["class_id"], null)
  create_time = try(local.m646["create_time"], null)
  domain_group_moid = try(local.m646["domain_group_moid"], null)
  id = try(local.m646["id"], null)
  mod_time = try(local.m646["mod_time"], null)
  moid = try(local.m646["moid"], null)
  object_type = try(local.m646["object_type"], null)
  owners = try(local.m646["owners"], null)
  results = try(local.m646["results"], null)
  shared_scope = try(local.m646["shared_scope"], null)
  task_description = try(local.m646["task_description"], null)
  task_execution_count = try(local.m646["task_execution_count"], null)
  task_label = try(local.m646["task_label"], null)
  task_name = try(local.m646["task_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m646["ancestors"], null) == null ? [] : local.m646["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m646["guid"], null) == null ? [] : local.m646["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m646["parent"], null) == null ? [] : local.m646["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m646["permission_resources"], null) == null ? [] : local.m646["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m646["tags"], null) == null ? [] : local.m646["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m646["version_context"], null) == null ? [] : local.m646["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
