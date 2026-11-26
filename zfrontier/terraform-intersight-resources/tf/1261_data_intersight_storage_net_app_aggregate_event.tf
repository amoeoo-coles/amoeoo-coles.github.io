# Sample data source intersight_storage_net_app_aggregate_event — reads ../models/data_intersight_storage_net_app_aggregate_event.yml
locals { m1261 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_aggregate_event.yml"))["data_intersight_storage_net_app_aggregate_event"] }

data "intersight_storage_net_app_aggregate_event" "n1261" {
  account_moid = try(local.m1261["account_moid"], null)
  additional_properties = try(local.m1261["additional_properties"], null)
  cause = try(local.m1261["cause"], null)
  class_id = try(local.m1261["class_id"], null)
  cluster_uuid = try(local.m1261["cluster_uuid"], null)
  create_time = try(local.m1261["create_time"], null)
  current_state = try(local.m1261["current_state"], null)
  domain_group_moid = try(local.m1261["domain_group_moid"], null)
  duration = try(local.m1261["duration"], null)
  id = try(local.m1261["id"], null)
  impact_area = try(local.m1261["impact_area"], null)
  impact_level = try(local.m1261["impact_level"], null)
  impact_resource_name = try(local.m1261["impact_resource_name"], null)
  impact_resource_type = try(local.m1261["impact_resource_type"], null)
  impact_resource_uuid = try(local.m1261["impact_resource_uuid"], null)
  mod_time = try(local.m1261["mod_time"], null)
  moid = try(local.m1261["moid"], null)
  name = try(local.m1261["name"], null)
  node_uuid = try(local.m1261["node_uuid"], null)
  object_type = try(local.m1261["object_type"], null)
  owners = try(local.m1261["owners"], null)
  results = try(local.m1261["results"], null)
  severity = try(local.m1261["severity"], null)
  shared_scope = try(local.m1261["shared_scope"], null)
  svm_uuid = try(local.m1261["svm_uuid"], null)
  uuid = try(local.m1261["uuid"], null)
  dynamic "aggregate" {
    for_each = try(local.m1261["aggregate"], null) == null ? [] : local.m1261["aggregate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1261["ancestors"], null) == null ? [] : local.m1261["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1261["parent"], null) == null ? [] : local.m1261["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1261["permission_resources"], null) == null ? [] : local.m1261["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1261["tags"], null) == null ? [] : local.m1261["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1261["version_context"], null) == null ? [] : local.m1261["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
