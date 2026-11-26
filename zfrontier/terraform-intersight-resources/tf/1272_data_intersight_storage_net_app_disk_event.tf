# Sample data source intersight_storage_net_app_disk_event — reads ../models/data_intersight_storage_net_app_disk_event.yml
locals { m1272 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_disk_event.yml"))["data_intersight_storage_net_app_disk_event"] }

data "intersight_storage_net_app_disk_event" "n1272" {
  account_moid = try(local.m1272["account_moid"], null)
  additional_properties = try(local.m1272["additional_properties"], null)
  cause = try(local.m1272["cause"], null)
  class_id = try(local.m1272["class_id"], null)
  cluster_uuid = try(local.m1272["cluster_uuid"], null)
  create_time = try(local.m1272["create_time"], null)
  current_state = try(local.m1272["current_state"], null)
  domain_group_moid = try(local.m1272["domain_group_moid"], null)
  duration = try(local.m1272["duration"], null)
  id = try(local.m1272["id"], null)
  impact_area = try(local.m1272["impact_area"], null)
  impact_level = try(local.m1272["impact_level"], null)
  impact_resource_name = try(local.m1272["impact_resource_name"], null)
  impact_resource_type = try(local.m1272["impact_resource_type"], null)
  impact_resource_uuid = try(local.m1272["impact_resource_uuid"], null)
  mod_time = try(local.m1272["mod_time"], null)
  moid = try(local.m1272["moid"], null)
  name = try(local.m1272["name"], null)
  node_uuid = try(local.m1272["node_uuid"], null)
  object_type = try(local.m1272["object_type"], null)
  owners = try(local.m1272["owners"], null)
  results = try(local.m1272["results"], null)
  severity = try(local.m1272["severity"], null)
  shared_scope = try(local.m1272["shared_scope"], null)
  svm_uuid = try(local.m1272["svm_uuid"], null)
  uuid = try(local.m1272["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1272["ancestors"], null) == null ? [] : local.m1272["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk" {
    for_each = try(local.m1272["disk"], null) == null ? [] : local.m1272["disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1272["parent"], null) == null ? [] : local.m1272["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1272["permission_resources"], null) == null ? [] : local.m1272["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1272["tags"], null) == null ? [] : local.m1272["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1272["version_context"], null) == null ? [] : local.m1272["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
