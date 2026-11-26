# Sample data source intersight_boot_pxe_device — reads ../models/data_intersight_boot_pxe_device.yml
locals { m121 = yamldecode(file("${path.module}/../models/data_intersight_boot_pxe_device.yml"))["data_intersight_boot_pxe_device"] }

data "intersight_boot_pxe_device" "n121" {
  account_moid = try(local.m121["account_moid"], null)
  additional_properties = try(local.m121["additional_properties"], null)
  class_id = try(local.m121["class_id"], null)
  create_time = try(local.m121["create_time"], null)
  device_mo_id = try(local.m121["device_mo_id"], null)
  dn = try(local.m121["dn"], null)
  domain_group_moid = try(local.m121["domain_group_moid"], null)
  id = try(local.m121["id"], null)
  is_upgraded = try(local.m121["is_upgraded"], null)
  mod_time = try(local.m121["mod_time"], null)
  model = try(local.m121["model"], null)
  moid = try(local.m121["moid"], null)
  name = try(local.m121["name"], null)
  object_type = try(local.m121["object_type"], null)
  order = try(local.m121["order"], null)
  owners = try(local.m121["owners"], null)
  presence = try(local.m121["presence"], null)
  results = try(local.m121["results"], null)
  revision = try(local.m121["revision"], null)
  rn = try(local.m121["rn"], null)
  serial = try(local.m121["serial"], null)
  shared_scope = try(local.m121["shared_scope"], null)
  state = try(local.m121["state"], null)
  type = try(local.m121["type"], null)
  vendor = try(local.m121["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m121["ancestors"], null) == null ? [] : local.m121["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m121["compute_physical"], null) == null ? [] : local.m121["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m121["inventory_device_info"], null) == null ? [] : local.m121["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m121["parent"], null) == null ? [] : local.m121["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m121["permission_resources"], null) == null ? [] : local.m121["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m121["previous_fru"], null) == null ? [] : local.m121["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m121["registered_device"], null) == null ? [] : local.m121["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m121["tags"], null) == null ? [] : local.m121["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m121["version_context"], null) == null ? [] : local.m121["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
