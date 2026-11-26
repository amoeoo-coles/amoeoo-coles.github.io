# Sample data source intersight_adapter_ext_eth_interface — reads ../models/data_intersight_adapter_ext_eth_interface.yml
locals { m011 = yamldecode(file("${path.module}/../models/data_intersight_adapter_ext_eth_interface.yml"))["data_intersight_adapter_ext_eth_interface"] }

data "intersight_adapter_ext_eth_interface" "n011" {
  account_moid = try(local.m011["account_moid"], null)
  additional_properties = try(local.m011["additional_properties"], null)
  admin_state = try(local.m011["admin_state"], null)
  class_id = try(local.m011["class_id"], null)
  create_time = try(local.m011["create_time"], null)
  device_mo_id = try(local.m011["device_mo_id"], null)
  dn = try(local.m011["dn"], null)
  domain_group_moid = try(local.m011["domain_group_moid"], null)
  ep_dn = try(local.m011["ep_dn"], null)
  ext_eth_interface_id = try(local.m011["ext_eth_interface_id"], null)
  id = try(local.m011["id"], null)
  interface_type = try(local.m011["interface_type"], null)
  mac_address = try(local.m011["mac_address"], null)
  mod_time = try(local.m011["mod_time"], null)
  moid = try(local.m011["moid"], null)
  network_type = try(local.m011["network_type"], null)
  object_type = try(local.m011["object_type"], null)
  oper_reason = try(local.m011["oper_reason"], null)
  oper_state = try(local.m011["oper_state"], null)
  owners = try(local.m011["owners"], null)
  peer_aggr_port_id = try(local.m011["peer_aggr_port_id"], null)
  peer_dn = try(local.m011["peer_dn"], null)
  peer_port_id = try(local.m011["peer_port_id"], null)
  peer_slot_id = try(local.m011["peer_slot_id"], null)
  results = try(local.m011["results"], null)
  rn = try(local.m011["rn"], null)
  shared_scope = try(local.m011["shared_scope"], null)
  switch_id = try(local.m011["switch_id"], null)
  dynamic "acknowledged_peer_interface" {
    for_each = try(local.m011["acknowledged_peer_interface"], null) == null ? [] : local.m011["acknowledged_peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "adapter_unit" {
    for_each = try(local.m011["adapter_unit"], null) == null ? [] : local.m011["adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m011["ancestors"], null) == null ? [] : local.m011["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m011["inventory_device_info"], null) == null ? [] : local.m011["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m011["parent"], null) == null ? [] : local.m011["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m011["peer_interface"], null) == null ? [] : local.m011["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m011["permission_resources"], null) == null ? [] : local.m011["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m011["registered_device"], null) == null ? [] : local.m011["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m011["tags"], null) == null ? [] : local.m011["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m011["version_context"], null) == null ? [] : local.m011["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
