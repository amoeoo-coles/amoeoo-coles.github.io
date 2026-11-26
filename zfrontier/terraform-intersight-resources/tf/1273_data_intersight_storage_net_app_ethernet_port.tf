# Sample data source intersight_storage_net_app_ethernet_port — reads ../models/data_intersight_storage_net_app_ethernet_port.yml
locals { m1273 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_ethernet_port.yml"))["data_intersight_storage_net_app_ethernet_port"] }

data "intersight_storage_net_app_ethernet_port" "n1273" {
  account_moid = try(local.m1273["account_moid"], null)
  additional_properties = try(local.m1273["additional_properties"], null)
  broadcast_domain_name = try(local.m1273["broadcast_domain_name"], null)
  class_id = try(local.m1273["class_id"], null)
  create_time = try(local.m1273["create_time"], null)
  domain_group_moid = try(local.m1273["domain_group_moid"], null)
  enabled = try(local.m1273["enabled"], null)
  id = try(local.m1273["id"], null)
  mac_address = try(local.m1273["mac_address"], null)
  mod_time = try(local.m1273["mod_time"], null)
  moid = try(local.m1273["moid"], null)
  mtu = try(local.m1273["mtu"], null)
  name = try(local.m1273["name"], null)
  node_name = try(local.m1273["node_name"], null)
  object_type = try(local.m1273["object_type"], null)
  owners = try(local.m1273["owners"], null)
  port_state = try(local.m1273["port_state"], null)
  results = try(local.m1273["results"], null)
  shared_scope = try(local.m1273["shared_scope"], null)
  speed = try(local.m1273["speed"], null)
  state = try(local.m1273["state"], null)
  type = try(local.m1273["type"], null)
  uuid = try(local.m1273["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1273["ancestors"], null) == null ? [] : local.m1273["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1273["array_controller"], null) == null ? [] : local.m1273["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1273["events"], null) == null ? [] : local.m1273["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_app_ethernet_port_lag" {
    for_each = try(local.m1273["net_app_ethernet_port_lag"], null) == null ? [] : local.m1273["net_app_ethernet_port_lag"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_app_ethernet_port_vlan" {
    for_each = try(local.m1273["net_app_ethernet_port_vlan"], null) == null ? [] : local.m1273["net_app_ethernet_port_vlan"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1273["parent"], null) == null ? [] : local.m1273["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1273["permission_resources"], null) == null ? [] : local.m1273["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1273["tags"], null) == null ? [] : local.m1273["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1273["version_context"], null) == null ? [] : local.m1273["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
