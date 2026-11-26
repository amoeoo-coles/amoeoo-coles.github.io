# Sample data source intersight_storage_net_app_data_ip_interface — reads ../models/data_intersight_storage_net_app_data_ip_interface.yml
locals { m1270 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_data_ip_interface.yml"))["data_intersight_storage_net_app_data_ip_interface"] }

data "intersight_storage_net_app_data_ip_interface" "n1270" {
  account_moid = try(local.m1270["account_moid"], null)
  additional_properties = try(local.m1270["additional_properties"], null)
  class_id = try(local.m1270["class_id"], null)
  create_time = try(local.m1270["create_time"], null)
  current_node = try(local.m1270["current_node"], null)
  current_port = try(local.m1270["current_port"], null)
  domain_group_moid = try(local.m1270["domain_group_moid"], null)
  enabled = try(local.m1270["enabled"], null)
  home_node = try(local.m1270["home_node"], null)
  home_port = try(local.m1270["home_port"], null)
  id = try(local.m1270["id"], null)
  interface_is_home = try(local.m1270["interface_is_home"], null)
  interface_state = try(local.m1270["interface_state"], null)
  ip_address = try(local.m1270["ip_address"], null)
  ip_family = try(local.m1270["ip_family"], null)
  ipspace = try(local.m1270["ipspace"], null)
  is_home = try(local.m1270["is_home"], null)
  location_failover = try(local.m1270["location_failover"], null)
  mod_time = try(local.m1270["mod_time"], null)
  moid = try(local.m1270["moid"], null)
  name = try(local.m1270["name"], null)
  netmask = try(local.m1270["netmask"], null)
  object_type = try(local.m1270["object_type"], null)
  owners = try(local.m1270["owners"], null)
  results = try(local.m1270["results"], null)
  service_policy_name = try(local.m1270["service_policy_name"], null)
  service_policy_uuid = try(local.m1270["service_policy_uuid"], null)
  services = try(local.m1270["services"], null)
  shared_scope = try(local.m1270["shared_scope"], null)
  state = try(local.m1270["state"], null)
  svm_name = try(local.m1270["svm_name"], null)
  uuid = try(local.m1270["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1270["ancestors"], null) == null ? [] : local.m1270["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1270["array_controller"], null) == null ? [] : local.m1270["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1270["events"], null) == null ? [] : local.m1270["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_app_ethernet_port" {
    for_each = try(local.m1270["net_app_ethernet_port"], null) == null ? [] : local.m1270["net_app_ethernet_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1270["parent"], null) == null ? [] : local.m1270["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1270["permission_resources"], null) == null ? [] : local.m1270["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1270["tags"], null) == null ? [] : local.m1270["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1270["tenant"], null) == null ? [] : local.m1270["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1270["version_context"], null) == null ? [] : local.m1270["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
