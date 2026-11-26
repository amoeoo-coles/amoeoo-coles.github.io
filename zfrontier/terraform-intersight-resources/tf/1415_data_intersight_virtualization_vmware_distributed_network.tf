# Sample data source intersight_virtualization_vmware_distributed_network — reads ../models/data_intersight_virtualization_vmware_distributed_network.yml
locals { m1415 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_distributed_network.yml"))["data_intersight_virtualization_vmware_distributed_network"] }

data "intersight_virtualization_vmware_distributed_network" "n1415" {
  account_moid = try(local.m1415["account_moid"], null)
  additional_properties = try(local.m1415["additional_properties"], null)
  class_id = try(local.m1415["class_id"], null)
  create_time = try(local.m1415["create_time"], null)
  domain_group_moid = try(local.m1415["domain_group_moid"], null)
  forged_transmits = try(local.m1415["forged_transmits"], null)
  id = try(local.m1415["id"], null)
  identity = try(local.m1415["identity"], null)
  mac_address_changes = try(local.m1415["mac_address_changes"], null)
  mod_time = try(local.m1415["mod_time"], null)
  moid = try(local.m1415["moid"], null)
  name = try(local.m1415["name"], null)
  num_hosts = try(local.m1415["num_hosts"], null)
  num_ports = try(local.m1415["num_ports"], null)
  object_type = try(local.m1415["object_type"], null)
  owners = try(local.m1415["owners"], null)
  promiscuous_mode = try(local.m1415["promiscuous_mode"], null)
  results = try(local.m1415["results"], null)
  shared_scope = try(local.m1415["shared_scope"], null)
  up_link = try(local.m1415["up_link"], null)
  vlan_type = try(local.m1415["vlan_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1415["ancestors"], null) == null ? [] : local.m1415["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributed_switch" {
    for_each = try(local.m1415["distributed_switch"], null) == null ? [] : local.m1415["distributed_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hosts" {
    for_each = try(local.m1415["hosts"], null) == null ? [] : local.m1415["hosts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nic_teaming_and_failover" {
    for_each = try(local.m1415["nic_teaming_and_failover"], null) == null ? [] : local.m1415["nic_teaming_and_failover"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1415["parent"], null) == null ? [] : local.m1415["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1415["permission_resources"], null) == null ? [] : local.m1415["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1415["registered_device"], null) == null ? [] : local.m1415["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1415["tags"], null) == null ? [] : local.m1415["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1415["version_context"], null) == null ? [] : local.m1415["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vlan_range" {
    for_each = try(local.m1415["vlan_range"], null) == null ? [] : local.m1415["vlan_range"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
