# Sample data source intersight_storage_flex_flash_controller_props — reads ../models/data_intersight_storage_flex_flash_controller_props.yml
locals { m1230 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_flash_controller_props.yml"))["data_intersight_storage_flex_flash_controller_props"] }

data "intersight_storage_flex_flash_controller_props" "n1230" {
  account_moid = try(local.m1230["account_moid"], null)
  additional_properties = try(local.m1230["additional_properties"], null)
  cards_manageable = try(local.m1230["cards_manageable"], null)
  class_id = try(local.m1230["class_id"], null)
  configured_mode = try(local.m1230["configured_mode"], null)
  controller_name = try(local.m1230["controller_name"], null)
  controller_status = try(local.m1230["controller_status"], null)
  create_time = try(local.m1230["create_time"], null)
  device_mo_id = try(local.m1230["device_mo_id"], null)
  dn = try(local.m1230["dn"], null)
  domain_group_moid = try(local.m1230["domain_group_moid"], null)
  fw_version = try(local.m1230["fw_version"], null)
  id = try(local.m1230["id"], null)
  internal_state = try(local.m1230["internal_state"], null)
  is_upgraded = try(local.m1230["is_upgraded"], null)
  mod_time = try(local.m1230["mod_time"], null)
  model = try(local.m1230["model"], null)
  moid = try(local.m1230["moid"], null)
  object_type = try(local.m1230["object_type"], null)
  operating_mode = try(local.m1230["operating_mode"], null)
  owners = try(local.m1230["owners"], null)
  physical_drive_count = try(local.m1230["physical_drive_count"], null)
  presence = try(local.m1230["presence"], null)
  product_name = try(local.m1230["product_name"], null)
  results = try(local.m1230["results"], null)
  revision = try(local.m1230["revision"], null)
  rn = try(local.m1230["rn"], null)
  serial = try(local.m1230["serial"], null)
  shared_scope = try(local.m1230["shared_scope"], null)
  startup_fw_version = try(local.m1230["startup_fw_version"], null)
  vendor = try(local.m1230["vendor"], null)
  virtual_drive_count = try(local.m1230["virtual_drive_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1230["ancestors"], null) == null ? [] : local.m1230["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1230["inventory_device_info"], null) == null ? [] : local.m1230["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1230["parent"], null) == null ? [] : local.m1230["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1230["permission_resources"], null) == null ? [] : local.m1230["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1230["previous_fru"], null) == null ? [] : local.m1230["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1230["registered_device"], null) == null ? [] : local.m1230["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_flash_controller" {
    for_each = try(local.m1230["storage_flex_flash_controller"], null) == null ? [] : local.m1230["storage_flex_flash_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1230["tags"], null) == null ? [] : local.m1230["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1230["version_context"], null) == null ? [] : local.m1230["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
