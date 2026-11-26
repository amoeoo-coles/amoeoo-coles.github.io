# Sample data source intersight_hci_esxi_vm_nic — reads ../models/data_intersight_hci_esxi_vm_nic.yml
locals { m531 = yamldecode(file("${path.module}/../models/data_intersight_hci_esxi_vm_nic.yml"))["data_intersight_hci_esxi_vm_nic"] }

data "intersight_hci_esxi_vm_nic" "n531" {
  account_moid = try(local.m531["account_moid"], null)
  adapter_type = try(local.m531["adapter_type"], null)
  additional_properties = try(local.m531["additional_properties"], null)
  class_id = try(local.m531["class_id"], null)
  create_time = try(local.m531["create_time"], null)
  domain_group_moid = try(local.m531["domain_group_moid"], null)
  id = try(local.m531["id"], null)
  is_connected = try(local.m531["is_connected"], null)
  mac_address = try(local.m531["mac_address"], null)
  mod_time = try(local.m531["mod_time"], null)
  moid = try(local.m531["moid"], null)
  nic_ext_id = try(local.m531["nic_ext_id"], null)
  object_type = try(local.m531["object_type"], null)
  owners = try(local.m531["owners"], null)
  portgroup_name = try(local.m531["portgroup_name"], null)
  results = try(local.m531["results"], null)
  shared_scope = try(local.m531["shared_scope"], null)
  vm_ext_id = try(local.m531["vm_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m531["ancestors"], null) == null ? [] : local.m531["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_addresses" {
    for_each = try(local.m531["ip_addresses"], null) == null ? [] : local.m531["ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m531["parent"], null) == null ? [] : local.m531["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m531["permission_resources"], null) == null ? [] : local.m531["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m531["registered_device"], null) == null ? [] : local.m531["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m531["tags"], null) == null ? [] : local.m531["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m531["version_context"], null) == null ? [] : local.m531["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm" {
    for_each = try(local.m531["vm"], null) == null ? [] : local.m531["vm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
