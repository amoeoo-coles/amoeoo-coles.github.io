# Sample data source intersight_compute_server_setting — reads ../models/data_intersight_compute_server_setting.yml
locals { m251 = yamldecode(file("${path.module}/../models/data_intersight_compute_server_setting.yml"))["data_intersight_compute_server_setting"] }

data "intersight_compute_server_setting" "n251" {
  account_moid = try(local.m251["account_moid"], null)
  additional_properties = try(local.m251["additional_properties"], null)
  admin_locator_led_state = try(local.m251["admin_locator_led_state"], null)
  admin_power_state = try(local.m251["admin_power_state"], null)
  class_id = try(local.m251["class_id"], null)
  clear_sel = try(local.m251["clear_sel"], null)
  cmos_reset = try(local.m251["cmos_reset"], null)
  collect_sel = try(local.m251["collect_sel"], null)
  config_state = try(local.m251["config_state"], null)
  create_time = try(local.m251["create_time"], null)
  device_mo_id = try(local.m251["device_mo_id"], null)
  dn = try(local.m251["dn"], null)
  domain_group_moid = try(local.m251["domain_group_moid"], null)
  front_panel_lock_state = try(local.m251["front_panel_lock_state"], null)
  host_init_configuration = try(local.m251["host_init_configuration"], null)
  id = try(local.m251["id"], null)
  kvm_reset = try(local.m251["kvm_reset"], null)
  mod_time = try(local.m251["mod_time"], null)
  moid = try(local.m251["moid"], null)
  name = try(local.m251["name"], null)
  object_type = try(local.m251["object_type"], null)
  one_time_boot_device = try(local.m251["one_time_boot_device"], null)
  owners = try(local.m251["owners"], null)
  reset_memory_errors = try(local.m251["reset_memory_errors"], null)
  results = try(local.m251["results"], null)
  rn = try(local.m251["rn"], null)
  shared_scope = try(local.m251["shared_scope"], null)
  tpm_reset = try(local.m251["tpm_reset"], null)
  tunneled_kvm_state = try(local.m251["tunneled_kvm_state"], null)
  dynamic "ancestors" {
    for_each = try(local.m251["ancestors"], null) == null ? [] : local.m251["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificates_action" {
    for_each = try(local.m251["certificates_action"], null) == null ? [] : local.m251["certificates_action"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m251["locator_led"], null) == null ? [] : local.m251["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m251["parent"], null) == null ? [] : local.m251["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m251["permission_resources"], null) == null ? [] : local.m251["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "persistent_memory_operation" {
    for_each = try(local.m251["persistent_memory_operation"], null) == null ? [] : local.m251["persistent_memory_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "personality_setting" {
    for_each = try(local.m251["personality_setting"], null) == null ? [] : local.m251["personality_setting"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m251["registered_device"], null) == null ? [] : local.m251["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_workflow" {
    for_each = try(local.m251["running_workflow"], null) == null ? [] : local.m251["running_workflow"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m251["server"], null) == null ? [] : local.m251["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_config" {
    for_each = try(local.m251["server_config"], null) == null ? [] : local.m251["server_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_op_status" {
    for_each = try(local.m251["server_op_status"], null) == null ? [] : local.m251["server_op_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller_operation" {
    for_each = try(local.m251["storage_controller_operation"], null) == null ? [] : local.m251["storage_controller_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_physical_drive_operation" {
    for_each = try(local.m251["storage_physical_drive_operation"], null) == null ? [] : local.m251["storage_physical_drive_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utility_image_operation" {
    for_each = try(local.m251["storage_utility_image_operation"], null) == null ? [] : local.m251["storage_utility_image_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_virtual_drive_operation" {
    for_each = try(local.m251["storage_virtual_drive_operation"], null) == null ? [] : local.m251["storage_virtual_drive_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m251["tags"], null) == null ? [] : local.m251["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m251["version_context"], null) == null ? [] : local.m251["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
