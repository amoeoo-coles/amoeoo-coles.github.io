# Sample data source intersight_bios_vf_select_memory_ras_configuration — reads ../models/data_intersight_bios_vf_select_memory_ras_configuration.yml
locals { m111 = yamldecode(file("${path.module}/../models/data_intersight_bios_vf_select_memory_ras_configuration.yml"))["data_intersight_bios_vf_select_memory_ras_configuration"] }

data "intersight_bios_vf_select_memory_ras_configuration" "n111" {
  account_moid = try(local.m111["account_moid"], null)
  additional_properties = try(local.m111["additional_properties"], null)
  class_id = try(local.m111["class_id"], null)
  create_time = try(local.m111["create_time"], null)
  device_mo_id = try(local.m111["device_mo_id"], null)
  dn = try(local.m111["dn"], null)
  domain_group_moid = try(local.m111["domain_group_moid"], null)
  id = try(local.m111["id"], null)
  mod_time = try(local.m111["mod_time"], null)
  moid = try(local.m111["moid"], null)
  object_type = try(local.m111["object_type"], null)
  owners = try(local.m111["owners"], null)
  results = try(local.m111["results"], null)
  rn = try(local.m111["rn"], null)
  serial = try(local.m111["serial"], null)
  shared_scope = try(local.m111["shared_scope"], null)
  vp_select_memory_ras_configuration = try(local.m111["vp_select_memory_ras_configuration"], null)
  dynamic "ancestors" {
    for_each = try(local.m111["ancestors"], null) == null ? [] : local.m111["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m111["compute_blade"], null) == null ? [] : local.m111["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m111["compute_rack_unit"], null) == null ? [] : local.m111["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m111["inventory_device_info"], null) == null ? [] : local.m111["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m111["parent"], null) == null ? [] : local.m111["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m111["permission_resources"], null) == null ? [] : local.m111["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m111["registered_device"], null) == null ? [] : local.m111["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m111["tags"], null) == null ? [] : local.m111["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m111["version_context"], null) == null ? [] : local.m111["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
