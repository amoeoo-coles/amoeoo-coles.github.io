# Sample data source intersight_hci_esxi_vm_disk — reads ../models/data_intersight_hci_esxi_vm_disk.yml
locals { m530 = yamldecode(file("${path.module}/../models/data_intersight_hci_esxi_vm_disk.yml"))["data_intersight_hci_esxi_vm_disk"] }

data "intersight_hci_esxi_vm_disk" "n530" {
  account_moid = try(local.m530["account_moid"], null)
  additional_properties = try(local.m530["additional_properties"], null)
  bus_type = try(local.m530["bus_type"], null)
  class_id = try(local.m530["class_id"], null)
  create_time = try(local.m530["create_time"], null)
  disk_ext_id = try(local.m530["disk_ext_id"], null)
  disk_size_bytes = try(local.m530["disk_size_bytes"], null)
  domain_group_moid = try(local.m530["domain_group_moid"], null)
  id = try(local.m530["id"], null)
  index = try(local.m530["index"], null)
  is_flash_mode_enabled = try(local.m530["is_flash_mode_enabled"], null)
  mod_time = try(local.m530["mod_time"], null)
  moid = try(local.m530["moid"], null)
  object_type = try(local.m530["object_type"], null)
  owners = try(local.m530["owners"], null)
  results = try(local.m530["results"], null)
  shared_scope = try(local.m530["shared_scope"], null)
  storage_container_ext_id = try(local.m530["storage_container_ext_id"], null)
  vm_ext_id = try(local.m530["vm_ext_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m530["ancestors"], null) == null ? [] : local.m530["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m530["parent"], null) == null ? [] : local.m530["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m530["permission_resources"], null) == null ? [] : local.m530["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m530["registered_device"], null) == null ? [] : local.m530["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m530["tags"], null) == null ? [] : local.m530["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m530["version_context"], null) == null ? [] : local.m530["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vm" {
    for_each = try(local.m530["vm"], null) == null ? [] : local.m530["vm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
