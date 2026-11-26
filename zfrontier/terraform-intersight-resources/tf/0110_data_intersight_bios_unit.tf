# Sample data source intersight_bios_unit — reads ../models/data_intersight_bios_unit.yml
locals { m110 = yamldecode(file("${path.module}/../models/data_intersight_bios_unit.yml"))["data_intersight_bios_unit"] }

data "intersight_bios_unit" "n110" {
  account_moid = try(local.m110["account_moid"], null)
  additional_properties = try(local.m110["additional_properties"], null)
  class_id = try(local.m110["class_id"], null)
  create_time = try(local.m110["create_time"], null)
  device_mo_id = try(local.m110["device_mo_id"], null)
  dn = try(local.m110["dn"], null)
  domain_group_moid = try(local.m110["domain_group_moid"], null)
  id = try(local.m110["id"], null)
  init_seq = try(local.m110["init_seq"], null)
  init_ts = try(local.m110["init_ts"], null)
  is_upgraded = try(local.m110["is_upgraded"], null)
  mod_time = try(local.m110["mod_time"], null)
  model = try(local.m110["model"], null)
  moid = try(local.m110["moid"], null)
  object_type = try(local.m110["object_type"], null)
  owners = try(local.m110["owners"], null)
  presence = try(local.m110["presence"], null)
  results = try(local.m110["results"], null)
  revision = try(local.m110["revision"], null)
  rn = try(local.m110["rn"], null)
  serial = try(local.m110["serial"], null)
  shared_scope = try(local.m110["shared_scope"], null)
  vendor = try(local.m110["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m110["ancestors"], null) == null ? [] : local.m110["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m110["compute_blade"], null) == null ? [] : local.m110["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m110["compute_rack_unit"], null) == null ? [] : local.m110["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m110["inventory_device_info"], null) == null ? [] : local.m110["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m110["parent"], null) == null ? [] : local.m110["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m110["permission_resources"], null) == null ? [] : local.m110["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m110["previous_fru"], null) == null ? [] : local.m110["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m110["registered_device"], null) == null ? [] : local.m110["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m110["running_firmware"], null) == null ? [] : local.m110["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_boot_order" {
    for_each = try(local.m110["system_boot_order"], null) == null ? [] : local.m110["system_boot_order"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m110["tags"], null) == null ? [] : local.m110["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m110["version_context"], null) == null ? [] : local.m110["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
