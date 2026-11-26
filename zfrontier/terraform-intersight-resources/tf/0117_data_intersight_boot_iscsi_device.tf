# Sample data source intersight_boot_iscsi_device — reads ../models/data_intersight_boot_iscsi_device.yml
locals { m117 = yamldecode(file("${path.module}/../models/data_intersight_boot_iscsi_device.yml"))["data_intersight_boot_iscsi_device"] }

data "intersight_boot_iscsi_device" "n117" {
  account_moid = try(local.m117["account_moid"], null)
  additional_properties = try(local.m117["additional_properties"], null)
  class_id = try(local.m117["class_id"], null)
  create_time = try(local.m117["create_time"], null)
  device_mo_id = try(local.m117["device_mo_id"], null)
  dn = try(local.m117["dn"], null)
  domain_group_moid = try(local.m117["domain_group_moid"], null)
  id = try(local.m117["id"], null)
  is_upgraded = try(local.m117["is_upgraded"], null)
  mod_time = try(local.m117["mod_time"], null)
  model = try(local.m117["model"], null)
  moid = try(local.m117["moid"], null)
  name = try(local.m117["name"], null)
  object_type = try(local.m117["object_type"], null)
  order = try(local.m117["order"], null)
  owners = try(local.m117["owners"], null)
  presence = try(local.m117["presence"], null)
  results = try(local.m117["results"], null)
  revision = try(local.m117["revision"], null)
  rn = try(local.m117["rn"], null)
  serial = try(local.m117["serial"], null)
  shared_scope = try(local.m117["shared_scope"], null)
  state = try(local.m117["state"], null)
  type = try(local.m117["type"], null)
  vendor = try(local.m117["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m117["ancestors"], null) == null ? [] : local.m117["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m117["compute_physical"], null) == null ? [] : local.m117["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m117["inventory_device_info"], null) == null ? [] : local.m117["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m117["parent"], null) == null ? [] : local.m117["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m117["permission_resources"], null) == null ? [] : local.m117["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m117["previous_fru"], null) == null ? [] : local.m117["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m117["registered_device"], null) == null ? [] : local.m117["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m117["tags"], null) == null ? [] : local.m117["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m117["version_context"], null) == null ? [] : local.m117["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
