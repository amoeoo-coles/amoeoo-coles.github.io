# Sample data source intersight_boot_cdd_device — reads ../models/data_intersight_boot_cdd_device.yml
locals { m113 = yamldecode(file("${path.module}/../models/data_intersight_boot_cdd_device.yml"))["data_intersight_boot_cdd_device"] }

data "intersight_boot_cdd_device" "n113" {
  account_moid = try(local.m113["account_moid"], null)
  additional_properties = try(local.m113["additional_properties"], null)
  class_id = try(local.m113["class_id"], null)
  create_time = try(local.m113["create_time"], null)
  device_mo_id = try(local.m113["device_mo_id"], null)
  dn = try(local.m113["dn"], null)
  domain_group_moid = try(local.m113["domain_group_moid"], null)
  id = try(local.m113["id"], null)
  is_upgraded = try(local.m113["is_upgraded"], null)
  mod_time = try(local.m113["mod_time"], null)
  model = try(local.m113["model"], null)
  moid = try(local.m113["moid"], null)
  name = try(local.m113["name"], null)
  object_type = try(local.m113["object_type"], null)
  order = try(local.m113["order"], null)
  owners = try(local.m113["owners"], null)
  presence = try(local.m113["presence"], null)
  results = try(local.m113["results"], null)
  revision = try(local.m113["revision"], null)
  rn = try(local.m113["rn"], null)
  serial = try(local.m113["serial"], null)
  shared_scope = try(local.m113["shared_scope"], null)
  state = try(local.m113["state"], null)
  type = try(local.m113["type"], null)
  vendor = try(local.m113["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m113["ancestors"], null) == null ? [] : local.m113["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m113["compute_physical"], null) == null ? [] : local.m113["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m113["inventory_device_info"], null) == null ? [] : local.m113["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m113["parent"], null) == null ? [] : local.m113["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m113["permission_resources"], null) == null ? [] : local.m113["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m113["previous_fru"], null) == null ? [] : local.m113["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m113["registered_device"], null) == null ? [] : local.m113["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m113["tags"], null) == null ? [] : local.m113["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m113["version_context"], null) == null ? [] : local.m113["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
