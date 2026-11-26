# Sample data source intersight_storage_net_app_ip_interface — reads ../models/data_intersight_storage_net_app_ip_interface.yml
locals { m1281 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_ip_interface.yml"))["data_intersight_storage_net_app_ip_interface"] }

data "intersight_storage_net_app_ip_interface" "n1281" {
  account_moid = try(local.m1281["account_moid"], null)
  additional_properties = try(local.m1281["additional_properties"], null)
  class_id = try(local.m1281["class_id"], null)
  create_time = try(local.m1281["create_time"], null)
  domain_group_moid = try(local.m1281["domain_group_moid"], null)
  enabled = try(local.m1281["enabled"], null)
  home_node = try(local.m1281["home_node"], null)
  home_port = try(local.m1281["home_port"], null)
  id = try(local.m1281["id"], null)
  ip_address = try(local.m1281["ip_address"], null)
  ip_family = try(local.m1281["ip_family"], null)
  mod_time = try(local.m1281["mod_time"], null)
  moid = try(local.m1281["moid"], null)
  name = try(local.m1281["name"], null)
  netmask = try(local.m1281["netmask"], null)
  object_type = try(local.m1281["object_type"], null)
  owners = try(local.m1281["owners"], null)
  results = try(local.m1281["results"], null)
  service_policy_name = try(local.m1281["service_policy_name"], null)
  service_policy_uuid = try(local.m1281["service_policy_uuid"], null)
  services = try(local.m1281["services"], null)
  shared_scope = try(local.m1281["shared_scope"], null)
  state = try(local.m1281["state"], null)
  uuid = try(local.m1281["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1281["ancestors"], null) == null ? [] : local.m1281["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1281["array_controller"], null) == null ? [] : local.m1281["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1281["events"], null) == null ? [] : local.m1281["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "net_app_ethernet_port" {
    for_each = try(local.m1281["net_app_ethernet_port"], null) == null ? [] : local.m1281["net_app_ethernet_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1281["parent"], null) == null ? [] : local.m1281["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1281["permission_resources"], null) == null ? [] : local.m1281["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1281["tags"], null) == null ? [] : local.m1281["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tenant" {
    for_each = try(local.m1281["tenant"], null) == null ? [] : local.m1281["tenant"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1281["version_context"], null) == null ? [] : local.m1281["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
