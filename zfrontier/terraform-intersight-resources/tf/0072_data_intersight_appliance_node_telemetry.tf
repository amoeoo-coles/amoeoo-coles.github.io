# Sample data source intersight_appliance_node_telemetry — reads ../models/data_intersight_appliance_node_telemetry.yml
locals { m072 = yamldecode(file("${path.module}/../models/data_intersight_appliance_node_telemetry.yml"))["data_intersight_appliance_node_telemetry"] }

data "intersight_appliance_node_telemetry" "n072" {
  account_moid = try(local.m072["account_moid"], null)
  additional_properties = try(local.m072["additional_properties"], null)
  class_id = try(local.m072["class_id"], null)
  cpu_usage = try(local.m072["cpu_usage"], null)
  create_time = try(local.m072["create_time"], null)
  domain_group_moid = try(local.m072["domain_group_moid"], null)
  id = try(local.m072["id"], null)
  instance = try(local.m072["instance"], null)
  memory_usage = try(local.m072["memory_usage"], null)
  mod_time = try(local.m072["mod_time"], null)
  moid = try(local.m072["moid"], null)
  object_type = try(local.m072["object_type"], null)
  owners = try(local.m072["owners"], null)
  results = try(local.m072["results"], null)
  shared_scope = try(local.m072["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m072["ancestors"], null) == null ? [] : local.m072["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m072["parent"], null) == null ? [] : local.m072["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m072["permission_resources"], null) == null ? [] : local.m072["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m072["registered_device"], null) == null ? [] : local.m072["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m072["tags"], null) == null ? [] : local.m072["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m072["version_context"], null) == null ? [] : local.m072["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
