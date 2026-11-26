# Sample data source intersight_compute_board — reads ../models/data_intersight_compute_board.yml
locals { m237 = yamldecode(file("${path.module}/../models/data_intersight_compute_board.yml"))["data_intersight_compute_board"] }

data "intersight_compute_board" "n237" {
  account_moid = try(local.m237["account_moid"], null)
  additional_properties = try(local.m237["additional_properties"], null)
  board_id = try(local.m237["board_id"], null)
  class_id = try(local.m237["class_id"], null)
  cpu_type_controller = try(local.m237["cpu_type_controller"], null)
  create_time = try(local.m237["create_time"], null)
  device_mo_id = try(local.m237["device_mo_id"], null)
  dn = try(local.m237["dn"], null)
  domain_group_moid = try(local.m237["domain_group_moid"], null)
  id = try(local.m237["id"], null)
  is_upgraded = try(local.m237["is_upgraded"], null)
  mod_time = try(local.m237["mod_time"], null)
  model = try(local.m237["model"], null)
  moid = try(local.m237["moid"], null)
  object_type = try(local.m237["object_type"], null)
  oper_power_state = try(local.m237["oper_power_state"], null)
  oper_reason = try(local.m237["oper_reason"], null)
  owners = try(local.m237["owners"], null)
  presence = try(local.m237["presence"], null)
  results = try(local.m237["results"], null)
  revision = try(local.m237["revision"], null)
  rn = try(local.m237["rn"], null)
  serial = try(local.m237["serial"], null)
  shared_scope = try(local.m237["shared_scope"], null)
  vendor = try(local.m237["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m237["ancestors"], null) == null ? [] : local.m237["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m237["compute_blade"], null) == null ? [] : local.m237["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m237["compute_rack_unit"], null) == null ? [] : local.m237["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_tpms" {
    for_each = try(local.m237["equipment_tpms"], null) == null ? [] : local.m237["equipment_tpms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m237["graphics_cards"], null) == null ? [] : local.m237["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hybrid_drive_slots" {
    for_each = try(local.m237["hybrid_drive_slots"], null) == null ? [] : local.m237["hybrid_drive_slots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "interconnects" {
    for_each = try(local.m237["interconnects"], null) == null ? [] : local.m237["interconnects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m237["inventory_device_info"], null) == null ? [] : local.m237["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_arrays" {
    for_each = try(local.m237["memory_arrays"], null) == null ? [] : local.m237["memory_arrays"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m237["parent"], null) == null ? [] : local.m237["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_coprocessor_cards" {
    for_each = try(local.m237["pci_coprocessor_cards"], null) == null ? [] : local.m237["pci_coprocessor_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_switch" {
    for_each = try(local.m237["pci_switch"], null) == null ? [] : local.m237["pci_switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m237["permission_resources"], null) == null ? [] : local.m237["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_configuration" {
    for_each = try(local.m237["persistent_memory_configuration"], null) == null ? [] : local.m237["persistent_memory_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m237["previous_fru"], null) == null ? [] : local.m237["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processors" {
    for_each = try(local.m237["processors"], null) == null ? [] : local.m237["processors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m237["registered_device"], null) == null ? [] : local.m237["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "security_units" {
    for_each = try(local.m237["security_units"], null) == null ? [] : local.m237["security_units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller_drives" {
    for_each = try(local.m237["storage_controller_drives"], null) == null ? [] : local.m237["storage_controller_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controllers" {
    for_each = try(local.m237["storage_controllers"], null) == null ? [] : local.m237["storage_controllers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_flash_controllers" {
    for_each = try(local.m237["storage_flex_flash_controllers"], null) == null ? [] : local.m237["storage_flex_flash_controllers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_util_controllers" {
    for_each = try(local.m237["storage_flex_util_controllers"], null) == null ? [] : local.m237["storage_flex_util_controllers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m237["tags"], null) == null ? [] : local.m237["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m237["version_context"], null) == null ? [] : local.m237["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
