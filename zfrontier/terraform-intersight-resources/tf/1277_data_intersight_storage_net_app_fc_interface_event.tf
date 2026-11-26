# Sample data source intersight_storage_net_app_fc_interface_event — reads ../models/data_intersight_storage_net_app_fc_interface_event.yml
locals { m1277 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_fc_interface_event.yml"))["data_intersight_storage_net_app_fc_interface_event"] }

data "intersight_storage_net_app_fc_interface_event" "n1277" {
  account_moid = try(local.m1277["account_moid"], null)
  additional_properties = try(local.m1277["additional_properties"], null)
  cause = try(local.m1277["cause"], null)
  class_id = try(local.m1277["class_id"], null)
  cluster_uuid = try(local.m1277["cluster_uuid"], null)
  create_time = try(local.m1277["create_time"], null)
  current_state = try(local.m1277["current_state"], null)
  domain_group_moid = try(local.m1277["domain_group_moid"], null)
  duration = try(local.m1277["duration"], null)
  id = try(local.m1277["id"], null)
  impact_area = try(local.m1277["impact_area"], null)
  impact_level = try(local.m1277["impact_level"], null)
  impact_resource_name = try(local.m1277["impact_resource_name"], null)
  impact_resource_type = try(local.m1277["impact_resource_type"], null)
  impact_resource_uuid = try(local.m1277["impact_resource_uuid"], null)
  mod_time = try(local.m1277["mod_time"], null)
  moid = try(local.m1277["moid"], null)
  name = try(local.m1277["name"], null)
  node_uuid = try(local.m1277["node_uuid"], null)
  object_type = try(local.m1277["object_type"], null)
  owners = try(local.m1277["owners"], null)
  results = try(local.m1277["results"], null)
  severity = try(local.m1277["severity"], null)
  shared_scope = try(local.m1277["shared_scope"], null)
  svm_uuid = try(local.m1277["svm_uuid"], null)
  uuid = try(local.m1277["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1277["ancestors"], null) == null ? [] : local.m1277["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_interface" {
    for_each = try(local.m1277["fc_interface"], null) == null ? [] : local.m1277["fc_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1277["parent"], null) == null ? [] : local.m1277["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1277["permission_resources"], null) == null ? [] : local.m1277["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1277["tags"], null) == null ? [] : local.m1277["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1277["version_context"], null) == null ? [] : local.m1277["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
