# Sample data source intersight_boot_vmedia_device — reads ../models/data_intersight_boot_vmedia_device.yml
locals { m126 = yamldecode(file("${path.module}/../models/data_intersight_boot_vmedia_device.yml"))["data_intersight_boot_vmedia_device"] }

data "intersight_boot_vmedia_device" "n126" {
  account_moid = try(local.m126["account_moid"], null)
  additional_properties = try(local.m126["additional_properties"], null)
  class_id = try(local.m126["class_id"], null)
  create_time = try(local.m126["create_time"], null)
  device_mo_id = try(local.m126["device_mo_id"], null)
  dn = try(local.m126["dn"], null)
  domain_group_moid = try(local.m126["domain_group_moid"], null)
  id = try(local.m126["id"], null)
  is_upgraded = try(local.m126["is_upgraded"], null)
  mod_time = try(local.m126["mod_time"], null)
  model = try(local.m126["model"], null)
  moid = try(local.m126["moid"], null)
  name = try(local.m126["name"], null)
  object_type = try(local.m126["object_type"], null)
  order = try(local.m126["order"], null)
  owners = try(local.m126["owners"], null)
  presence = try(local.m126["presence"], null)
  results = try(local.m126["results"], null)
  revision = try(local.m126["revision"], null)
  rn = try(local.m126["rn"], null)
  serial = try(local.m126["serial"], null)
  shared_scope = try(local.m126["shared_scope"], null)
  state = try(local.m126["state"], null)
  type = try(local.m126["type"], null)
  vendor = try(local.m126["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m126["ancestors"], null) == null ? [] : local.m126["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m126["compute_physical"], null) == null ? [] : local.m126["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m126["inventory_device_info"], null) == null ? [] : local.m126["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m126["parent"], null) == null ? [] : local.m126["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m126["permission_resources"], null) == null ? [] : local.m126["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m126["previous_fru"], null) == null ? [] : local.m126["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m126["registered_device"], null) == null ? [] : local.m126["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m126["tags"], null) == null ? [] : local.m126["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m126["version_context"], null) == null ? [] : local.m126["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
