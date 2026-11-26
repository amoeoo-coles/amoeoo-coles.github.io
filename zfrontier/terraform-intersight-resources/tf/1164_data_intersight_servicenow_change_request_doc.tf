# Sample data source intersight_servicenow_change_request_doc — reads ../models/data_intersight_servicenow_change_request_doc.yml
locals { m1164 = yamldecode(file("${path.module}/../models/data_intersight_servicenow_change_request_doc.yml"))["data_intersight_servicenow_change_request_doc"] }

data "intersight_servicenow_change_request_doc" "n1164" {
  account_moid = try(local.m1164["account_moid"], null)
  additional_properties = try(local.m1164["additional_properties"], null)
  class_id = try(local.m1164["class_id"], null)
  create_time = try(local.m1164["create_time"], null)
  domain_group_moid = try(local.m1164["domain_group_moid"], null)
  example_value = try(local.m1164["example_value"], null)
  id = try(local.m1164["id"], null)
  internal_type = try(local.m1164["internal_type"], null)
  label = try(local.m1164["label"], null)
  mod_time = try(local.m1164["mod_time"], null)
  moid = try(local.m1164["moid"], null)
  object_type = try(local.m1164["object_type"], null)
  owners = try(local.m1164["owners"], null)
  property_name = try(local.m1164["property_name"], null)
  results = try(local.m1164["results"], null)
  shared_scope = try(local.m1164["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1164["ancestors"], null) == null ? [] : local.m1164["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1164["parent"], null) == null ? [] : local.m1164["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1164["permission_resources"], null) == null ? [] : local.m1164["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1164["registered_device"], null) == null ? [] : local.m1164["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1164["tags"], null) == null ? [] : local.m1164["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1164["version_context"], null) == null ? [] : local.m1164["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
