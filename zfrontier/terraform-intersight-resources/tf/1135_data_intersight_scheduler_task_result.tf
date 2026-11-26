# Sample data source intersight_scheduler_task_result — reads ../models/data_intersight_scheduler_task_result.yml
locals { m1135 = yamldecode(file("${path.module}/../models/data_intersight_scheduler_task_result.yml"))["data_intersight_scheduler_task_result"] }

data "intersight_scheduler_task_result" "n1135" {
  account_moid = try(local.m1135["account_moid"], null)
  additional_properties = try(local.m1135["additional_properties"], null)
  class_id = try(local.m1135["class_id"], null)
  create_time = try(local.m1135["create_time"], null)
  domain_group_moid = try(local.m1135["domain_group_moid"], null)
  end_time = try(local.m1135["end_time"], null)
  id = try(local.m1135["id"], null)
  mod_time = try(local.m1135["mod_time"], null)
  moid = try(local.m1135["moid"], null)
  object_type = try(local.m1135["object_type"], null)
  owners = try(local.m1135["owners"], null)
  results = try(local.m1135["results"], null)
  shared_scope = try(local.m1135["shared_scope"], null)
  start_time = try(local.m1135["start_time"], null)
  time_zone = try(local.m1135["time_zone"], null)
  dynamic "ancestors" {
    for_each = try(local.m1135["ancestors"], null) == null ? [] : local.m1135["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_object" {
    for_each = try(local.m1135["associated_object"], null) == null ? [] : local.m1135["associated_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1135["parent"], null) == null ? [] : local.m1135["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1135["permission_resources"], null) == null ? [] : local.m1135["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "status_detail" {
    for_each = try(local.m1135["status_detail"], null) == null ? [] : local.m1135["status_detail"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1135["tags"], null) == null ? [] : local.m1135["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_schedule" {
    for_each = try(local.m1135["task_schedule"], null) == null ? [] : local.m1135["task_schedule"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1135["version_context"], null) == null ? [] : local.m1135["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
