# Sample data source intersight_compute_blade — reads ../models/data_intersight_compute_blade.yml
locals { m235 = yamldecode(file("${path.module}/../models/data_intersight_compute_blade.yml"))["data_intersight_compute_blade"] }

data "intersight_compute_blade" "n235" {
  account_moid = try(local.m235["account_moid"], null)
  additional_properties = try(local.m235["additional_properties"], null)
  admin_power_state = try(local.m235["admin_power_state"], null)
  asset_tag = try(local.m235["asset_tag"], null)
  available_memory = try(local.m235["available_memory"], null)
  bios_post_complete = try(local.m235["bios_post_complete"], null)
  bmc_inventory_ready = try(local.m235["bmc_inventory_ready"], null)
  boot_last_state = try(local.m235["boot_last_state"], null)
  boot_oem_last_state = try(local.m235["boot_oem_last_state"], null)
  chassis_id = try(local.m235["chassis_id"], null)
  class_id = try(local.m235["class_id"], null)
  cooling_mode = try(local.m235["cooling_mode"], null)
  cpu_capacity = try(local.m235["cpu_capacity"], null)
  create_time = try(local.m235["create_time"], null)
  device_mo_id = try(local.m235["device_mo_id"], null)
  dimm_blocklisting = try(local.m235["dimm_blocklisting"], null)
  dn = try(local.m235["dn"], null)
  domain_group_moid = try(local.m235["domain_group_moid"], null)
  fault_summary = try(local.m235["fault_summary"], null)
  front_panel_lock_state = try(local.m235["front_panel_lock_state"], null)
  hardware_uuid = try(local.m235["hardware_uuid"], null)
  has_e3_s_support = try(local.m235["has_e3_s_support"], null)
  id = try(local.m235["id"], null)
  is_upgraded = try(local.m235["is_upgraded"], null)
  kvm_server_state_enabled = try(local.m235["kvm_server_state_enabled"], null)
  kvm_vendor = try(local.m235["kvm_vendor"], null)
  last_power_state_changed_time = try(local.m235["last_power_state_changed_time"], null)
  management_mode = try(local.m235["management_mode"], null)
  memory_speed = try(local.m235["memory_speed"], null)
  mgmt_ip_address = try(local.m235["mgmt_ip_address"], null)
  mod_time = try(local.m235["mod_time"], null)
  model = try(local.m235["model"], null)
  moid = try(local.m235["moid"], null)
  name = try(local.m235["name"], null)
  nr_lifecycle = try(local.m235["nr_lifecycle"], null)
  num_adaptors = try(local.m235["num_adaptors"], null)
  num_cpu_cores = try(local.m235["num_cpu_cores"], null)
  num_cpu_cores_enabled = try(local.m235["num_cpu_cores_enabled"], null)
  num_cpus = try(local.m235["num_cpus"], null)
  num_eth_host_interfaces = try(local.m235["num_eth_host_interfaces"], null)
  num_fc_host_interfaces = try(local.m235["num_fc_host_interfaces"], null)
  num_threads = try(local.m235["num_threads"], null)
  object_type = try(local.m235["object_type"], null)
  oper_power_state = try(local.m235["oper_power_state"], null)
  oper_reason = try(local.m235["oper_reason"], null)
  oper_state = try(local.m235["oper_state"], null)
  operability = try(local.m235["operability"], null)
  owners = try(local.m235["owners"], null)
  platform_type = try(local.m235["platform_type"], null)
  presence = try(local.m235["presence"], null)
  results = try(local.m235["results"], null)
  revision = try(local.m235["revision"], null)
  rn = try(local.m235["rn"], null)
  scaled_mode = try(local.m235["scaled_mode"], null)
  serial = try(local.m235["serial"], null)
  service_profile = try(local.m235["service_profile"], null)
  shared_scope = try(local.m235["shared_scope"], null)
  slot_id = try(local.m235["slot_id"], null)
  total_memory = try(local.m235["total_memory"], null)
  tunneled_kvm = try(local.m235["tunneled_kvm"], null)
  user_label = try(local.m235["user_label"], null)
  uuid = try(local.m235["uuid"], null)
  vendor = try(local.m235["vendor"], null)
  dynamic "adapters" {
    for_each = try(local.m235["adapters"], null) == null ? [] : local.m235["adapters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_summary" {
    for_each = try(local.m235["alarm_summary"], null) == null ? [] : local.m235["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m235["ancestors"], null) == null ? [] : local.m235["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_bootmode" {
    for_each = try(local.m235["bios_bootmode"], null) == null ? [] : local.m235["bios_bootmode"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_token_settings" {
    for_each = try(local.m235["bios_token_settings"], null) == null ? [] : local.m235["bios_token_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_units" {
    for_each = try(local.m235["bios_units"], null) == null ? [] : local.m235["bios_units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bios_vf_select_memory_ras_configuration" {
    for_each = try(local.m235["bios_vf_select_memory_ras_configuration"], null) == null ? [] : local.m235["bios_vf_select_memory_ras_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bmc" {
    for_each = try(local.m235["bmc"], null) == null ? [] : local.m235["bmc"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "board" {
    for_each = try(local.m235["board"], null) == null ? [] : local.m235["board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_cdd_devices" {
    for_each = try(local.m235["boot_cdd_devices"], null) == null ? [] : local.m235["boot_cdd_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_device_boot_security" {
    for_each = try(local.m235["boot_device_boot_security"], null) == null ? [] : local.m235["boot_device_boot_security"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_device_bootmode" {
    for_each = try(local.m235["boot_device_bootmode"], null) == null ? [] : local.m235["boot_device_bootmode"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_hdd_devices" {
    for_each = try(local.m235["boot_hdd_devices"], null) == null ? [] : local.m235["boot_hdd_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_iscsi_devices" {
    for_each = try(local.m235["boot_iscsi_devices"], null) == null ? [] : local.m235["boot_iscsi_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_nvme_devices" {
    for_each = try(local.m235["boot_nvme_devices"], null) == null ? [] : local.m235["boot_nvme_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_pch_storage_devices" {
    for_each = try(local.m235["boot_pch_storage_devices"], null) == null ? [] : local.m235["boot_pch_storage_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_pxe_devices" {
    for_each = try(local.m235["boot_pxe_devices"], null) == null ? [] : local.m235["boot_pxe_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_san_devices" {
    for_each = try(local.m235["boot_san_devices"], null) == null ? [] : local.m235["boot_san_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_sd_devices" {
    for_each = try(local.m235["boot_sd_devices"], null) == null ? [] : local.m235["boot_sd_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_uefi_shell_devices" {
    for_each = try(local.m235["boot_uefi_shell_devices"], null) == null ? [] : local.m235["boot_uefi_shell_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_usb_devices" {
    for_each = try(local.m235["boot_usb_devices"], null) == null ? [] : local.m235["boot_usb_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_vmedia_devices" {
    for_each = try(local.m235["boot_vmedia_devices"], null) == null ? [] : local.m235["boot_vmedia_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_personality" {
    for_each = try(local.m235["compute_personality"], null) == null ? [] : local.m235["compute_personality"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_server_power_parameters" {
    for_each = try(local.m235["compute_server_power_parameters"], null) == null ? [] : local.m235["compute_server_power_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m235["equipment_chassis"], null) == null ? [] : local.m235["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_io_expanders" {
    for_each = try(local.m235["equipment_io_expanders"], null) == null ? [] : local.m235["equipment_io_expanders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_risers" {
    for_each = try(local.m235["equipment_risers"], null) == null ? [] : local.m235["equipment_risers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "generic_inventory_holders" {
    for_each = try(local.m235["generic_inventory_holders"], null) == null ? [] : local.m235["generic_inventory_holders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "graphics_cards" {
    for_each = try(local.m235["graphics_cards"], null) == null ? [] : local.m235["graphics_cards"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hybrid_drive_slots" {
    for_each = try(local.m235["hybrid_drive_slots"], null) == null ? [] : local.m235["hybrid_drive_slots"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m235["inventory_device_info"], null) == null ? [] : local.m235["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kvm_ip_addresses" {
    for_each = try(local.m235["kvm_ip_addresses"], null) == null ? [] : local.m235["kvm_ip_addresses"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m235["location_details"], null) == null ? [] : local.m235["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m235["locator_led"], null) == null ? [] : local.m235["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "memory_arrays" {
    for_each = try(local.m235["memory_arrays"], null) == null ? [] : local.m235["memory_arrays"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mgmt_identity" {
    for_each = try(local.m235["mgmt_identity"], null) == null ? [] : local.m235["mgmt_identity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m235["parent"], null) == null ? [] : local.m235["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_devices" {
    for_each = try(local.m235["pci_devices"], null) == null ? [] : local.m235["pci_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_nodes" {
    for_each = try(local.m235["pci_nodes"], null) == null ? [] : local.m235["pci_nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m235["permission_resources"], null) == null ? [] : local.m235["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m235["previous_fru"], null) == null ? [] : local.m235["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "processors" {
    for_each = try(local.m235["processors"], null) == null ? [] : local.m235["processors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "recovery_key_details" {
    for_each = try(local.m235["recovery_key_details"], null) == null ? [] : local.m235["recovery_key_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m235["registered_device"], null) == null ? [] : local.m235["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controllers" {
    for_each = try(local.m235["storage_controllers"], null) == null ? [] : local.m235["storage_controllers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_enclosures" {
    for_each = try(local.m235["storage_enclosures"], null) == null ? [] : local.m235["storage_enclosures"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m235["tags"], null) == null ? [] : local.m235["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "top_system" {
    for_each = try(local.m235["top_system"], null) == null ? [] : local.m235["top_system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m235["version_context"], null) == null ? [] : local.m235["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vmedia" {
    for_each = try(local.m235["vmedia"], null) == null ? [] : local.m235["vmedia"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
