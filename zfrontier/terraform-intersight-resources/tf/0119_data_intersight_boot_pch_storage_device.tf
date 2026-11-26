# Sample data source intersight_boot_pch_storage_device — reads ../models/data_intersight_boot_pch_storage_device.yml
locals { m119 = yamldecode(file("${path.module}/../models/data_intersight_boot_pch_storage_device.yml"))["data_intersight_boot_pch_storage_device"] }

data "intersight_boot_pch_storage_device" "n119" {
  account_moid = try(local.m119["account_moid"], null)
  additional_properties = try(local.m119["additional_properties"], null)
  class_id = try(local.m119["class_id"], null)
  create_time = try(local.m119["create_time"], null)
  device_mo_id = try(local.m119["device_mo_id"], null)
  dn = try(local.m119["dn"], null)
  domain_group_moid = try(local.m119["domain_group_moid"], null)
  id = try(local.m119["id"], null)
  is_upgraded = try(local.m119["is_upgraded"], null)
  mod_time = try(local.m119["mod_time"], null)
  model = try(local.m119["model"], null)
  moid = try(local.m119["moid"], null)
  name = try(local.m119["name"], null)
  object_type = try(local.m119["object_type"], null)
  order = try(local.m119["order"], null)
  owners = try(local.m119["owners"], null)
  presence = try(local.m119["presence"], null)
  results = try(local.m119["results"], null)
  revision = try(local.m119["revision"], null)
  rn = try(local.m119["rn"], null)
  serial = try(local.m119["serial"], null)
  shared_scope = try(local.m119["shared_scope"], null)
  state = try(local.m119["state"], null)
  type = try(local.m119["type"], null)
  vendor = try(local.m119["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m119["ancestors"], null) == null ? [] : local.m119["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m119["compute_physical"], null) == null ? [] : local.m119["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m119["inventory_device_info"], null) == null ? [] : local.m119["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m119["parent"], null) == null ? [] : local.m119["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m119["permission_resources"], null) == null ? [] : local.m119["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m119["previous_fru"], null) == null ? [] : local.m119["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m119["registered_device"], null) == null ? [] : local.m119["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m119["tags"], null) == null ? [] : local.m119["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m119["version_context"], null) == null ? [] : local.m119["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
