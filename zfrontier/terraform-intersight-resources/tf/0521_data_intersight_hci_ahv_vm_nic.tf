# Sample data source intersight_hci_ahv_vm_nic — reads ../models/data_intersight_hci_ahv_vm_nic.yml
locals { m521 = yamldecode(file("${path.module}/../models/data_intersight_hci_ahv_vm_nic.yml"))["data_intersight_hci_ahv_vm_nic"] }

data "intersight_hci_ahv_vm_nic" "n521" {
  account_moid = try(local.m521["account_moid"], null)
  additional_properties = try(local.m521["additional_properties"], null)
  class_id = try(local.m521["class_id"], null)
  create_time = try(local.m521["create_time"], null)
  domain_group_moid = try(local.m521["domain_group_moid"], null)
  id = try(local.m521["id"], null)
  is_connected = try(local.m521["is_connected"], null)
  mac_address = try(local.m521["mac_address"], null)
  mod_time = try(local.m521["mod_time"], null)
  model = try(local.m521["model"], null)
  moid = try(local.m521["moid"], null)
  network_function_nic_type = try(local.m521["network_function_nic_type"], null)
  nic_ext_id = try(local.m521["nic_ext_id"], null)
  nic_type = try(local.m521["nic_type"], null)
  num_queues = try(local.m521["num_queues"], null)
  object_type = try(local.m521["object_type"], null)
  owners = try(local.m521["owners"], null)
  results = try(local.m521["results"], null)
  shared_scope = try(local.m521["shared_scope"], null)
  should_allow_unknown_macs = try(local.m521["should_allow_unknown_macs"], null)
  trunked_vlans = try(local.m521["trunked_vlans"], null)
  vlan_id = try(local.m521["vlan_id"], null)
  vlan_mode = try(local.m521["vlan_mode"], null)
  vm_ext_id = try(local.m521["vm_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m521["ancestors"], null) == null ? [] : local.m521["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_addresses" {
    for_each = try(local.m521["ip_addresses"], null) == null ? [] : local.m521["ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "learned_ip_addresses" {
    for_each = try(local.m521["learned_ip_addresses"], null) == null ? [] : local.m521["learned_ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m521["parent"], null) == null ? [] : local.m521["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m521["permission_resources"], null) == null ? [] : local.m521["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m521["registered_device"], null) == null ? [] : local.m521["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m521["tags"], null) == null ? [] : local.m521["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m521["version_context"], null) == null ? [] : local.m521["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm" {
    for_each = try(local.m521["vm"], null) == null ? [] : local.m521["vm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
