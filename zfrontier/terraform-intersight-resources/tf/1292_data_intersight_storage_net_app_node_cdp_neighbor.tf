# Sample data source intersight_storage_net_app_node_cdp_neighbor — reads ../models/data_intersight_storage_net_app_node_cdp_neighbor.yml
locals { m1292 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_node_cdp_neighbor.yml"))["data_intersight_storage_net_app_node_cdp_neighbor"] }

data "intersight_storage_net_app_node_cdp_neighbor" "n1292" {
  account_moid = try(local.m1292["account_moid"], null)
  additional_properties = try(local.m1292["additional_properties"], null)
  capabilities = try(local.m1292["capabilities"], null)
  class_id = try(local.m1292["class_id"], null)
  create_time = try(local.m1292["create_time"], null)
  device_ip = try(local.m1292["device_ip"], null)
  discovered_device = try(local.m1292["discovered_device"], null)
  domain_group_moid = try(local.m1292["domain_group_moid"], null)
  hold_time_remaining = try(local.m1292["hold_time_remaining"], null)
  id = try(local.m1292["id"], null)
  interface = try(local.m1292["interface"], null)
  mod_time = try(local.m1292["mod_time"], null)
  moid = try(local.m1292["moid"], null)
  node_name = try(local.m1292["node_name"], null)
  nr_version = try(local.m1292["nr_version"], null)
  object_type = try(local.m1292["object_type"], null)
  owners = try(local.m1292["owners"], null)
  platform = try(local.m1292["platform"], null)
  port = try(local.m1292["port"], null)
  protocol = try(local.m1292["protocol"], null)
  results = try(local.m1292["results"], null)
  shared_scope = try(local.m1292["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1292["ancestors"], null) == null ? [] : local.m1292["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1292["array_controller"], null) == null ? [] : local.m1292["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1292["parent"], null) == null ? [] : local.m1292["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1292["permission_resources"], null) == null ? [] : local.m1292["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1292["tags"], null) == null ? [] : local.m1292["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1292["version_context"], null) == null ? [] : local.m1292["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
