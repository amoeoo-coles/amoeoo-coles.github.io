# Sample data source intersight_management_interface — reads ../models/data_intersight_management_interface.yml
locals { m820 = yamldecode(file("${path.module}/../models/data_intersight_management_interface.yml"))["data_intersight_management_interface"] }

data "intersight_management_interface" "n820" {
  account_moid = try(local.m820["account_moid"], null)
  additional_properties = try(local.m820["additional_properties"], null)
  class_id = try(local.m820["class_id"], null)
  create_time = try(local.m820["create_time"], null)
  device_mo_id = try(local.m820["device_mo_id"], null)
  dn = try(local.m820["dn"], null)
  domain_group_moid = try(local.m820["domain_group_moid"], null)
  gateway = try(local.m820["gateway"], null)
  host_name = try(local.m820["host_name"], null)
  id = try(local.m820["id"], null)
  ip_address = try(local.m820["ip_address"], null)
  ipv4_address = try(local.m820["ipv4_address"], null)
  ipv4_gateway = try(local.m820["ipv4_gateway"], null)
  ipv4_mask = try(local.m820["ipv4_mask"], null)
  ipv6_address = try(local.m820["ipv6_address"], null)
  ipv6_gateway = try(local.m820["ipv6_gateway"], null)
  ipv6_prefix = try(local.m820["ipv6_prefix"], null)
  mac_address = try(local.m820["mac_address"], null)
  mask = try(local.m820["mask"], null)
  mod_time = try(local.m820["mod_time"], null)
  moid = try(local.m820["moid"], null)
  object_type = try(local.m820["object_type"], null)
  owners = try(local.m820["owners"], null)
  results = try(local.m820["results"], null)
  rn = try(local.m820["rn"], null)
  shared_scope = try(local.m820["shared_scope"], null)
  switch_id = try(local.m820["switch_id"], null)
  uem_conn_status = try(local.m820["uem_conn_status"], null)
  virtual_host_name = try(local.m820["virtual_host_name"], null)
  vlan_id = try(local.m820["vlan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m820["ancestors"], null) == null ? [] : local.m820["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m820["equipment_chassis"], null) == null ? [] : local.m820["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m820["inventory_device_info"], null) == null ? [] : local.m820["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_controller" {
    for_each = try(local.m820["management_controller"], null) == null ? [] : local.m820["management_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m820["parent"], null) == null ? [] : local.m820["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m820["permission_resources"], null) == null ? [] : local.m820["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m820["registered_device"], null) == null ? [] : local.m820["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m820["tags"], null) == null ? [] : local.m820["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m820["version_context"], null) == null ? [] : local.m820["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
