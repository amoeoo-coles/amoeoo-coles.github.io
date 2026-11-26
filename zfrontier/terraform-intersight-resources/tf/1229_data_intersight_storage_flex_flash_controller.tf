# Sample data source intersight_storage_flex_flash_controller — reads ../models/data_intersight_storage_flex_flash_controller.yml
locals { m1229 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_flash_controller.yml"))["data_intersight_storage_flex_flash_controller"] }

data "intersight_storage_flex_flash_controller" "n1229" {
  account_moid = try(local.m1229["account_moid"], null)
  additional_properties = try(local.m1229["additional_properties"], null)
  class_id = try(local.m1229["class_id"], null)
  controller_state = try(local.m1229["controller_state"], null)
  create_time = try(local.m1229["create_time"], null)
  device_mo_id = try(local.m1229["device_mo_id"], null)
  dn = try(local.m1229["dn"], null)
  domain_group_moid = try(local.m1229["domain_group_moid"], null)
  ff_controller_id = try(local.m1229["ff_controller_id"], null)
  id = try(local.m1229["id"], null)
  is_upgraded = try(local.m1229["is_upgraded"], null)
  mod_time = try(local.m1229["mod_time"], null)
  model = try(local.m1229["model"], null)
  moid = try(local.m1229["moid"], null)
  object_type = try(local.m1229["object_type"], null)
  owners = try(local.m1229["owners"], null)
  presence = try(local.m1229["presence"], null)
  results = try(local.m1229["results"], null)
  revision = try(local.m1229["revision"], null)
  rn = try(local.m1229["rn"], null)
  serial = try(local.m1229["serial"], null)
  shared_scope = try(local.m1229["shared_scope"], null)
  vendor = try(local.m1229["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1229["ancestors"], null) == null ? [] : local.m1229["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m1229["compute_board"], null) == null ? [] : local.m1229["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flex_flash_controller_props" {
    for_each = try(local.m1229["flex_flash_controller_props"], null) == null ? [] : local.m1229["flex_flash_controller_props"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flex_flash_physical_drives" {
    for_each = try(local.m1229["flex_flash_physical_drives"], null) == null ? [] : local.m1229["flex_flash_physical_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "flex_flash_virtual_drives" {
    for_each = try(local.m1229["flex_flash_virtual_drives"], null) == null ? [] : local.m1229["flex_flash_virtual_drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1229["inventory_device_info"], null) == null ? [] : local.m1229["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1229["parent"], null) == null ? [] : local.m1229["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1229["permission_resources"], null) == null ? [] : local.m1229["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1229["previous_fru"], null) == null ? [] : local.m1229["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1229["registered_device"], null) == null ? [] : local.m1229["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m1229["running_firmware"], null) == null ? [] : local.m1229["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1229["tags"], null) == null ? [] : local.m1229["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1229["version_context"], null) == null ? [] : local.m1229["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
