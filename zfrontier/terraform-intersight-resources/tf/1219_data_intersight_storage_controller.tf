# Sample data source intersight_storage_controller — reads ../models/data_intersight_storage_controller.yml
locals { m1219 = yamldecode(file("${path.module}/../models/data_intersight_storage_controller.yml"))["data_intersight_storage_controller"] }

data "intersight_storage_controller" "n1219" {
  account_moid = try(local.m1219["account_moid"], null)
  additional_properties = try(local.m1219["additional_properties"], null)
  class_id = try(local.m1219["class_id"], null)
  connected_sas_expander = try(local.m1219["connected_sas_expander"], null)
  controller_flags = try(local.m1219["controller_flags"], null)
  controller_id = try(local.m1219["controller_id"], null)
  controller_status = try(local.m1219["controller_status"], null)
  create_time = try(local.m1219["create_time"], null)
  default_drive_mode = try(local.m1219["default_drive_mode"], null)
  device_mo_id = try(local.m1219["device_mo_id"], null)
  dn = try(local.m1219["dn"], null)
  domain_group_moid = try(local.m1219["domain_group_moid"], null)
  ecc_bucket_leak_rate = try(local.m1219["ecc_bucket_leak_rate"], null)
  foreign_config_present = try(local.m1219["foreign_config_present"], null)
  hw_revision = try(local.m1219["hw_revision"], null)
  hybrid_slots_supported = try(local.m1219["hybrid_slots_supported"], null)
  id = try(local.m1219["id"], null)
  interface_type = try(local.m1219["interface_type"], null)
  is_upgraded = try(local.m1219["is_upgraded"], null)
  max_volumes_supported = try(local.m1219["max_volumes_supported"], null)
  memory_correctable_errors = try(local.m1219["memory_correctable_errors"], null)
  mod_time = try(local.m1219["mod_time"], null)
  model = try(local.m1219["model"], null)
  moid = try(local.m1219["moid"], null)
  name = try(local.m1219["name"], null)
  object_type = try(local.m1219["object_type"], null)
  oob_interface_supported = try(local.m1219["oob_interface_supported"], null)
  oper_reason = try(local.m1219["oper_reason"], null)
  oper_state = try(local.m1219["oper_state"], null)
  operability = try(local.m1219["operability"], null)
  owners = try(local.m1219["owners"], null)
  pci_addr = try(local.m1219["pci_addr"], null)
  pci_slot = try(local.m1219["pci_slot"], null)
  persistent_cache_size = try(local.m1219["persistent_cache_size"], null)
  pinned_cache_state = try(local.m1219["pinned_cache_state"], null)
  presence = try(local.m1219["presence"], null)
  raid_support = try(local.m1219["raid_support"], null)
  rebuild_rate = try(local.m1219["rebuild_rate"], null)
  rebuild_rate_percent = try(local.m1219["rebuild_rate_percent"], null)
  results = try(local.m1219["results"], null)
  revision = try(local.m1219["revision"], null)
  rn = try(local.m1219["rn"], null)
  self_encrypt_enabled = try(local.m1219["self_encrypt_enabled"], null)
  serial = try(local.m1219["serial"], null)
  shared_scope = try(local.m1219["shared_scope"], null)
  sub_oem_id = try(local.m1219["sub_oem_id"], null)
  supported_strip_sizes = try(local.m1219["supported_strip_sizes"], null)
  total_cache_size = try(local.m1219["total_cache_size"], null)
  type = try(local.m1219["type"], null)
  vendor = try(local.m1219["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1219["ancestors"], null) == null ? [] : local.m1219["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_battery_unit" {
    for_each = try(local.m1219["backup_battery_unit"], null) == null ? [] : local.m1219["backup_battery_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m1219["compute_blade"], null) == null ? [] : local.m1219["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1219["compute_board"], null) == null ? [] : local.m1219["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1219["compute_rack_unit"], null) == null ? [] : local.m1219["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_group" {
    for_each = try(local.m1219["disk_group"], null) == null ? [] : local.m1219["disk_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_slot" {
    for_each = try(local.m1219["disk_slot"], null) == null ? [] : local.m1219["disk_slot"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1219["inventory_device_info"], null) == null ? [] : local.m1219["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1219["parent"], null) == null ? [] : local.m1219["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1219["permission_resources"], null) == null ? [] : local.m1219["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disk_extensions" {
    for_each = try(local.m1219["physical_disk_extensions"], null) == null ? [] : local.m1219["physical_disk_extensions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disks" {
    for_each = try(local.m1219["physical_disks"], null) == null ? [] : local.m1219["physical_disks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1219["previous_fru"], null) == null ? [] : local.m1219["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1219["registered_device"], null) == null ? [] : local.m1219["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m1219["running_firmware"], null) == null ? [] : local.m1219["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1219["tags"], null) == null ? [] : local.m1219["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1219["version_context"], null) == null ? [] : local.m1219["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drive_extensions" {
    for_each = try(local.m1219["virtual_drive_extensions"], null) == null ? [] : local.m1219["virtual_drive_extensions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drives" {
    for_each = try(local.m1219["virtual_drives"], null) == null ? [] : local.m1219["virtual_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
