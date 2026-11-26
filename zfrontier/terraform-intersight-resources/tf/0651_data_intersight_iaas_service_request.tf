# Sample data source intersight_iaas_service_request — reads ../models/data_intersight_iaas_service_request.yml
locals { m651 = yamldecode(file("${path.module}/../models/data_intersight_iaas_service_request.yml"))["data_intersight_iaas_service_request"] }

data "intersight_iaas_service_request" "n651" {
  account_moid = try(local.m651["account_moid"], null)
  additional_properties = try(local.m651["additional_properties"], null)
  class_id = try(local.m651["class_id"], null)
  create_time = try(local.m651["create_time"], null)
  domain_group_moid = try(local.m651["domain_group_moid"], null)
  duration = try(local.m651["duration"], null)
  id = try(local.m651["id"], null)
  initiating_user = try(local.m651["initiating_user"], null)
  mod_time = try(local.m651["mod_time"], null)
  moid = try(local.m651["moid"], null)
  object_type = try(local.m651["object_type"], null)
  owners = try(local.m651["owners"], null)
  request_end_time = try(local.m651["request_end_time"], null)
  request_id = try(local.m651["request_id"], null)
  request_start_time = try(local.m651["request_start_time"], null)
  request_type = try(local.m651["request_type"], null)
  results = try(local.m651["results"], null)
  shared_scope = try(local.m651["shared_scope"], null)
  status = try(local.m651["status"], null)
  workflow_name = try(local.m651["workflow_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m651["ancestors"], null) == null ? [] : local.m651["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m651["parent"], null) == null ? [] : local.m651["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m651["permission_resources"], null) == null ? [] : local.m651["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m651["registered_device"], null) == null ? [] : local.m651["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m651["tags"], null) == null ? [] : local.m651["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m651["version_context"], null) == null ? [] : local.m651["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_steps" {
    for_each = try(local.m651["workflow_steps"], null) == null ? [] : local.m651["workflow_steps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
