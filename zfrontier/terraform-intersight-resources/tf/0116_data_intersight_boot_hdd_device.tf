# Sample data source intersight_boot_hdd_device — reads ../models/data_intersight_boot_hdd_device.yml
locals { m116 = yamldecode(file("${path.module}/../models/data_intersight_boot_hdd_device.yml"))["data_intersight_boot_hdd_device"] }

data "intersight_boot_hdd_device" "n116" {
  account_moid = try(local.m116["account_moid"], null)
  additional_properties = try(local.m116["additional_properties"], null)
  class_id = try(local.m116["class_id"], null)
  create_time = try(local.m116["create_time"], null)
  device_mo_id = try(local.m116["device_mo_id"], null)
  dn = try(local.m116["dn"], null)
  domain_group_moid = try(local.m116["domain_group_moid"], null)
  id = try(local.m116["id"], null)
  is_upgraded = try(local.m116["is_upgraded"], null)
  mod_time = try(local.m116["mod_time"], null)
  model = try(local.m116["model"], null)
  moid = try(local.m116["moid"], null)
  name = try(local.m116["name"], null)
  object_type = try(local.m116["object_type"], null)
  order = try(local.m116["order"], null)
  owners = try(local.m116["owners"], null)
  presence = try(local.m116["presence"], null)
  results = try(local.m116["results"], null)
  revision = try(local.m116["revision"], null)
  rn = try(local.m116["rn"], null)
  serial = try(local.m116["serial"], null)
  shared_scope = try(local.m116["shared_scope"], null)
  state = try(local.m116["state"], null)
  type = try(local.m116["type"], null)
  vendor = try(local.m116["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m116["ancestors"], null) == null ? [] : local.m116["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m116["compute_physical"], null) == null ? [] : local.m116["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m116["inventory_device_info"], null) == null ? [] : local.m116["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m116["parent"], null) == null ? [] : local.m116["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m116["permission_resources"], null) == null ? [] : local.m116["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m116["previous_fru"], null) == null ? [] : local.m116["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m116["registered_device"], null) == null ? [] : local.m116["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m116["tags"], null) == null ? [] : local.m116["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m116["version_context"], null) == null ? [] : local.m116["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
