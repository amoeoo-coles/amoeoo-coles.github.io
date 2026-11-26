# Sample data source intersight_openapi_task_generation_request — reads ../models/data_intersight_openapi_task_generation_request.yml
locals { m1024 = yamldecode(file("${path.module}/../models/data_intersight_openapi_task_generation_request.yml"))["data_intersight_openapi_task_generation_request"] }

data "intersight_openapi_task_generation_request" "n1024" {
  account_moid = try(local.m1024["account_moid"], null)
  additional_properties = try(local.m1024["additional_properties"], null)
  class_id = try(local.m1024["class_id"], null)
  create_time = try(local.m1024["create_time"], null)
  domain_group_moid = try(local.m1024["domain_group_moid"], null)
  endpoint_type = try(local.m1024["endpoint_type"], null)
  id = try(local.m1024["id"], null)
  is_validate_request = try(local.m1024["is_validate_request"], null)
  mod_time = try(local.m1024["mod_time"], null)
  moid = try(local.m1024["moid"], null)
  object_type = try(local.m1024["object_type"], null)
  owners = try(local.m1024["owners"], null)
  protocol = try(local.m1024["protocol"], null)
  results = try(local.m1024["results"], null)
  shared_scope = try(local.m1024["shared_scope"], null)
  status = try(local.m1024["status"], null)
  task_prefix = try(local.m1024["task_prefix"], null)
  url = try(local.m1024["url"], null)
  dynamic "ancestors" {
    for_each = try(local.m1024["ancestors"], null) == null ? [] : local.m1024["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "failed_tasks" {
    for_each = try(local.m1024["failed_tasks"], null) == null ? [] : local.m1024["failed_tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "header_parameters" {
    for_each = try(local.m1024["header_parameters"], null) == null ? [] : local.m1024["header_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1024["nr_source"], null) == null ? [] : local.m1024["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1024["organization"], null) == null ? [] : local.m1024["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1024["parent"], null) == null ? [] : local.m1024["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1024["permission_resources"], null) == null ? [] : local.m1024["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "query_parameters" {
    for_each = try(local.m1024["query_parameters"], null) == null ? [] : local.m1024["query_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selected_apis" {
    for_each = try(local.m1024["selected_apis"], null) == null ? [] : local.m1024["selected_apis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1024["tags"], null) == null ? [] : local.m1024["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "task_tags" {
    for_each = try(local.m1024["task_tags"], null) == null ? [] : local.m1024["task_tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1024["version_context"], null) == null ? [] : local.m1024["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow" {
    for_each = try(local.m1024["workflow"], null) == null ? [] : local.m1024["workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
