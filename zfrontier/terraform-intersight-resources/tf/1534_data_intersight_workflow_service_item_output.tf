# Sample data source intersight_workflow_service_item_output — reads ../models/data_intersight_workflow_service_item_output.yml
locals { m1534 = yamldecode(file("${path.module}/../models/data_intersight_workflow_service_item_output.yml"))["data_intersight_workflow_service_item_output"] }

data "intersight_workflow_service_item_output" "n1534" {
  account_moid = try(local.m1534["account_moid"], null)
  additional_properties = try(local.m1534["additional_properties"], null)
  class_id = try(local.m1534["class_id"], null)
  create_time = try(local.m1534["create_time"], null)
  domain_group_moid = try(local.m1534["domain_group_moid"], null)
  id = try(local.m1534["id"], null)
  mod_time = try(local.m1534["mod_time"], null)
  moid = try(local.m1534["moid"], null)
  name = try(local.m1534["name"], null)
  object_type = try(local.m1534["object_type"], null)
  output = try(local.m1534["output"], null)
  owners = try(local.m1534["owners"], null)
  results = try(local.m1534["results"], null)
  shared_scope = try(local.m1534["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1534["ancestors"], null) == null ? [] : local.m1534["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1534["parent"], null) == null ? [] : local.m1534["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1534["permission_resources"], null) == null ? [] : local.m1534["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_item_instance" {
    for_each = try(local.m1534["service_item_instance"], null) == null ? [] : local.m1534["service_item_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1534["tags"], null) == null ? [] : local.m1534["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1534["version_context"], null) == null ? [] : local.m1534["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
