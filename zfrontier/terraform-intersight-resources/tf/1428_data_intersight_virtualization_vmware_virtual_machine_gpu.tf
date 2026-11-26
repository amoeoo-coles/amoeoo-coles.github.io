# Sample data source intersight_virtualization_vmware_virtual_machine_gpu — reads ../models/data_intersight_virtualization_vmware_virtual_machine_gpu.yml
locals { m1428 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_virtual_machine_gpu.yml"))["data_intersight_virtualization_vmware_virtual_machine_gpu"] }

data "intersight_virtualization_vmware_virtual_machine_gpu" "n1428" {
  account_moid = try(local.m1428["account_moid"], null)
  additional_properties = try(local.m1428["additional_properties"], null)
  backing_pci_id = try(local.m1428["backing_pci_id"], null)
  class_id = try(local.m1428["class_id"], null)
  create_time = try(local.m1428["create_time"], null)
  domain_group_moid = try(local.m1428["domain_group_moid"], null)
  id = try(local.m1428["id"], null)
  key = try(var.secrets["data_intersight_virtualization_vmware_virtual_machine_gpu.key"], local.m1428["key"])
  mod_time = try(local.m1428["mod_time"], null)
  moid = try(local.m1428["moid"], null)
  name = try(local.m1428["name"], null)
  object_type = try(local.m1428["object_type"], null)
  owners = try(local.m1428["owners"], null)
  passthrough = try(local.m1428["passthrough"], null)
  results = try(local.m1428["results"], null)
  shared_scope = try(local.m1428["shared_scope"], null)
  vm_identity = try(local.m1428["vm_identity"], null)
  dynamic "ancestors" {
    for_each = try(local.m1428["ancestors"], null) == null ? [] : local.m1428["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backing_pci_device" {
    for_each = try(local.m1428["backing_pci_device"], null) == null ? [] : local.m1428["backing_pci_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1428["parent"], null) == null ? [] : local.m1428["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1428["permission_resources"], null) == null ? [] : local.m1428["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1428["registered_device"], null) == null ? [] : local.m1428["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1428["tags"], null) == null ? [] : local.m1428["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1428["version_context"], null) == null ? [] : local.m1428["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_machine" {
    for_each = try(local.m1428["virtual_machine"], null) == null ? [] : local.m1428["virtual_machine"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
