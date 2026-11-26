# Sample data source intersight_virtualization_vmware_virtual_switch — reads ../models/data_intersight_virtualization_vmware_virtual_switch.yml
locals { m1431 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_virtual_switch.yml"))["data_intersight_virtualization_vmware_virtual_switch"] }

data "intersight_virtualization_vmware_virtual_switch" "n1431" {
  account_moid = try(local.m1431["account_moid"], null)
  additional_properties = try(local.m1431["additional_properties"], null)
  class_id = try(local.m1431["class_id"], null)
  create_time = try(local.m1431["create_time"], null)
  domain_group_moid = try(local.m1431["domain_group_moid"], null)
  forged_transmits = try(local.m1431["forged_transmits"], null)
  id = try(local.m1431["id"], null)
  identity = try(local.m1431["identity"], null)
  mac_address_changes = try(local.m1431["mac_address_changes"], null)
  mod_time = try(local.m1431["mod_time"], null)
  moid = try(local.m1431["moid"], null)
  mtu = try(local.m1431["mtu"], null)
  name = try(local.m1431["name"], null)
  num_networks = try(local.m1431["num_networks"], null)
  num_physical_network_interfaces = try(local.m1431["num_physical_network_interfaces"], null)
  object_type = try(local.m1431["object_type"], null)
  owners = try(local.m1431["owners"], null)
  promiscuous_mode = try(local.m1431["promiscuous_mode"], null)
  results = try(local.m1431["results"], null)
  shared_scope = try(local.m1431["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1431["ancestors"], null) == null ? [] : local.m1431["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1431["host"], null) == null ? [] : local.m1431["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nic_teaming_and_failover" {
    for_each = try(local.m1431["nic_teaming_and_failover"], null) == null ? [] : local.m1431["nic_teaming_and_failover"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1431["parent"], null) == null ? [] : local.m1431["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1431["permission_resources"], null) == null ? [] : local.m1431["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1431["registered_device"], null) == null ? [] : local.m1431["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1431["tags"], null) == null ? [] : local.m1431["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1431["version_context"], null) == null ? [] : local.m1431["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
