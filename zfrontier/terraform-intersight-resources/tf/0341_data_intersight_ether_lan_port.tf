# Sample data source intersight_ether_lan_port — reads ../models/data_intersight_ether_lan_port.yml
locals { m341 = yamldecode(file("${path.module}/../models/data_intersight_ether_lan_port.yml"))["data_intersight_ether_lan_port"] }

data "intersight_ether_lan_port" "n341" {
  account_moid = try(local.m341["account_moid"], null)
  additional_properties = try(local.m341["additional_properties"], null)
  class_id = try(local.m341["class_id"], null)
  create_time = try(local.m341["create_time"], null)
  device_mo_id = try(local.m341["device_mo_id"], null)
  dn = try(local.m341["dn"], null)
  domain_group_moid = try(local.m341["domain_group_moid"], null)
  id = try(local.m341["id"], null)
  mod_time = try(local.m341["mod_time"], null)
  moid = try(local.m341["moid"], null)
  object_type = try(local.m341["object_type"], null)
  oper_state = try(local.m341["oper_state"], null)
  owners = try(local.m341["owners"], null)
  port_name = try(local.m341["port_name"], null)
  results = try(local.m341["results"], null)
  rn = try(local.m341["rn"], null)
  shared_scope = try(local.m341["shared_scope"], null)
  dynamic "acknowledged_peer_interface" {
    for_each = try(local.m341["acknowledged_peer_interface"], null) == null ? [] : local.m341["acknowledged_peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m341["ancestors"], null) == null ? [] : local.m341["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_secure_router" {
    for_each = try(local.m341["network_secure_router"], null) == null ? [] : local.m341["network_secure_router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m341["parent"], null) == null ? [] : local.m341["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m341["peer_interface"], null) == null ? [] : local.m341["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m341["permission_resources"], null) == null ? [] : local.m341["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m341["registered_device"], null) == null ? [] : local.m341["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m341["tags"], null) == null ? [] : local.m341["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m341["version_context"], null) == null ? [] : local.m341["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
