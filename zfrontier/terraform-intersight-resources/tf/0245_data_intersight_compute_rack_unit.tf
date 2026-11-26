# Sample data source intersight_compute_rack_unit — reads ../models/data_intersight_compute_rack_unit.yml
locals { m245 = yamldecode(file("${path.module}/../models/data_intersight_compute_rack_unit.yml"))["data_intersight_compute_rack_unit"] }

data "intersight_compute_rack_unit" "n245" {
  account_moid = try(local.m245["account_moid"], null)
  additional_properties = try(local.m245["additional_properties"], null)
  admin_action = try(local.m245["admin_action"], null)
  admin_power_state = try(local.m245["admin_power_state"], null)
  asset_tag = try(local.m245["asset_tag"], null)
  available_memory = try(local.m245["available_memory"], null)
  bios_post_complete = try(local.m245["bios_post_complete"], null)
  bmc_inventory_ready = try(local.m245["bmc_inventory_ready"], null)
  boot_last_state = try(local.m245["boot_last_state"], null)
  boot_oem_last_state = try(local.m245["boot_oem_last_state"], null)
  class_id = try(local.m245["class_id"], null)
  connection_status = try(local.m245["connection_status"], null)
  cooling_mode = try(local.m245["cooling_mode"], null)
  cpu_capacity = try(local.m245["cpu_capacity"], null)
  create_time = try(local.m245["create_time"], null)
  device_mo_id = try(local.m245["device_mo_id"], null)
  dimm_blocklisting = try(local.m245["dimm_blocklisting"], null)
  dn = try(local.m245["dn"], null)
  domain_group_moid = try(local.m245["domain_group_moid"], null)
  fault_summary = try(local.m245["fault_summary"], null)
  front_panel_lock_state = try(local.m245["front_panel_lock_state"], null)
  hardware_uuid = try(local.m245["hardware_uuid"], null)
  has_e3_s_support = try(local.m245["has_e3_s_support"], null)
  id = try(local.m245["id"], null)
  is_upgraded = try(local.m245["is_upgraded"], null)
  kvm_server_state_enabled = try(local.m245["kvm_server_state_enabled"], null)
  kvm_vendor = try(local.m245["kvm_vendor"], null)
  last_power_state_changed_time = try(local.m245["last_power_state_changed_time"], null)
  management_mode = try(local.m245["management_mode"], null)
  memory_speed = try(local.m245["memory_speed"], null)
  mgmt_ip_address = try(local.m245["mgmt_ip_address"], null)
  mod_time = try(local.m245["mod_time"], null)
  model = try(local.m245["model"], null)
  moid = try(local.m245["moid"], null)
  name = try(local.m245["name"], null)
  nr_lifecycle = try(local.m245["nr_lifecycle"], null)
  num_adaptors = try(local.m245["num_adaptors"], null)
  num_cpu_cores = try(local.m245["num_cpu_cores"], null)
  num_cpu_cores_enabled = try(local.m245["num_cpu_cores_enabled"], null)
  num_cpus = try(local.m245["num_cpus"], null)
  num_eth_host_interfaces = try(local.m245["num_eth_host_interfaces"], null)
  num_fc_host_interfaces = try(local.m245["num_fc_host_interfaces"], null)
  num_threads = try(local.m245["num_threads"], null)
  object_type = try(local.m245["object_type"], null)
  oper_power_state = try(local.m245["oper_power_state"], null)
  oper_reason = try(local.m245["oper_reason"], null)
  oper_state = try(local.m245["oper_state"], null)
  operability = try(local.m245["operability"], null)
  owners = try(local.m245["owners"], null)
  platform_type = try(local.m245["platform_type"], null)
  presence = try(local.m245["presence"], null)
  results = try(local.m245["results"], null)
  revision = try(local.m245["revision"], null)
  rn = try(local.m245["rn"], null)
  serial = try(local.m245["serial"], null)
  server_id = try(local.m245["server_id"], null)
  service_profile = try(local.m245["service_profile"], null)
  shared_scope = try(local.m245["shared_scope"], null)
  topology_scan_status = try(local.m245["topology_scan_status"], null)
  total_memory = try(local.m245["total_memory"], null)
  tunneled_kvm = try(local.m245["tunneled_kvm"], null)
  user_label = try(local.m245["user_label"], null)
  uuid = try(local.m245["uuid"], null)
  vendor = try(local.m245["vendor"], null)
  dynamic "adapters" {
    for_each = try(local.m245["adapters"], null) == null ? [] : local.m245["adapters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_summary" {
    for_each = try(local.m245["alarm_summary"], null) == null ? [] : local.m245["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m245["ancestors"], null) == null ? [] : local.m245["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_location" {
    for_each = try(local.m245["assigned_location"], null) == null ? [] : local.m245["assigned_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_bootmode" {
    for_each = try(local.m245["bios_bootmode"], null) == null ? [] : local.m245["bios_bootmode"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_token_settings" {
    for_each = try(local.m245["bios_token_settings"], null) == null ? [] : local.m245["bios_token_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_vf_select_memory_ras_configuration" {
    for_each = try(local.m245["bios_vf_select_memory_ras_configuration"], null) == null ? [] : local.m245["bios_vf_select_memory_ras_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "biosunits" {
    for_each = try(local.m245["biosunits"], null) == null ? [] : local.m245["biosunits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bmc" {
    for_each = try(local.m245["bmc"], null) == null ? [] : local.m245["bmc"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "board" {
    for_each = try(local.m245["board"], null) == null ? [] : local.m245["board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_cdd_devices" {
    for_each = try(local.m245["boot_cdd_devices"], null) == null ? [] : local.m245["boot_cdd_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_device_boot_security" {
    for_each = try(local.m245["boot_device_boot_security"], null) == null ? [] : local.m245["boot_device_boot_security"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_device_bootmode" {
    for_each = try(local.m245["boot_device_bootmode"], null) == null ? [] : local.m245["boot_device_bootmode"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_hdd_devices" {
    for_each = try(local.m245["boot_hdd_devices"], null) == null ? [] : local.m245["boot_hdd_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_iscsi_devices" {
    for_each = try(local.m245["boot_iscsi_devices"], null) == null ? [] : local.m245["boot_iscsi_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_nvme_devices" {
    for_each = try(local.m245["boot_nvme_devices"], null) == null ? [] : local.m245["boot_nvme_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_pch_storage_devices" {
    for_each = try(local.m245["boot_pch_storage_devices"], null) == null ? [] : local.m245["boot_pch_storage_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_pxe_devices" {
    for_each = try(local.m245["boot_pxe_devices"], null) == null ? [] : local.m245["boot_pxe_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_san_devices" {
    for_each = try(local.m245["boot_san_devices"], null) == null ? [] : local.m245["boot_san_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_sd_devices" {
    for_each = try(local.m245["boot_sd_devices"], null) == null ? [] : local.m245["boot_sd_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_uefi_shell_devices" {
    for_each = try(local.m245["boot_uefi_shell_devices"], null) == null ? [] : local.m245["boot_uefi_shell_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_usb_devices" {
    for_each = try(local.m245["boot_usb_devices"], null) == null ? [] : local.m245["boot_usb_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_vmedia_devices" {
    for_each = try(local.m245["boot_vmedia_devices"], null) == null ? [] : local.m245["boot_vmedia_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_personality" {
    for_each = try(local.m245["compute_personality"], null) == null ? [] : local.m245["compute_personality"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_server_power_parameters" {
    for_each = try(local.m245["compute_server_power_parameters"], null) == null ? [] : local.m245["compute_server_power_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_enclosure_elements" {
    for_each = try(local.m245["equipment_enclosure_elements"], null) == null ? [] : local.m245["equipment_enclosure_elements"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_risers" {
    for_each = try(local.m245["equipment_risers"], null) == null ? [] : local.m245["equipment_risers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fanmodules" {
    for_each = try(local.m245["fanmodules"], null) == null ? [] : local.m245["fanmodules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "generic_inventory_holders" {
    for_each = try(local.m245["generic_inventory_holders"], null) == null ? [] : local.m245["generic_inventory_holders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m245["graphics_cards"], null) == null ? [] : local.m245["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hybrid_drive_slots" {
    for_each = try(local.m245["hybrid_drive_slots"], null) == null ? [] : local.m245["hybrid_drive_slots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m245["inventory_device_info"], null) == null ? [] : local.m245["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kvm_ip_addresses" {
    for_each = try(local.m245["kvm_ip_addresses"], null) == null ? [] : local.m245["kvm_ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m245["location_details"], null) == null ? [] : local.m245["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m245["locator_led"], null) == null ? [] : local.m245["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_arrays" {
    for_each = try(local.m245["memory_arrays"], null) == null ? [] : local.m245["memory_arrays"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_identity" {
    for_each = try(local.m245["mgmt_identity"], null) == null ? [] : local.m245["mgmt_identity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m245["parent"], null) == null ? [] : local.m245["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_devices" {
    for_each = try(local.m245["pci_devices"], null) == null ? [] : local.m245["pci_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_slots" {
    for_each = try(local.m245["pci_slots"], null) == null ? [] : local.m245["pci_slots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m245["permission_resources"], null) == null ? [] : local.m245["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m245["previous_fru"], null) == null ? [] : local.m245["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processors" {
    for_each = try(local.m245["processors"], null) == null ? [] : local.m245["processors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "psus" {
    for_each = try(local.m245["psus"], null) == null ? [] : local.m245["psus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rack_enclosure_slot" {
    for_each = try(local.m245["rack_enclosure_slot"], null) == null ? [] : local.m245["rack_enclosure_slot"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "recovery_key_details" {
    for_each = try(local.m245["recovery_key_details"], null) == null ? [] : local.m245["recovery_key_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m245["registered_device"], null) == null ? [] : local.m245["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "sas_expanders" {
    for_each = try(local.m245["sas_expanders"], null) == null ? [] : local.m245["sas_expanders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controllers" {
    for_each = try(local.m245["storage_controllers"], null) == null ? [] : local.m245["storage_controllers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_enclosures" {
    for_each = try(local.m245["storage_enclosures"], null) == null ? [] : local.m245["storage_enclosures"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m245["tags"], null) == null ? [] : local.m245["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "top_system" {
    for_each = try(local.m245["top_system"], null) == null ? [] : local.m245["top_system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "unit_personality" {
    for_each = try(local.m245["unit_personality"], null) == null ? [] : local.m245["unit_personality"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m245["version_context"], null) == null ? [] : local.m245["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vmedia" {
    for_each = try(local.m245["vmedia"], null) == null ? [] : local.m245["vmedia"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
