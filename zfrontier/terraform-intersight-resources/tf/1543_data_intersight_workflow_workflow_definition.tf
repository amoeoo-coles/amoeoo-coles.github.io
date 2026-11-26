# Sample data source intersight_workflow_workflow_definition — reads ../models/data_intersight_workflow_workflow_definition.yml
locals { m1543 = yamldecode(file("${path.module}/../models/data_intersight_workflow_workflow_definition.yml"))["data_intersight_workflow_workflow_definition"] }

data "intersight_workflow_workflow_definition" "n1543" {
  account_moid = try(local.m1543["account_moid"], null)
  additional_properties = try(local.m1543["additional_properties"], null)
  class_id = try(local.m1543["class_id"], null)
  create_time = try(local.m1543["create_time"], null)
  create_user = try(local.m1543["create_user"], null)
  default_version = try(local.m1543["default_version"], null)
  description = try(local.m1543["description"], null)
  domain_group_moid = try(local.m1543["domain_group_moid"], null)
  id = try(local.m1543["id"], null)
  label = try(local.m1543["label"], null)
  license_entitlement = try(local.m1543["license_entitlement"], null)
  max_task_count = try(local.m1543["max_task_count"], null)
  max_worker_task_count = try(local.m1543["max_worker_task_count"], null)
  mod_time = try(local.m1543["mod_time"], null)
  mod_user = try(local.m1543["mod_user"], null)
  moid = try(local.m1543["moid"], null)
  name = try(local.m1543["name"], null)
  nr_version = try(local.m1543["nr_version"], null)
  object_type = try(local.m1543["object_type"], null)
  output_parameters = try(local.m1543["output_parameters"], null)
  owners = try(local.m1543["owners"], null)
  results = try(local.m1543["results"], null)
  shared_scope = try(local.m1543["shared_scope"], null)
  ui_rendering_data = try(local.m1543["ui_rendering_data"], null)
  dynamic "ancestors" {
    for_each = try(local.m1543["ancestors"], null) == null ? [] : local.m1543["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1543["catalog"], null) == null ? [] : local.m1543["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cloned_from" {
    for_each = try(local.m1543["cloned_from"], null) == null ? [] : local.m1543["cloned_from"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "input_definition" {
    for_each = try(local.m1543["input_definition"], null) == null ? [] : local.m1543["input_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "input_parameter_set" {
    for_each = try(local.m1543["input_parameter_set"], null) == null ? [] : local.m1543["input_parameter_set"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "output_definition" {
    for_each = try(local.m1543["output_definition"], null) == null ? [] : local.m1543["output_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1543["parent"], null) == null ? [] : local.m1543["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1543["permission_resources"], null) == null ? [] : local.m1543["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "properties" {
    for_each = try(local.m1543["properties"], null) == null ? [] : local.m1543["properties"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1543["tags"], null) == null ? [] : local.m1543["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tasks" {
    for_each = try(local.m1543["tasks"], null) == null ? [] : local.m1543["tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ui_input_filters" {
    for_each = try(local.m1543["ui_input_filters"], null) == null ? [] : local.m1543["ui_input_filters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1543["validation_information"], null) == null ? [] : local.m1543["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "variable_definition" {
    for_each = try(local.m1543["variable_definition"], null) == null ? [] : local.m1543["variable_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1543["version_context"], null) == null ? [] : local.m1543["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_metadata" {
    for_each = try(local.m1543["workflow_metadata"], null) == null ? [] : local.m1543["workflow_metadata"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
