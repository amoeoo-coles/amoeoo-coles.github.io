# Sample data source intersight_servicenow_incident_doc — reads ../models/data_intersight_servicenow_incident_doc.yml
locals { m1166 = yamldecode(file("${path.module}/../models/data_intersight_servicenow_incident_doc.yml"))["data_intersight_servicenow_incident_doc"] }

data "intersight_servicenow_incident_doc" "n1166" {
  account_moid = try(local.m1166["account_moid"], null)
  additional_properties = try(local.m1166["additional_properties"], null)
  class_id = try(local.m1166["class_id"], null)
  create_time = try(local.m1166["create_time"], null)
  domain_group_moid = try(local.m1166["domain_group_moid"], null)
  example_value = try(local.m1166["example_value"], null)
  id = try(local.m1166["id"], null)
  internal_type = try(local.m1166["internal_type"], null)
  label = try(local.m1166["label"], null)
  mod_time = try(local.m1166["mod_time"], null)
  moid = try(local.m1166["moid"], null)
  object_type = try(local.m1166["object_type"], null)
  owners = try(local.m1166["owners"], null)
  property_name = try(local.m1166["property_name"], null)
  results = try(local.m1166["results"], null)
  shared_scope = try(local.m1166["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1166["ancestors"], null) == null ? [] : local.m1166["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1166["parent"], null) == null ? [] : local.m1166["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1166["permission_resources"], null) == null ? [] : local.m1166["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1166["registered_device"], null) == null ? [] : local.m1166["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1166["tags"], null) == null ? [] : local.m1166["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1166["version_context"], null) == null ? [] : local.m1166["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
