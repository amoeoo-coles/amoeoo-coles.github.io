# Sample data source intersight_storage_net_app_svm_event — reads ../models/data_intersight_storage_net_app_svm_event.yml
locals { m1302 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_svm_event.yml"))["data_intersight_storage_net_app_svm_event"] }

data "intersight_storage_net_app_svm_event" "n1302" {
  account_moid = try(local.m1302["account_moid"], null)
  additional_properties = try(local.m1302["additional_properties"], null)
  cause = try(local.m1302["cause"], null)
  class_id = try(local.m1302["class_id"], null)
  cluster_uuid = try(local.m1302["cluster_uuid"], null)
  create_time = try(local.m1302["create_time"], null)
  current_state = try(local.m1302["current_state"], null)
  domain_group_moid = try(local.m1302["domain_group_moid"], null)
  duration = try(local.m1302["duration"], null)
  id = try(local.m1302["id"], null)
  impact_area = try(local.m1302["impact_area"], null)
  impact_level = try(local.m1302["impact_level"], null)
  impact_resource_name = try(local.m1302["impact_resource_name"], null)
  impact_resource_type = try(local.m1302["impact_resource_type"], null)
  impact_resource_uuid = try(local.m1302["impact_resource_uuid"], null)
  mod_time = try(local.m1302["mod_time"], null)
  moid = try(local.m1302["moid"], null)
  name = try(local.m1302["name"], null)
  node_uuid = try(local.m1302["node_uuid"], null)
  object_type = try(local.m1302["object_type"], null)
  owners = try(local.m1302["owners"], null)
  results = try(local.m1302["results"], null)
  severity = try(local.m1302["severity"], null)
  shared_scope = try(local.m1302["shared_scope"], null)
  svm_uuid = try(local.m1302["svm_uuid"], null)
  uuid = try(local.m1302["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1302["ancestors"], null) == null ? [] : local.m1302["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1302["parent"], null) == null ? [] : local.m1302["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1302["permission_resources"], null) == null ? [] : local.m1302["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1302["tags"], null) == null ? [] : local.m1302["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1302["tenant"], null) == null ? [] : local.m1302["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1302["version_context"], null) == null ? [] : local.m1302["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
