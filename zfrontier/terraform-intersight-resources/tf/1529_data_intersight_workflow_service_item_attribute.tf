# Sample data source intersight_workflow_service_item_attribute — reads ../models/data_intersight_workflow_service_item_attribute.yml
locals { m1529 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_attribute.yml"))["data_intersight_workflow_service_item_attribute"] }

data "intersight_workflow_service_item_attribute" "n1529" {
  account_moid = try(local.m1529["account_moid"], null)
  additional_properties = try(local.m1529["additional_properties"], null)
  attribute = try(local.m1529["attribute"], null)
  class_id = try(local.m1529["class_id"], null)
  create_time = try(local.m1529["create_time"], null)
  datatype = try(local.m1529["datatype"], null)
  domain_group_moid = try(local.m1529["domain_group_moid"], null)
  id = try(local.m1529["id"], null)
  mod_time = try(local.m1529["mod_time"], null)
  moid = try(local.m1529["moid"], null)
  name = try(local.m1529["name"], null)
  object_type = try(local.m1529["object_type"], null)
  owners = try(local.m1529["owners"], null)
  results = try(local.m1529["results"], null)
  shared_scope = try(local.m1529["shared_scope"], null)
  type = try(local.m1529["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1529["ancestors"], null) == null ? [] : local.m1529["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1529["parent"], null) == null ? [] : local.m1529["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1529["permission_resources"], null) == null ? [] : local.m1529["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_definition" {
    for_each = try(local.m1529["service_item_definition"], null) == null ? [] : local.m1529["service_item_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instance" {
    for_each = try(local.m1529["service_item_instance"], null) == null ? [] : local.m1529["service_item_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1529["tags"], null) == null ? [] : local.m1529["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1529["version_context"], null) == null ? [] : local.m1529["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
