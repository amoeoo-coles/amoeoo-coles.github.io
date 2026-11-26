# Sample data source intersight_openapi_task_generation_result — reads ../models/data_intersight_openapi_task_generation_result.yml
locals { m1025 = yamldecode(file("${path.module}/../models/data_intersight_openapi_task_generation_result.yml"))["data_intersight_openapi_task_generation_result"] }

data "intersight_openapi_task_generation_result" "n1025" {
  account_moid = try(local.m1025["account_moid"], null)
  additional_properties = try(local.m1025["additional_properties"], null)
  class_id = try(local.m1025["class_id"], null)
  create_time = try(local.m1025["create_time"], null)
  domain_group_moid = try(local.m1025["domain_group_moid"], null)
  failure_reason = try(local.m1025["failure_reason"], null)
  id = try(local.m1025["id"], null)
  mod_time = try(local.m1025["mod_time"], null)
  moid = try(local.m1025["moid"], null)
  object_type = try(local.m1025["object_type"], null)
  owners = try(local.m1025["owners"], null)
  results = try(local.m1025["results"], null)
  shared_scope = try(local.m1025["shared_scope"], null)
  task_display_name = try(local.m1025["task_display_name"], null)
  task_name = try(local.m1025["task_name"], null)
  task_status = try(local.m1025["task_status"], null)
  task_version = try(local.m1025["task_version"], null)
  dynamic "ancestors" {
    for_each = try(local.m1025["ancestors"], null) == null ? [] : local.m1025["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1025["parent"], null) == null ? [] : local.m1025["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1025["permission_resources"], null) == null ? [] : local.m1025["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1025["tags"], null) == null ? [] : local.m1025["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_generation_request" {
    for_each = try(local.m1025["task_generation_request"], null) == null ? [] : local.m1025["task_generation_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1025["version_context"], null) == null ? [] : local.m1025["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
