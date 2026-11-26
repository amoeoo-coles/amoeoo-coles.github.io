# Sample data source intersight_virtualization_vmware_distributed_switch — reads ../models/data_intersight_virtualization_vmware_distributed_switch.yml
locals { m1416 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_distributed_switch.yml"))["data_intersight_virtualization_vmware_distributed_switch"] }

data "intersight_virtualization_vmware_distributed_switch" "n1416" {
  account_moid = try(local.m1416["account_moid"], null)
  additional_properties = try(local.m1416["additional_properties"], null)
  class_id = try(local.m1416["class_id"], null)
  create_time = try(local.m1416["create_time"], null)
  description = try(local.m1416["description"], null)
  domain_group_moid = try(local.m1416["domain_group_moid"], null)
  id = try(local.m1416["id"], null)
  identity = try(local.m1416["identity"], null)
  max_port = try(local.m1416["max_port"], null)
  mod_time = try(local.m1416["mod_time"], null)
  moid = try(local.m1416["moid"], null)
  mtu = try(local.m1416["mtu"], null)
  name = try(local.m1416["name"], null)
  network_io_control = try(local.m1416["network_io_control"], null)
  nr_version = try(local.m1416["nr_version"], null)
  num_hosts = try(local.m1416["num_hosts"], null)
  num_networks = try(local.m1416["num_networks"], null)
  num_stand_alone_ports = try(local.m1416["num_stand_alone_ports"], null)
  num_uplinks = try(local.m1416["num_uplinks"], null)
  object_type = try(local.m1416["object_type"], null)
  owners = try(local.m1416["owners"], null)
  results = try(local.m1416["results"], null)
  shared_scope = try(local.m1416["shared_scope"], null)
  uuid = try(local.m1416["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1416["ancestors"], null) == null ? [] : local.m1416["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1416["datacenter"], null) == null ? [] : local.m1416["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "discovery_protocol" {
    for_each = try(local.m1416["discovery_protocol"], null) == null ? [] : local.m1416["discovery_protocol"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hosts" {
    for_each = try(local.m1416["hosts"], null) == null ? [] : local.m1416["hosts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nic_teaming_and_failover" {
    for_each = try(local.m1416["nic_teaming_and_failover"], null) == null ? [] : local.m1416["nic_teaming_and_failover"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1416["parent"], null) == null ? [] : local.m1416["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1416["permission_resources"], null) == null ? [] : local.m1416["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1416["registered_device"], null) == null ? [] : local.m1416["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_allocation_system_traffic" {
    for_each = try(local.m1416["resource_allocation_system_traffic"], null) == null ? [] : local.m1416["resource_allocation_system_traffic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_capacity" {
    for_each = try(local.m1416["switch_capacity"], null) == null ? [] : local.m1416["switch_capacity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1416["tags"], null) == null ? [] : local.m1416["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1416["version_context"], null) == null ? [] : local.m1416["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
