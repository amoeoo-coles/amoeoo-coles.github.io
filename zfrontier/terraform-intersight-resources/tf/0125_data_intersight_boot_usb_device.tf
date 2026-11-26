# Sample data source intersight_boot_usb_device — reads ../models/data_intersight_boot_usb_device.yml
locals { m125 = yamldecode(file("${path.module}/../models/data_intersight_boot_usb_device.yml"))["data_intersight_boot_usb_device"] }

data "intersight_boot_usb_device" "n125" {
  account_moid = try(local.m125["account_moid"], null)
  additional_properties = try(local.m125["additional_properties"], null)
  class_id = try(local.m125["class_id"], null)
  create_time = try(local.m125["create_time"], null)
  device_mo_id = try(local.m125["device_mo_id"], null)
  dn = try(local.m125["dn"], null)
  domain_group_moid = try(local.m125["domain_group_moid"], null)
  id = try(local.m125["id"], null)
  is_upgraded = try(local.m125["is_upgraded"], null)
  mod_time = try(local.m125["mod_time"], null)
  model = try(local.m125["model"], null)
  moid = try(local.m125["moid"], null)
  name = try(local.m125["name"], null)
  object_type = try(local.m125["object_type"], null)
  order = try(local.m125["order"], null)
  owners = try(local.m125["owners"], null)
  presence = try(local.m125["presence"], null)
  results = try(local.m125["results"], null)
  revision = try(local.m125["revision"], null)
  rn = try(local.m125["rn"], null)
  serial = try(local.m125["serial"], null)
  shared_scope = try(local.m125["shared_scope"], null)
  state = try(local.m125["state"], null)
  type = try(local.m125["type"], null)
  vendor = try(local.m125["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m125["ancestors"], null) == null ? [] : local.m125["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m125["compute_physical"], null) == null ? [] : local.m125["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m125["inventory_device_info"], null) == null ? [] : local.m125["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m125["parent"], null) == null ? [] : local.m125["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m125["permission_resources"], null) == null ? [] : local.m125["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m125["previous_fru"], null) == null ? [] : local.m125["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m125["registered_device"], null) == null ? [] : local.m125["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m125["tags"], null) == null ? [] : local.m125["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m125["version_context"], null) == null ? [] : local.m125["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
