# Sample data source intersight_virtualization_vmware_folder — reads ../models/data_intersight_virtualization_vmware_folder.yml
locals { m1417 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_folder.yml"))["data_intersight_virtualization_vmware_folder"] }

data "intersight_virtualization_vmware_folder" "n1417" {
  account_moid = try(local.m1417["account_moid"], null)
  additional_properties = try(local.m1417["additional_properties"], null)
  class_id = try(local.m1417["class_id"], null)
  create_time = try(local.m1417["create_time"], null)
  domain_group_moid = try(local.m1417["domain_group_moid"], null)
  id = try(local.m1417["id"], null)
  identity = try(local.m1417["identity"], null)
  internal = try(local.m1417["internal"], null)
  inventory_path = try(local.m1417["inventory_path"], null)
  mod_time = try(local.m1417["mod_time"], null)
  moid = try(local.m1417["moid"], null)
  name = try(local.m1417["name"], null)
  object_type = try(local.m1417["object_type"], null)
  owners = try(local.m1417["owners"], null)
  results = try(local.m1417["results"], null)
  shared_scope = try(local.m1417["shared_scope"], null)
  typeof_folder = try(local.m1417["typeof_folder"], null)
  dynamic "ancestors" {
    for_each = try(local.m1417["ancestors"], null) == null ? [] : local.m1417["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "datacenter" {
    for_each = try(local.m1417["datacenter"], null) == null ? [] : local.m1417["datacenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hypervisor_manager" {
    for_each = try(local.m1417["hypervisor_manager"], null) == null ? [] : local.m1417["hypervisor_manager"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1417["parent"], null) == null ? [] : local.m1417["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1417["permission_resources"], null) == null ? [] : local.m1417["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1417["registered_device"], null) == null ? [] : local.m1417["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1417["tags"], null) == null ? [] : local.m1417["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1417["version_context"], null) == null ? [] : local.m1417["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vmware_folder" {
    for_each = try(local.m1417["vmware_folder"], null) == null ? [] : local.m1417["vmware_folder"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
