# Sample data source intersight_virtualization_vmware_virtual_network_interface — reads ../models/data_intersight_virtualization_vmware_virtual_network_interface.yml
locals { m1430 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_virtual_network_interface.yml"))["data_intersight_virtualization_vmware_virtual_network_interface"] }

data "intersight_virtualization_vmware_virtual_network_interface" "n1430" {
  account_moid = try(local.m1430["account_moid"], null)
  adapter_type = try(local.m1430["adapter_type"], null)
  additional_properties = try(local.m1430["additional_properties"], null)
  class_id = try(local.m1430["class_id"], null)
  connect_at_power_on = try(local.m1430["connect_at_power_on"], null)
  connected = try(local.m1430["connected"], null)
  create_time = try(local.m1430["create_time"], null)
  domain_group_moid = try(local.m1430["domain_group_moid"], null)
  id = try(local.m1430["id"], null)
  key = try(var.secrets["data_intersight_virtualization_vmware_virtual_network_interface.key"], local.m1430["key"])
  mac_address = try(local.m1430["mac_address"], null)
  mac_address_type = try(local.m1430["mac_address_type"], null)
  mod_time = try(local.m1430["mod_time"], null)
  moid = try(local.m1430["moid"], null)
  name = try(local.m1430["name"], null)
  network_type = try(local.m1430["network_type"], null)
  object_type = try(local.m1430["object_type"], null)
  owners = try(local.m1430["owners"], null)
  results = try(local.m1430["results"], null)
  shared_scope = try(local.m1430["shared_scope"], null)
  vm_identity = try(local.m1430["vm_identity"], null)
  dynamic "ancestors" {
    for_each = try(local.m1430["ancestors"], null) == null ? [] : local.m1430["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network" {
    for_each = try(local.m1430["network"], null) == null ? [] : local.m1430["network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1430["parent"], null) == null ? [] : local.m1430["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1430["permission_resources"], null) == null ? [] : local.m1430["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1430["registered_device"], null) == null ? [] : local.m1430["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1430["tags"], null) == null ? [] : local.m1430["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1430["version_context"], null) == null ? [] : local.m1430["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_machine" {
    for_each = try(local.m1430["virtual_machine"], null) == null ? [] : local.m1430["virtual_machine"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
