# Sample data source intersight_adapter_host_eth_interface — reads ../models/data_intersight_adapter_host_eth_interface.yml
locals { m012 = yamldecode(file("${path.module}/../models/data_intersight_adapter_host_eth_interface.yml"))["data_intersight_adapter_host_eth_interface"] }

data "intersight_adapter_host_eth_interface" "n012" {
  account_moid = try(local.m012["account_moid"], null)
  active_oper_state = try(local.m012["active_oper_state"], null)
  active_veth_oper_state = try(local.m012["active_veth_oper_state"], null)
  additional_properties = try(local.m012["additional_properties"], null)
  admin_state = try(local.m012["admin_state"], null)
  class_id = try(local.m012["class_id"], null)
  create_time = try(local.m012["create_time"], null)
  device_mo_id = try(local.m012["device_mo_id"], null)
  dn = try(local.m012["dn"], null)
  domain_group_moid = try(local.m012["domain_group_moid"], null)
  ep_dn = try(local.m012["ep_dn"], null)
  host_eth_interface_id = try(local.m012["host_eth_interface_id"], null)
  id = try(local.m012["id"], null)
  interface_type = try(local.m012["interface_type"], null)
  mac_address = try(local.m012["mac_address"], null)
  mod_time = try(local.m012["mod_time"], null)
  moid = try(local.m012["moid"], null)
  name = try(local.m012["name"], null)
  object_type = try(local.m012["object_type"], null)
  oper_reason = try(local.m012["oper_reason"], null)
  oper_state = try(local.m012["oper_state"], null)
  operability = try(local.m012["operability"], null)
  original_mac_address = try(local.m012["original_mac_address"], null)
  owners = try(local.m012["owners"], null)
  pci_addr = try(local.m012["pci_addr"], null)
  peer_dn = try(local.m012["peer_dn"], null)
  pin_group_name = try(local.m012["pin_group_name"], null)
  qinq_enabled = try(local.m012["qinq_enabled"], null)
  qinq_vlan = try(local.m012["qinq_vlan"], null)
  results = try(local.m012["results"], null)
  rn = try(local.m012["rn"], null)
  shared_scope = try(local.m012["shared_scope"], null)
  standby_oper_state = try(local.m012["standby_oper_state"], null)
  standby_veth_oper_state = try(local.m012["standby_veth_oper_state"], null)
  standby_vif_id = try(local.m012["standby_vif_id"], null)
  veth_action = try(local.m012["veth_action"], null)
  vif_id = try(local.m012["vif_id"], null)
  virtualization_preference = try(local.m012["virtualization_preference"], null)
  vnic_dn = try(local.m012["vnic_dn"], null)
  dynamic "acknowledged_peer_interface" {
    for_each = try(local.m012["acknowledged_peer_interface"], null) == null ? [] : local.m012["acknowledged_peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "adapter_unit" {
    for_each = try(local.m012["adapter_unit"], null) == null ? [] : local.m012["adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m012["ancestors"], null) == null ? [] : local.m012["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m012["inventory_device_info"], null) == null ? [] : local.m012["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m012["parent"], null) == null ? [] : local.m012["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer_interface" {
    for_each = try(local.m012["peer_interface"], null) == null ? [] : local.m012["peer_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m012["permission_resources"], null) == null ? [] : local.m012["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pinned_interface" {
    for_each = try(local.m012["pinned_interface"], null) == null ? [] : local.m012["pinned_interface"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m012["registered_device"], null) == null ? [] : local.m012["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "standby_vethernet" {
    for_each = try(local.m012["standby_vethernet"], null) == null ? [] : local.m012["standby_vethernet"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m012["tags"], null) == null ? [] : local.m012["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m012["version_context"], null) == null ? [] : local.m012["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vethernet" {
    for_each = try(local.m012["vethernet"], null) == null ? [] : local.m012["vethernet"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
