# Sample data source intersight_virtualization_vmware_kernel_network — reads ../models/data_intersight_virtualization_vmware_kernel_network.yml
locals { m1420 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_kernel_network.yml"))["data_intersight_virtualization_vmware_kernel_network"] }

data "intersight_virtualization_vmware_kernel_network" "n1420" {
  account_moid = try(local.m1420["account_moid"], null)
  additional_properties = try(local.m1420["additional_properties"], null)
  class_id = try(local.m1420["class_id"], null)
  create_time = try(local.m1420["create_time"], null)
  domain_group_moid = try(local.m1420["domain_group_moid"], null)
  fault_tolerance_logging = try(local.m1420["fault_tolerance_logging"], null)
  id = try(local.m1420["id"], null)
  identity = try(local.m1420["identity"], null)
  ip_address = try(local.m1420["ip_address"], null)
  mac_address = try(local.m1420["mac_address"], null)
  management = try(local.m1420["management"], null)
  mod_time = try(local.m1420["mod_time"], null)
  moid = try(local.m1420["moid"], null)
  mtu = try(local.m1420["mtu"], null)
  name = try(local.m1420["name"], null)
  object_type = try(local.m1420["object_type"], null)
  owners = try(local.m1420["owners"], null)
  results = try(local.m1420["results"], null)
  shared_scope = try(local.m1420["shared_scope"], null)
  subnet_mask = try(local.m1420["subnet_mask"], null)
  tcp_ip_stack = try(local.m1420["tcp_ip_stack"], null)
  vmotion = try(local.m1420["vmotion"], null)
  vsan = try(local.m1420["vsan"], null)
  vsphere_provisioning = try(local.m1420["vsphere_provisioning"], null)
  vsphere_replication = try(local.m1420["vsphere_replication"], null)
  vsphere_replication_nfc = try(local.m1420["vsphere_replication_nfc"], null)
  dynamic "ancestors" {
    for_each = try(local.m1420["ancestors"], null) == null ? [] : local.m1420["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributed_network" {
    for_each = try(local.m1420["distributed_network"], null) == null ? [] : local.m1420["distributed_network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1420["host"], null) == null ? [] : local.m1420["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network" {
    for_each = try(local.m1420["network"], null) == null ? [] : local.m1420["network"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1420["parent"], null) == null ? [] : local.m1420["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1420["permission_resources"], null) == null ? [] : local.m1420["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1420["registered_device"], null) == null ? [] : local.m1420["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1420["tags"], null) == null ? [] : local.m1420["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1420["version_context"], null) == null ? [] : local.m1420["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
