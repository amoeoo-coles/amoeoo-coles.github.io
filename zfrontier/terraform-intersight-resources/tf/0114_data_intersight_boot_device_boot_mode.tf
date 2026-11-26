# Sample data source intersight_boot_device_boot_mode — reads ../models/data_intersight_boot_device_boot_mode.yml
locals { m114 = yamldecode(file("${path.module}/../models/data_intersight_boot_device_boot_mode.yml"))["data_intersight_boot_device_boot_mode"] }

data "intersight_boot_device_boot_mode" "n114" {
  account_moid = try(local.m114["account_moid"], null)
  additional_properties = try(local.m114["additional_properties"], null)
  class_id = try(local.m114["class_id"], null)
  configured_boot_mode = try(local.m114["configured_boot_mode"], null)
  create_time = try(local.m114["create_time"], null)
  device_mo_id = try(local.m114["device_mo_id"], null)
  dn = try(local.m114["dn"], null)
  domain_group_moid = try(local.m114["domain_group_moid"], null)
  id = try(local.m114["id"], null)
  mod_time = try(local.m114["mod_time"], null)
  moid = try(local.m114["moid"], null)
  object_type = try(local.m114["object_type"], null)
  owners = try(local.m114["owners"], null)
  results = try(local.m114["results"], null)
  rn = try(local.m114["rn"], null)
  shared_scope = try(local.m114["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m114["ancestors"], null) == null ? [] : local.m114["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m114["compute_blade"], null) == null ? [] : local.m114["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m114["compute_rack_unit"], null) == null ? [] : local.m114["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m114["inventory_device_info"], null) == null ? [] : local.m114["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m114["parent"], null) == null ? [] : local.m114["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m114["permission_resources"], null) == null ? [] : local.m114["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m114["registered_device"], null) == null ? [] : local.m114["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m114["tags"], null) == null ? [] : local.m114["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m114["version_context"], null) == null ? [] : local.m114["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
