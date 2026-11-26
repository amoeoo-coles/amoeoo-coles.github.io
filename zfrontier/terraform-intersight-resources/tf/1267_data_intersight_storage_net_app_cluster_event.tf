# Sample data source intersight_storage_net_app_cluster_event — reads ../models/data_intersight_storage_net_app_cluster_event.yml
locals { m1267 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cluster_event.yml"))["data_intersight_storage_net_app_cluster_event"] }

data "intersight_storage_net_app_cluster_event" "n1267" {
  account_moid = try(local.m1267["account_moid"], null)
  additional_properties = try(local.m1267["additional_properties"], null)
  cause = try(local.m1267["cause"], null)
  class_id = try(local.m1267["class_id"], null)
  cluster_uuid = try(local.m1267["cluster_uuid"], null)
  create_time = try(local.m1267["create_time"], null)
  current_state = try(local.m1267["current_state"], null)
  domain_group_moid = try(local.m1267["domain_group_moid"], null)
  duration = try(local.m1267["duration"], null)
  id = try(local.m1267["id"], null)
  impact_area = try(local.m1267["impact_area"], null)
  impact_level = try(local.m1267["impact_level"], null)
  impact_resource_name = try(local.m1267["impact_resource_name"], null)
  impact_resource_type = try(local.m1267["impact_resource_type"], null)
  impact_resource_uuid = try(local.m1267["impact_resource_uuid"], null)
  mod_time = try(local.m1267["mod_time"], null)
  moid = try(local.m1267["moid"], null)
  name = try(local.m1267["name"], null)
  node_uuid = try(local.m1267["node_uuid"], null)
  object_type = try(local.m1267["object_type"], null)
  owners = try(local.m1267["owners"], null)
  results = try(local.m1267["results"], null)
  severity = try(local.m1267["severity"], null)
  shared_scope = try(local.m1267["shared_scope"], null)
  svm_uuid = try(local.m1267["svm_uuid"], null)
  uuid = try(local.m1267["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1267["ancestors"], null) == null ? [] : local.m1267["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1267["array"], null) == null ? [] : local.m1267["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1267["parent"], null) == null ? [] : local.m1267["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1267["permission_resources"], null) == null ? [] : local.m1267["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1267["tags"], null) == null ? [] : local.m1267["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1267["version_context"], null) == null ? [] : local.m1267["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
