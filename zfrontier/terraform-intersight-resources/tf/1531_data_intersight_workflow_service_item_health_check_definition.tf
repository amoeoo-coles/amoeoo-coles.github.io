# Sample data source intersight_workflow_service_item_health_check_definition — reads ../models/data_intersight_workflow_service_item_health_check_definition.yml
locals { m1531 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_health_check_definition.yml"))["data_intersight_workflow_service_item_health_check_definition"] }

data "intersight_workflow_service_item_health_check_definition" "n1531" {
  account_moid = try(local.m1531["account_moid"], null)
  additional_properties = try(local.m1531["additional_properties"], null)
  category = try(local.m1531["category"], null)
  class_id = try(local.m1531["class_id"], null)
  common_cause_and_resolution = try(local.m1531["common_cause_and_resolution"], null)
  create_time = try(local.m1531["create_time"], null)
  description = try(local.m1531["description"], null)
  domain_group_moid = try(local.m1531["domain_group_moid"], null)
  execution_mode = try(local.m1531["execution_mode"], null)
  id = try(local.m1531["id"], null)
  label = try(local.m1531["label"], null)
  mod_time = try(local.m1531["mod_time"], null)
  moid = try(local.m1531["moid"], null)
  name = try(local.m1531["name"], null)
  object_type = try(local.m1531["object_type"], null)
  owners = try(local.m1531["owners"], null)
  results = try(local.m1531["results"], null)
  shared_scope = try(local.m1531["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1531["ancestors"], null) == null ? [] : local.m1531["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "health_check_workflow" {
    for_each = try(local.m1531["health_check_workflow"], null) == null ? [] : local.m1531["health_check_workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1531["parent"], null) == null ? [] : local.m1531["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1531["permission_resources"], null) == null ? [] : local.m1531["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_definition" {
    for_each = try(local.m1531["service_item_definition"], null) == null ? [] : local.m1531["service_item_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1531["tags"], null) == null ? [] : local.m1531["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1531["version_context"], null) == null ? [] : local.m1531["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
