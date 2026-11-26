# Sample data source intersight_boot_uefi_shell_device — reads ../models/data_intersight_boot_uefi_shell_device.yml
locals { m124 = yamldecode(file("${path.module}/../models/data_intersight_boot_uefi_shell_device.yml"))["data_intersight_boot_uefi_shell_device"] }

data "intersight_boot_uefi_shell_device" "n124" {
  account_moid = try(local.m124["account_moid"], null)
  additional_properties = try(local.m124["additional_properties"], null)
  class_id = try(local.m124["class_id"], null)
  create_time = try(local.m124["create_time"], null)
  device_mo_id = try(local.m124["device_mo_id"], null)
  dn = try(local.m124["dn"], null)
  domain_group_moid = try(local.m124["domain_group_moid"], null)
  id = try(local.m124["id"], null)
  is_upgraded = try(local.m124["is_upgraded"], null)
  mod_time = try(local.m124["mod_time"], null)
  model = try(local.m124["model"], null)
  moid = try(local.m124["moid"], null)
  name = try(local.m124["name"], null)
  object_type = try(local.m124["object_type"], null)
  order = try(local.m124["order"], null)
  owners = try(local.m124["owners"], null)
  presence = try(local.m124["presence"], null)
  results = try(local.m124["results"], null)
  revision = try(local.m124["revision"], null)
  rn = try(local.m124["rn"], null)
  serial = try(local.m124["serial"], null)
  shared_scope = try(local.m124["shared_scope"], null)
  state = try(local.m124["state"], null)
  type = try(local.m124["type"], null)
  vendor = try(local.m124["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m124["ancestors"], null) == null ? [] : local.m124["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m124["compute_physical"], null) == null ? [] : local.m124["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m124["inventory_device_info"], null) == null ? [] : local.m124["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m124["parent"], null) == null ? [] : local.m124["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m124["permission_resources"], null) == null ? [] : local.m124["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m124["previous_fru"], null) == null ? [] : local.m124["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m124["registered_device"], null) == null ? [] : local.m124["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m124["tags"], null) == null ? [] : local.m124["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m124["version_context"], null) == null ? [] : local.m124["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
