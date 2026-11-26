# Sample data source intersight_catalystsdwan_physical_port — reads ../models/data_intersight_catalystsdwan_physical_port.yml
locals { m201 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_physical_port.yml"))["data_intersight_catalystsdwan_physical_port"] }

data "intersight_catalystsdwan_physical_port" "n201" {
  account_moid = try(local.m201["account_moid"], null)
  additional_properties = try(local.m201["additional_properties"], null)
  admin_speed = try(local.m201["admin_speed"], null)
  admin_state = try(local.m201["admin_state"], null)
  allowed_vlan_ids = try(local.m201["allowed_vlan_ids"], null)
  auto_negotiation = try(local.m201["auto_negotiation"], null)
  class_id = try(local.m201["class_id"], null)
  create_time = try(local.m201["create_time"], null)
  default_vlan_id = try(local.m201["default_vlan_id"], null)
  dn = try(local.m201["dn"], null)
  domain_group_moid = try(local.m201["domain_group_moid"], null)
  fec_enabled = try(local.m201["fec_enabled"], null)
  id = try(local.m201["id"], null)
  local_system_ip = try(local.m201["local_system_ip"], null)
  mac_address = try(local.m201["mac_address"], null)
  mod_time = try(local.m201["mod_time"], null)
  mode = try(local.m201["mode"], null)
  moid = try(local.m201["moid"], null)
  mtu = try(local.m201["mtu"], null)
  negotiated_speed = try(local.m201["negotiated_speed"], null)
  object_type = try(local.m201["object_type"], null)
  oper_state = try(local.m201["oper_state"], null)
  owners = try(local.m201["owners"], null)
  port_channel_id = try(local.m201["port_channel_id"], null)
  port_channel_name = try(local.m201["port_channel_name"], null)
  port_name = try(local.m201["port_name"], null)
  port_type = try(local.m201["port_type"], null)
  results = try(local.m201["results"], null)
  shared_scope = try(local.m201["shared_scope"], null)
  system_ip = try(local.m201["system_ip"], null)
  uuid = try(local.m201["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m201["ancestors"], null) == null ? [] : local.m201["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m201["parent"], null) == null ? [] : local.m201["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m201["permission_resources"], null) == null ? [] : local.m201["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m201["registered_device"], null) == null ? [] : local.m201["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m201["tags"], null) == null ? [] : local.m201["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m201["version_context"], null) == null ? [] : local.m201["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wan_edge_device" {
    for_each = try(local.m201["wan_edge_device"], null) == null ? [] : local.m201["wan_edge_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
