# Sample data source intersight_boot_sd_device — reads ../models/data_intersight_boot_sd_device.yml
locals { m123 = yamldecode(file("${path.module}/../models/data_intersight_boot_sd_device.yml"))["data_intersight_boot_sd_device"] }

data "intersight_boot_sd_device" "n123" {
  account_moid = try(local.m123["account_moid"], null)
  additional_properties = try(local.m123["additional_properties"], null)
  class_id = try(local.m123["class_id"], null)
  create_time = try(local.m123["create_time"], null)
  device_mo_id = try(local.m123["device_mo_id"], null)
  dn = try(local.m123["dn"], null)
  domain_group_moid = try(local.m123["domain_group_moid"], null)
  id = try(local.m123["id"], null)
  is_upgraded = try(local.m123["is_upgraded"], null)
  mod_time = try(local.m123["mod_time"], null)
  model = try(local.m123["model"], null)
  moid = try(local.m123["moid"], null)
  name = try(local.m123["name"], null)
  object_type = try(local.m123["object_type"], null)
  order = try(local.m123["order"], null)
  owners = try(local.m123["owners"], null)
  presence = try(local.m123["presence"], null)
  results = try(local.m123["results"], null)
  revision = try(local.m123["revision"], null)
  rn = try(local.m123["rn"], null)
  serial = try(local.m123["serial"], null)
  shared_scope = try(local.m123["shared_scope"], null)
  state = try(local.m123["state"], null)
  type = try(local.m123["type"], null)
  vendor = try(local.m123["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m123["ancestors"], null) == null ? [] : local.m123["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m123["compute_physical"], null) == null ? [] : local.m123["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m123["inventory_device_info"], null) == null ? [] : local.m123["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m123["parent"], null) == null ? [] : local.m123["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m123["permission_resources"], null) == null ? [] : local.m123["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m123["previous_fru"], null) == null ? [] : local.m123["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m123["registered_device"], null) == null ? [] : local.m123["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m123["tags"], null) == null ? [] : local.m123["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m123["version_context"], null) == null ? [] : local.m123["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
