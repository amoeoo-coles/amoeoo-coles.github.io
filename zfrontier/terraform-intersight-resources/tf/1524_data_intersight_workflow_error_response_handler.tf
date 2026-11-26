# Sample data source intersight_workflow_error_response_handler — reads ../models/data_intersight_workflow_error_response_handler.yml
locals { m1524 = yamldecode(file("${path.module}/../models/data_intersight_workflow_error_response_handler.yml"))["data_intersight_workflow_error_response_handler"] }

data "intersight_workflow_error_response_handler" "n1524" {
  account_moid = try(local.m1524["account_moid"], null)
  additional_properties = try(local.m1524["additional_properties"], null)
  class_id = try(local.m1524["class_id"], null)
  create_time = try(local.m1524["create_time"], null)
  description = try(local.m1524["description"], null)
  domain_group_moid = try(local.m1524["domain_group_moid"], null)
  id = try(local.m1524["id"], null)
  mod_time = try(local.m1524["mod_time"], null)
  moid = try(local.m1524["moid"], null)
  name = try(local.m1524["name"], null)
  object_type = try(local.m1524["object_type"], null)
  owners = try(local.m1524["owners"], null)
  platform_type = try(local.m1524["platform_type"], null)
  results = try(local.m1524["results"], null)
  shared_scope = try(local.m1524["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1524["ancestors"], null) == null ? [] : local.m1524["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1524["catalog"], null) == null ? [] : local.m1524["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parameters" {
    for_each = try(local.m1524["parameters"], null) == null ? [] : local.m1524["parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1524["parent"], null) == null ? [] : local.m1524["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1524["permission_resources"], null) == null ? [] : local.m1524["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1524["tags"], null) == null ? [] : local.m1524["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "types" {
    for_each = try(local.m1524["types"], null) == null ? [] : local.m1524["types"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1524["version_context"], null) == null ? [] : local.m1524["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
