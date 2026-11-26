# Sample data source intersight_catalystsdwan_interface — reads ../models/data_intersight_catalystsdwan_interface.yml
locals { m200 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_interface.yml"))["data_intersight_catalystsdwan_interface"] }

data "intersight_catalystsdwan_interface" "n200" {
  account_moid = try(local.m200["account_moid"], null)
  additional_properties = try(local.m200["additional_properties"], null)
  admin_state = try(local.m200["admin_state"], null)
  class_id = try(local.m200["class_id"], null)
  create_time = try(local.m200["create_time"], null)
  dn = try(local.m200["dn"], null)
  domain_group_moid = try(local.m200["domain_group_moid"], null)
  id = try(local.m200["id"], null)
  interface_name = try(local.m200["interface_name"], null)
  interface_type = try(local.m200["interface_type"], null)
  ip_address = try(local.m200["ip_address"], null)
  is_native_vlan = try(local.m200["is_native_vlan"], null)
  local_system_ip = try(local.m200["local_system_ip"], null)
  mac_address = try(local.m200["mac_address"], null)
  mod_time = try(local.m200["mod_time"], null)
  moid = try(local.m200["moid"], null)
  object_type = try(local.m200["object_type"], null)
  oper_state = try(local.m200["oper_state"], null)
  owners = try(local.m200["owners"], null)
  results = try(local.m200["results"], null)
  shared_scope = try(local.m200["shared_scope"], null)
  subnet = try(local.m200["subnet"], null)
  system_ip = try(local.m200["system_ip"], null)
  uuid = try(local.m200["uuid"], null)
  vlan_id = try(local.m200["vlan_id"], null)
  vpn_id = try(local.m200["vpn_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m200["ancestors"], null) == null ? [] : local.m200["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m200["parent"], null) == null ? [] : local.m200["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m200["permission_resources"], null) == null ? [] : local.m200["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m200["registered_device"], null) == null ? [] : local.m200["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m200["tags"], null) == null ? [] : local.m200["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m200["version_context"], null) == null ? [] : local.m200["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wan_edge_device" {
    for_each = try(local.m200["wan_edge_device"], null) == null ? [] : local.m200["wan_edge_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
