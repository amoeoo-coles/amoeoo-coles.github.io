# Sample data source intersight_hci_ahv_vm_gpu — reads ../models/data_intersight_hci_ahv_vm_gpu.yml
locals { m520 = yamldecode(file("${path.module}/../models/data_intersight_hci_ahv_vm_gpu.yml"))["data_intersight_hci_ahv_vm_gpu"] }

data "intersight_hci_ahv_vm_gpu" "n520" {
  account_moid = try(local.m520["account_moid"], null)
  additional_properties = try(local.m520["additional_properties"], null)
  class_id = try(local.m520["class_id"], null)
  create_time = try(local.m520["create_time"], null)
  device_id = try(local.m520["device_id"], null)
  domain_group_moid = try(local.m520["domain_group_moid"], null)
  fraction = try(local.m520["fraction"], null)
  frame_buffer_size_bytes = try(local.m520["frame_buffer_size_bytes"], null)
  gpu_ext_id = try(local.m520["gpu_ext_id"], null)
  guest_driver_version = try(local.m520["guest_driver_version"], null)
  id = try(local.m520["id"], null)
  mod_time = try(local.m520["mod_time"], null)
  mode = try(local.m520["mode"], null)
  moid = try(local.m520["moid"], null)
  name = try(local.m520["name"], null)
  num_virtual_display_heads = try(local.m520["num_virtual_display_heads"], null)
  object_type = try(local.m520["object_type"], null)
  owners = try(local.m520["owners"], null)
  results = try(local.m520["results"], null)
  shared_scope = try(local.m520["shared_scope"], null)
  vendor = try(local.m520["vendor"], null)
  vm_ext_id = try(local.m520["vm_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m520["ancestors"], null) == null ? [] : local.m520["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m520["parent"], null) == null ? [] : local.m520["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_address" {
    for_each = try(local.m520["pci_address"], null) == null ? [] : local.m520["pci_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m520["permission_resources"], null) == null ? [] : local.m520["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m520["registered_device"], null) == null ? [] : local.m520["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m520["tags"], null) == null ? [] : local.m520["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m520["version_context"], null) == null ? [] : local.m520["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm" {
    for_each = try(local.m520["vm"], null) == null ? [] : local.m520["vm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
