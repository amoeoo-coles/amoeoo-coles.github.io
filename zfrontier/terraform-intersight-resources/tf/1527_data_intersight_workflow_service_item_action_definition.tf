# Sample data source intersight_workflow_service_item_action_definition — reads ../models/data_intersight_workflow_service_item_action_definition.yml
locals { m1527 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_action_definition.yml"))["data_intersight_workflow_service_item_action_definition"] }

data "intersight_workflow_service_item_action_definition" "n1527" {
  account_moid = try(local.m1527["account_moid"], null)
  action_type = try(local.m1527["action_type"], null)
  additional_properties = try(local.m1527["additional_properties"], null)
  allowed_instance_states = try(local.m1527["allowed_instance_states"], null)
  attribute_parameters = try(local.m1527["attribute_parameters"], null)
  class_id = try(local.m1527["class_id"], null)
  create_time = try(local.m1527["create_time"], null)
  description = try(local.m1527["description"], null)
  domain_group_moid = try(local.m1527["domain_group_moid"], null)
  id = try(local.m1527["id"], null)
  label = try(local.m1527["label"], null)
  mod_time = try(local.m1527["mod_time"], null)
  moid = try(local.m1527["moid"], null)
  name = try(local.m1527["name"], null)
  object_type = try(local.m1527["object_type"], null)
  owners = try(local.m1527["owners"], null)
  periodicity = try(local.m1527["periodicity"], null)
  restrict_on_private_appliance = try(local.m1527["restrict_on_private_appliance"], null)
  results = try(local.m1527["results"], null)
  shared_scope = try(local.m1527["shared_scope"], null)
  user_id_or_email = try(local.m1527["user_id_or_email"], null)
  dynamic "action_properties" {
    for_each = try(local.m1527["action_properties"], null) == null ? [] : local.m1527["action_properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1527["ancestors"], null) == null ? [] : local.m1527["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_privilege_sets" {
    for_each = try(local.m1527["associated_privilege_sets"], null) == null ? [] : local.m1527["associated_privilege_sets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_roles" {
    for_each = try(local.m1527["associated_roles"], null) == null ? [] : local.m1527["associated_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "core_workflows" {
    for_each = try(local.m1527["core_workflows"], null) == null ? [] : local.m1527["core_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "input_definition" {
    for_each = try(local.m1527["input_definition"], null) == null ? [] : local.m1527["input_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1527["parent"], null) == null ? [] : local.m1527["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1527["permission_resources"], null) == null ? [] : local.m1527["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "post_core_workflows" {
    for_each = try(local.m1527["post_core_workflows"], null) == null ? [] : local.m1527["post_core_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pre_core_workflows" {
    for_each = try(local.m1527["pre_core_workflows"], null) == null ? [] : local.m1527["pre_core_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_definition" {
    for_each = try(local.m1527["service_item_definition"], null) == null ? [] : local.m1527["service_item_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "stop_workflows" {
    for_each = try(local.m1527["stop_workflows"], null) == null ? [] : local.m1527["stop_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1527["tags"], null) == null ? [] : local.m1527["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1527["validation_information"], null) == null ? [] : local.m1527["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_workflows" {
    for_each = try(local.m1527["validation_workflows"], null) == null ? [] : local.m1527["validation_workflows"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1527["version_context"], null) == null ? [] : local.m1527["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_definition" {
    for_each = try(local.m1527["workflow_definition"], null) == null ? [] : local.m1527["workflow_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
