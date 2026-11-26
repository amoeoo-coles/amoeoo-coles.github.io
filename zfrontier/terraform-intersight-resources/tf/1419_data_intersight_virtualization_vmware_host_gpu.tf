# Sample data source intersight_virtualization_vmware_host_gpu — reads ../models/data_intersight_virtualization_vmware_host_gpu.yml
locals { m1419 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_host_gpu.yml"))["data_intersight_virtualization_vmware_host_gpu"] }

data "intersight_virtualization_vmware_host_gpu" "n1419" {
  account_moid = try(local.m1419["account_moid"], null)
  additional_properties = try(local.m1419["additional_properties"], null)
  bus = try(local.m1419["bus"], null)
  class_id = try(local.m1419["class_id"], null)
  create_time = try(local.m1419["create_time"], null)
  device_id = try(local.m1419["device_id"], null)
  device_name = try(local.m1419["device_name"], null)
  domain_group_moid = try(local.m1419["domain_group_moid"], null)
  function = try(local.m1419["function"], null)
  id = try(local.m1419["id"], null)
  identity = try(local.m1419["identity"], null)
  mod_time = try(local.m1419["mod_time"], null)
  moid = try(local.m1419["moid"], null)
  object_type = try(local.m1419["object_type"], null)
  owners = try(local.m1419["owners"], null)
  passthrough_active = try(local.m1419["passthrough_active"], null)
  passthrough_enabled = try(local.m1419["passthrough_enabled"], null)
  pci_class_id = try(local.m1419["pci_class_id"], null)
  pci_id = try(local.m1419["pci_id"], null)
  results = try(local.m1419["results"], null)
  shared_scope = try(local.m1419["shared_scope"], null)
  slot = try(local.m1419["slot"], null)
  sub_device_id = try(local.m1419["sub_device_id"], null)
  sub_vendor_id = try(local.m1419["sub_vendor_id"], null)
  vendor_id = try(local.m1419["vendor_id"], null)
  vendor_name = try(local.m1419["vendor_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1419["ancestors"], null) == null ? [] : local.m1419["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1419["cluster"], null) == null ? [] : local.m1419["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1419["host"], null) == null ? [] : local.m1419["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1419["parent"], null) == null ? [] : local.m1419["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1419["permission_resources"], null) == null ? [] : local.m1419["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1419["registered_device"], null) == null ? [] : local.m1419["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1419["tags"], null) == null ? [] : local.m1419["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1419["version_context"], null) == null ? [] : local.m1419["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
