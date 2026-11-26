# Sample data source intersight_firmware_running_firmware — reads ../models/data_intersight_firmware_running_firmware.yml
locals { m499 = yamldecode(file("${path.module}/../models/data_intersight_firmware_running_firmware.yml"))["data_intersight_firmware_running_firmware"] }

data "intersight_firmware_running_firmware" "n499" {
  account_moid = try(local.m499["account_moid"], null)
  additional_properties = try(local.m499["additional_properties"], null)
  class_id = try(local.m499["class_id"], null)
  component = try(local.m499["component"], null)
  create_time = try(local.m499["create_time"], null)
  device_mo_id = try(local.m499["device_mo_id"], null)
  dn = try(local.m499["dn"], null)
  domain_group_moid = try(local.m499["domain_group_moid"], null)
  id = try(local.m499["id"], null)
  mod_time = try(local.m499["mod_time"], null)
  moid = try(local.m499["moid"], null)
  nr_version = try(local.m499["nr_version"], null)
  object_type = try(local.m499["object_type"], null)
  owners = try(local.m499["owners"], null)
  package_version = try(local.m499["package_version"], null)
  results = try(local.m499["results"], null)
  rn = try(local.m499["rn"], null)
  shared_scope = try(local.m499["shared_scope"], null)
  type = try(local.m499["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m499["ancestors"], null) == null ? [] : local.m499["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_unit" {
    for_each = try(local.m499["bios_unit"], null) == null ? [] : local.m499["bios_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_enclosure_element" {
    for_each = try(local.m499["equipment_enclosure_element"], null) == null ? [] : local.m499["equipment_enclosure_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_psu" {
    for_each = try(local.m499["equipment_psu"], null) == null ? [] : local.m499["equipment_psu"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_card" {
    for_each = try(local.m499["graphics_card"], null) == null ? [] : local.m499["graphics_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m499["inventory_device_info"], null) == null ? [] : local.m499["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_controller" {
    for_each = try(local.m499["management_controller"], null) == null ? [] : local.m499["management_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_elements" {
    for_each = try(local.m499["network_elements"], null) == null ? [] : local.m499["network_elements"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m499["parent"], null) == null ? [] : local.m499["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switch" {
    for_each = try(local.m499["pci_switch"], null) == null ? [] : local.m499["pci_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m499["permission_resources"], null) == null ? [] : local.m499["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m499["registered_device"], null) == null ? [] : local.m499["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m499["storage_controller"], null) == null ? [] : local.m499["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_flash_controller" {
    for_each = try(local.m499["storage_flex_flash_controller"], null) == null ? [] : local.m499["storage_flex_flash_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_physical_disk" {
    for_each = try(local.m499["storage_physical_disk"], null) == null ? [] : local.m499["storage_physical_disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m499["tags"], null) == null ? [] : local.m499["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m499["version_context"], null) == null ? [] : local.m499["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
