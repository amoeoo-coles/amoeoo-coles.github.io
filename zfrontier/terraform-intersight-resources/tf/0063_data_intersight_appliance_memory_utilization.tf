# Sample data source intersight_appliance_memory_utilization — reads ../models/data_intersight_appliance_memory_utilization.yml
locals { m063 = yamldecode(file("${path.module}/../models/data_intersight_appliance_memory_utilization.yml"))["data_intersight_appliance_memory_utilization"] }

data "intersight_appliance_memory_utilization" "n063" {
  account_moid = try(local.m063["account_moid"], null)
  additional_properties = try(local.m063["additional_properties"], null)
  class_id = try(local.m063["class_id"], null)
  create_time = try(local.m063["create_time"], null)
  domain_group_moid = try(local.m063["domain_group_moid"], null)
  end_time = try(local.m063["end_time"], null)
  id = try(local.m063["id"], null)
  meta_field = try(local.m063["meta_field"], null)
  mod_time = try(local.m063["mod_time"], null)
  moid = try(local.m063["moid"], null)
  node_hostname = try(local.m063["node_hostname"], null)
  node_id = try(local.m063["node_id"], null)
  object_type = try(local.m063["object_type"], null)
  owners = try(local.m063["owners"], null)
  results = try(local.m063["results"], null)
  shared_scope = try(local.m063["shared_scope"], null)
  time = try(local.m063["time"], null)
  utilization = try(local.m063["utilization"], null)
  dynamic "ancestors" {
    for_each = try(local.m063["ancestors"], null) == null ? [] : local.m063["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attributes" {
    for_each = try(local.m063["attributes"], null) == null ? [] : local.m063["attributes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m063["parent"], null) == null ? [] : local.m063["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m063["permission_resources"], null) == null ? [] : local.m063["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m063["tags"], null) == null ? [] : local.m063["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m063["version_context"], null) == null ? [] : local.m063["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
