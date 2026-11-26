# Sample data source intersight_compute_vmedia — reads ../models/data_intersight_compute_vmedia.yml
locals { m252 = yamldecode(file("${path.module}/../models/data_intersight_compute_vmedia.yml"))["data_intersight_compute_vmedia"] }

data "intersight_compute_vmedia" "n252" {
  account_moid = try(local.m252["account_moid"], null)
  additional_properties = try(local.m252["additional_properties"], null)
  class_id = try(local.m252["class_id"], null)
  create_time = try(local.m252["create_time"], null)
  device_mo_id = try(local.m252["device_mo_id"], null)
  dn = try(local.m252["dn"], null)
  domain_group_moid = try(local.m252["domain_group_moid"], null)
  enabled = try(local.m252["enabled"], null)
  encryption = try(local.m252["encryption"], null)
  id = try(local.m252["id"], null)
  low_power_usb = try(local.m252["low_power_usb"], null)
  mod_time = try(local.m252["mod_time"], null)
  moid = try(local.m252["moid"], null)
  object_type = try(local.m252["object_type"], null)
  owners = try(local.m252["owners"], null)
  results = try(local.m252["results"], null)
  rn = try(local.m252["rn"], null)
  shared_scope = try(local.m252["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m252["ancestors"], null) == null ? [] : local.m252["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical_unit" {
    for_each = try(local.m252["compute_physical_unit"], null) == null ? [] : local.m252["compute_physical_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m252["inventory_device_info"], null) == null ? [] : local.m252["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mappings" {
    for_each = try(local.m252["mappings"], null) == null ? [] : local.m252["mappings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m252["parent"], null) == null ? [] : local.m252["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m252["permission_resources"], null) == null ? [] : local.m252["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m252["registered_device"], null) == null ? [] : local.m252["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m252["tags"], null) == null ? [] : local.m252["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m252["version_context"], null) == null ? [] : local.m252["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
