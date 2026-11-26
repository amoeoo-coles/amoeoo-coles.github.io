# Sample data source intersight_graphics_card — reads ../models/data_intersight_graphics_card.yml
locals { m516 = yamldecode(file("${path.module}/../models/data_intersight_graphics_card.yml"))["data_intersight_graphics_card"] }

data "intersight_graphics_card" "n516" {
  account_moid = try(local.m516["account_moid"], null)
  additional_properties = try(local.m516["additional_properties"], null)
  card_id = try(local.m516["card_id"], null)
  class_id = try(local.m516["class_id"], null)
  create_time = try(local.m516["create_time"], null)
  description = try(local.m516["description"], null)
  device_id = try(local.m516["device_id"], null)
  device_mo_id = try(local.m516["device_mo_id"], null)
  dn = try(local.m516["dn"], null)
  domain_group_moid = try(local.m516["domain_group_moid"], null)
  expander_slot = try(local.m516["expander_slot"], null)
  firmware_version = try(local.m516["firmware_version"], null)
  gpu_id = try(local.m516["gpu_id"], null)
  id = try(local.m516["id"], null)
  is_platform_supported = try(local.m516["is_platform_supported"], null)
  is_upgraded = try(local.m516["is_upgraded"], null)
  mod_time = try(local.m516["mod_time"], null)
  mode = try(local.m516["mode"], null)
  model = try(local.m516["model"], null)
  moid = try(local.m516["moid"], null)
  num_gpus = try(local.m516["num_gpus"], null)
  object_type = try(local.m516["object_type"], null)
  oper_reason = try(local.m516["oper_reason"], null)
  oper_state = try(local.m516["oper_state"], null)
  owners = try(local.m516["owners"], null)
  part_number = try(local.m516["part_number"], null)
  pci_address = try(local.m516["pci_address"], null)
  pci_address_list = try(local.m516["pci_address_list"], null)
  pci_slot = try(local.m516["pci_slot"], null)
  pid = try(local.m516["pid"], null)
  presence = try(local.m516["presence"], null)
  results = try(local.m516["results"], null)
  revision = try(local.m516["revision"], null)
  rn = try(local.m516["rn"], null)
  serial = try(local.m516["serial"], null)
  shared_scope = try(local.m516["shared_scope"], null)
  sub_device_id = try(local.m516["sub_device_id"], null)
  sub_vendor_id = try(local.m516["sub_vendor_id"], null)
  vendor = try(local.m516["vendor"], null)
  vendor_id = try(local.m516["vendor_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m516["ancestors"], null) == null ? [] : local.m516["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m516["compute_blade"], null) == null ? [] : local.m516["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m516["compute_board"], null) == null ? [] : local.m516["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m516["compute_rack_unit"], null) == null ? [] : local.m516["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_enclosure_element" {
    for_each = try(local.m516["equipment_enclosure_element"], null) == null ? [] : local.m516["equipment_enclosure_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_interconnect" {
    for_each = try(local.m516["equipment_interconnect"], null) == null ? [] : local.m516["equipment_interconnect"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_shared_graphics_card" {
    for_each = try(local.m516["equipment_shared_graphics_card"], null) == null ? [] : local.m516["equipment_shared_graphics_card"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_controllers" {
    for_each = try(local.m516["graphics_controllers"], null) == null ? [] : local.m516["graphics_controllers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m516["inventory_device_info"], null) == null ? [] : local.m516["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m516["parent"], null) == null ? [] : local.m516["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_device" {
    for_each = try(local.m516["pci_device"], null) == null ? [] : local.m516["pci_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m516["pci_node"], null) == null ? [] : local.m516["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m516["permission_resources"], null) == null ? [] : local.m516["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m516["previous_fru"], null) == null ? [] : local.m516["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m516["registered_device"], null) == null ? [] : local.m516["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m516["running_firmware"], null) == null ? [] : local.m516["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m516["tags"], null) == null ? [] : local.m516["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m516["version_context"], null) == null ? [] : local.m516["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
