# Sample data source intersight_boot_nvme_device — reads ../models/data_intersight_boot_nvme_device.yml
locals { m118 = yamldecode(file("${path.module}/../models/data_intersight_boot_nvme_device.yml"))["data_intersight_boot_nvme_device"] }

data "intersight_boot_nvme_device" "n118" {
  account_moid = try(local.m118["account_moid"], null)
  additional_properties = try(local.m118["additional_properties"], null)
  class_id = try(local.m118["class_id"], null)
  create_time = try(local.m118["create_time"], null)
  device_mo_id = try(local.m118["device_mo_id"], null)
  dn = try(local.m118["dn"], null)
  domain_group_moid = try(local.m118["domain_group_moid"], null)
  id = try(local.m118["id"], null)
  is_upgraded = try(local.m118["is_upgraded"], null)
  mod_time = try(local.m118["mod_time"], null)
  model = try(local.m118["model"], null)
  moid = try(local.m118["moid"], null)
  name = try(local.m118["name"], null)
  object_type = try(local.m118["object_type"], null)
  order = try(local.m118["order"], null)
  owners = try(local.m118["owners"], null)
  presence = try(local.m118["presence"], null)
  results = try(local.m118["results"], null)
  revision = try(local.m118["revision"], null)
  rn = try(local.m118["rn"], null)
  serial = try(local.m118["serial"], null)
  shared_scope = try(local.m118["shared_scope"], null)
  state = try(local.m118["state"], null)
  type = try(local.m118["type"], null)
  vendor = try(local.m118["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m118["ancestors"], null) == null ? [] : local.m118["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m118["compute_physical"], null) == null ? [] : local.m118["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m118["inventory_device_info"], null) == null ? [] : local.m118["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m118["parent"], null) == null ? [] : local.m118["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m118["permission_resources"], null) == null ? [] : local.m118["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m118["previous_fru"], null) == null ? [] : local.m118["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m118["registered_device"], null) == null ? [] : local.m118["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m118["tags"], null) == null ? [] : local.m118["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m118["version_context"], null) == null ? [] : local.m118["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
