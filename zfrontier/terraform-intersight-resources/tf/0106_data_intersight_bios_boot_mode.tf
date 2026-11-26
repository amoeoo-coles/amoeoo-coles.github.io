# Sample data source intersight_bios_boot_mode — reads ../models/data_intersight_bios_boot_mode.yml
locals { m106 = yamldecode(file("${path.module}/../models/data_intersight_bios_boot_mode.yml"))["data_intersight_bios_boot_mode"] }

data "intersight_bios_boot_mode" "n106" {
  account_moid = try(local.m106["account_moid"], null)
  actual_boot_mode = try(local.m106["actual_boot_mode"], null)
  additional_properties = try(local.m106["additional_properties"], null)
  class_id = try(local.m106["class_id"], null)
  create_time = try(local.m106["create_time"], null)
  device_mo_id = try(local.m106["device_mo_id"], null)
  dn = try(local.m106["dn"], null)
  domain_group_moid = try(local.m106["domain_group_moid"], null)
  id = try(local.m106["id"], null)
  mod_time = try(local.m106["mod_time"], null)
  moid = try(local.m106["moid"], null)
  object_type = try(local.m106["object_type"], null)
  owners = try(local.m106["owners"], null)
  results = try(local.m106["results"], null)
  rn = try(local.m106["rn"], null)
  shared_scope = try(local.m106["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m106["ancestors"], null) == null ? [] : local.m106["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m106["compute_blade"], null) == null ? [] : local.m106["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m106["compute_rack_unit"], null) == null ? [] : local.m106["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m106["inventory_device_info"], null) == null ? [] : local.m106["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m106["parent"], null) == null ? [] : local.m106["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m106["permission_resources"], null) == null ? [] : local.m106["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m106["registered_device"], null) == null ? [] : local.m106["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m106["tags"], null) == null ? [] : local.m106["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m106["version_context"], null) == null ? [] : local.m106["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
