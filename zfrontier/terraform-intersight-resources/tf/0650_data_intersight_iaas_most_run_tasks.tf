# Sample data source intersight_iaas_most_run_tasks — reads ../models/data_intersight_iaas_most_run_tasks.yml
locals { m650 = yamldecode(file("${path.module}/../models/data_intersight_iaas_most_run_tasks.yml"))["data_intersight_iaas_most_run_tasks"] }

data "intersight_iaas_most_run_tasks" "n650" {
  account_moid = try(local.m650["account_moid"], null)
  additional_properties = try(local.m650["additional_properties"], null)
  class_id = try(local.m650["class_id"], null)
  create_time = try(local.m650["create_time"], null)
  domain_group_moid = try(local.m650["domain_group_moid"], null)
  id = try(local.m650["id"], null)
  mod_time = try(local.m650["mod_time"], null)
  moid = try(local.m650["moid"], null)
  object_type = try(local.m650["object_type"], null)
  owners = try(local.m650["owners"], null)
  results = try(local.m650["results"], null)
  shared_scope = try(local.m650["shared_scope"], null)
  task_category = try(local.m650["task_category"], null)
  task_execution_count = try(local.m650["task_execution_count"], null)
  task_name = try(local.m650["task_name"], null)
  task_type = try(local.m650["task_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m650["ancestors"], null) == null ? [] : local.m650["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m650["guid"], null) == null ? [] : local.m650["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m650["parent"], null) == null ? [] : local.m650["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m650["permission_resources"], null) == null ? [] : local.m650["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m650["tags"], null) == null ? [] : local.m650["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m650["version_context"], null) == null ? [] : local.m650["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
