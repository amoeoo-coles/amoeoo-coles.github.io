# Sample data source intersight_virtualization_vmware_datacenter — reads ../models/data_intersight_virtualization_vmware_datacenter.yml
locals { m1412 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_datacenter.yml"))["data_intersight_virtualization_vmware_datacenter"] }

data "intersight_virtualization_vmware_datacenter" "n1412" {
  account_moid = try(local.m1412["account_moid"], null)
  additional_properties = try(local.m1412["additional_properties"], null)
  class_id = try(local.m1412["class_id"], null)
  cluster_count = try(local.m1412["cluster_count"], null)
  create_time = try(local.m1412["create_time"], null)
  datastore_count = try(local.m1412["datastore_count"], null)
  distributed_network_count = try(local.m1412["distributed_network_count"], null)
  distributed_virtual_switch_count = try(local.m1412["distributed_virtual_switch_count"], null)
  domain_group_moid = try(local.m1412["domain_group_moid"], null)
  host_count = try(local.m1412["host_count"], null)
  id = try(local.m1412["id"], null)
  identity = try(local.m1412["identity"], null)
  inventory_path = try(local.m1412["inventory_path"], null)
  mod_time = try(local.m1412["mod_time"], null)
  moid = try(local.m1412["moid"], null)
  name = try(local.m1412["name"], null)
  network_count = try(local.m1412["network_count"], null)
  object_type = try(local.m1412["object_type"], null)
  owners = try(local.m1412["owners"], null)
  results = try(local.m1412["results"], null)
  shared_scope = try(local.m1412["shared_scope"], null)
  standard_network_count = try(local.m1412["standard_network_count"], null)
  uuid = try(local.m1412["uuid"], null)
  vm_count = try(local.m1412["vm_count"], null)
  vm_template_count = try(local.m1412["vm_template_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1412["ancestors"], null) == null ? [] : local.m1412["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attached_resource_tags" {
    for_each = try(local.m1412["attached_resource_tags"], null) == null ? [] : local.m1412["attached_resource_tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hypervisor_manager" {
    for_each = try(local.m1412["hypervisor_manager"], null) == null ? [] : local.m1412["hypervisor_manager"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1412["parent"], null) == null ? [] : local.m1412["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_folder" {
    for_each = try(local.m1412["parent_folder"], null) == null ? [] : local.m1412["parent_folder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1412["permission_resources"], null) == null ? [] : local.m1412["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1412["registered_device"], null) == null ? [] : local.m1412["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1412["tags"], null) == null ? [] : local.m1412["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1412["version_context"], null) == null ? [] : local.m1412["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
