# Sample data source intersight_boot_san_device — reads ../models/data_intersight_boot_san_device.yml
locals { m122 = yamldecode(file("${path.module}/../models/data_intersight_boot_san_device.yml"))["data_intersight_boot_san_device"] }

data "intersight_boot_san_device" "n122" {
  account_moid = try(local.m122["account_moid"], null)
  additional_properties = try(local.m122["additional_properties"], null)
  class_id = try(local.m122["class_id"], null)
  create_time = try(local.m122["create_time"], null)
  device_mo_id = try(local.m122["device_mo_id"], null)
  dn = try(local.m122["dn"], null)
  domain_group_moid = try(local.m122["domain_group_moid"], null)
  id = try(local.m122["id"], null)
  is_upgraded = try(local.m122["is_upgraded"], null)
  mod_time = try(local.m122["mod_time"], null)
  model = try(local.m122["model"], null)
  moid = try(local.m122["moid"], null)
  name = try(local.m122["name"], null)
  object_type = try(local.m122["object_type"], null)
  order = try(local.m122["order"], null)
  owners = try(local.m122["owners"], null)
  presence = try(local.m122["presence"], null)
  results = try(local.m122["results"], null)
  revision = try(local.m122["revision"], null)
  rn = try(local.m122["rn"], null)
  serial = try(local.m122["serial"], null)
  shared_scope = try(local.m122["shared_scope"], null)
  state = try(local.m122["state"], null)
  type = try(local.m122["type"], null)
  vendor = try(local.m122["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m122["ancestors"], null) == null ? [] : local.m122["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m122["compute_physical"], null) == null ? [] : local.m122["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m122["inventory_device_info"], null) == null ? [] : local.m122["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m122["parent"], null) == null ? [] : local.m122["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m122["permission_resources"], null) == null ? [] : local.m122["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m122["previous_fru"], null) == null ? [] : local.m122["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m122["registered_device"], null) == null ? [] : local.m122["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m122["tags"], null) == null ? [] : local.m122["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m122["version_context"], null) == null ? [] : local.m122["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
