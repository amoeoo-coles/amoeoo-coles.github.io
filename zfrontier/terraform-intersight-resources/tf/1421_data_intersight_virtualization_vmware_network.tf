# Sample data source intersight_virtualization_vmware_network — reads ../models/data_intersight_virtualization_vmware_network.yml
locals { m1421 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_network.yml"))["data_intersight_virtualization_vmware_network"] }

data "intersight_virtualization_vmware_network" "n1421" {
  account_moid = try(local.m1421["account_moid"], null)
  additional_properties = try(local.m1421["additional_properties"], null)
  class_id = try(local.m1421["class_id"], null)
  create_time = try(local.m1421["create_time"], null)
  domain_group_moid = try(local.m1421["domain_group_moid"], null)
  forged_transmits = try(local.m1421["forged_transmits"], null)
  id = try(local.m1421["id"], null)
  identity = try(local.m1421["identity"], null)
  mac_address_changes = try(local.m1421["mac_address_changes"], null)
  mod_time = try(local.m1421["mod_time"], null)
  moid = try(local.m1421["moid"], null)
  name = try(local.m1421["name"], null)
  object_type = try(local.m1421["object_type"], null)
  owners = try(local.m1421["owners"], null)
  promiscuous_mode = try(local.m1421["promiscuous_mode"], null)
  results = try(local.m1421["results"], null)
  shared_scope = try(local.m1421["shared_scope"], null)
  vlan_id = try(local.m1421["vlan_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1421["ancestors"], null) == null ? [] : local.m1421["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1421["host"], null) == null ? [] : local.m1421["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nic_teaming_and_failover" {
    for_each = try(local.m1421["nic_teaming_and_failover"], null) == null ? [] : local.m1421["nic_teaming_and_failover"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1421["parent"], null) == null ? [] : local.m1421["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1421["permission_resources"], null) == null ? [] : local.m1421["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1421["registered_device"], null) == null ? [] : local.m1421["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1421["tags"], null) == null ? [] : local.m1421["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1421["version_context"], null) == null ? [] : local.m1421["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_switch" {
    for_each = try(local.m1421["virtual_switch"], null) == null ? [] : local.m1421["virtual_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
