# Sample data source intersight_capability_server_schema_descriptor — reads ../models/data_intersight_capability_server_schema_descriptor.yml
locals { m180 = yamldecode(file("${path.module}/../models/data_intersight_capability_server_schema_descriptor.yml"))["data_intersight_capability_server_schema_descriptor"] }

data "intersight_capability_server_schema_descriptor" "n180" {
  account_moid = try(local.m180["account_moid"], null)
  additional_properties = try(local.m180["additional_properties"], null)
  class_id = try(local.m180["class_id"], null)
  create_time = try(local.m180["create_time"], null)
  description = try(local.m180["description"], null)
  domain_group_moid = try(local.m180["domain_group_moid"], null)
  id = try(local.m180["id"], null)
  locator_led_name = try(local.m180["locator_led_name"], null)
  mod_time = try(local.m180["mod_time"], null)
  model = try(local.m180["model"], null)
  moid = try(local.m180["moid"], null)
  nr_version = try(local.m180["nr_version"], null)
  object_type = try(local.m180["object_type"], null)
  owners = try(local.m180["owners"], null)
  redfish_schema = try(local.m180["redfish_schema"], null)
  results = try(local.m180["results"], null)
  shared_scope = try(local.m180["shared_scope"], null)
  vendor = try(local.m180["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m180["ancestors"], null) == null ? [] : local.m180["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m180["capabilities"], null) == null ? [] : local.m180["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m180["parent"], null) == null ? [] : local.m180["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m180["permission_resources"], null) == null ? [] : local.m180["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m180["tags"], null) == null ? [] : local.m180["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m180["version_context"], null) == null ? [] : local.m180["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
