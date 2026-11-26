# Sample data source intersight_workflow_service_item_action_instance — reads ../models/data_intersight_workflow_service_item_action_instance.yml
locals { m1528 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_action_instance.yml"))["data_intersight_workflow_service_item_action_instance"] }

data "intersight_workflow_service_item_action_instance" "n1528" {
  account_moid = try(local.m1528["account_moid"], null)
  action = try(local.m1528["action"], null)
  additional_properties = try(local.m1528["additional_properties"], null)
  class_id = try(local.m1528["class_id"], null)
  create_time = try(local.m1528["create_time"], null)
  domain_group_moid = try(local.m1528["domain_group_moid"], null)
  end_time = try(local.m1528["end_time"], null)
  id = try(local.m1528["id"], null)
  input = try(local.m1528["input"], null)
  last_action = try(local.m1528["last_action"], null)
  mod_time = try(local.m1528["mod_time"], null)
  moid = try(local.m1528["moid"], null)
  name = try(local.m1528["name"], null)
  object_type = try(local.m1528["object_type"], null)
  owners = try(local.m1528["owners"], null)
  resourcelifecycle_status = try(local.m1528["resourcelifecycle_status"], null)
  results = try(local.m1528["results"], null)
  service_request_input = try(local.m1528["service_request_input"], null)
  shared_scope = try(local.m1528["shared_scope"], null)
  start_time = try(local.m1528["start_time"], null)
  status = try(local.m1528["status"], null)
  user_id_or_email = try(local.m1528["user_id_or_email"], null)
  dynamic "action_workflow_info" {
    for_each = try(local.m1528["action_workflow_info"], null) == null ? [] : local.m1528["action_workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1528["ancestors"], null) == null ? [] : local.m1528["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog_service_request" {
    for_each = try(local.m1528["catalog_service_request"], null) == null ? [] : local.m1528["catalog_service_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp" {
    for_each = try(local.m1528["idp"], null) == null ? [] : local.m1528["idp"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "idp_reference" {
    for_each = try(local.m1528["idp_reference"], null) == null ? [] : local.m1528["idp_reference"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "messages" {
    for_each = try(local.m1528["messages"], null) == null ? [] : local.m1528["messages"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1528["parent"], null) == null ? [] : local.m1528["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1528["permission_resources"], null) == null ? [] : local.m1528["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selection_criteria_inputs" {
    for_each = try(local.m1528["selection_criteria_inputs"], null) == null ? [] : local.m1528["selection_criteria_inputs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_action_definition" {
    for_each = try(local.m1528["service_item_action_definition"], null) == null ? [] : local.m1528["service_item_action_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_definition" {
    for_each = try(local.m1528["service_item_definition"], null) == null ? [] : local.m1528["service_item_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instance" {
    for_each = try(local.m1528["service_item_instance"], null) == null ? [] : local.m1528["service_item_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "stop_workflow_info" {
    for_each = try(local.m1528["stop_workflow_info"], null) == null ? [] : local.m1528["stop_workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1528["tags"], null) == null ? [] : local.m1528["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m1528["user"], null) == null ? [] : local.m1528["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_workflow_info" {
    for_each = try(local.m1528["validation_workflow_info"], null) == null ? [] : local.m1528["validation_workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1528["version_context"], null) == null ? [] : local.m1528["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
