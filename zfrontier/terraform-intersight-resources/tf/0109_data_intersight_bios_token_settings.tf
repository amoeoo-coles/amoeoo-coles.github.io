# Sample data source intersight_bios_token_settings — reads ../models/data_intersight_bios_token_settings.yml
locals { m109 = yamldecode(file("${path.module}/../models/data_intersight_bios_token_settings.yml"))["data_intersight_bios_token_settings"] }

data "intersight_bios_token_settings" "n109" {
  account_moid = try(local.m109["account_moid"], null)
  additional_properties = try(local.m109["additional_properties"], null)
  class_id = try(local.m109["class_id"], null)
  create_time = try(local.m109["create_time"], null)
  device_mo_id = try(local.m109["device_mo_id"], null)
  dn = try(local.m109["dn"], null)
  domain_group_moid = try(local.m109["domain_group_moid"], null)
  id = try(local.m109["id"], null)
  is_assigned = try(local.m109["is_assigned"], null)
  mod_time = try(local.m109["mod_time"], null)
  moid = try(local.m109["moid"], null)
  object_type = try(local.m109["object_type"], null)
  owners = try(local.m109["owners"], null)
  results = try(local.m109["results"], null)
  rn = try(local.m109["rn"], null)
  serial = try(local.m109["serial"], null)
  settings_mo_rn = try(local.m109["settings_mo_rn"], null)
  shared_scope = try(local.m109["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m109["ancestors"], null) == null ? [] : local.m109["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m109["compute_blade"], null) == null ? [] : local.m109["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m109["compute_rack_unit"], null) == null ? [] : local.m109["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m109["inventory_device_info"], null) == null ? [] : local.m109["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m109["parent"], null) == null ? [] : local.m109["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m109["permission_resources"], null) == null ? [] : local.m109["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m109["registered_device"], null) == null ? [] : local.m109["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m109["tags"], null) == null ? [] : local.m109["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m109["version_context"], null) == null ? [] : local.m109["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
