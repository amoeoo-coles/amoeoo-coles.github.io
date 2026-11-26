# Sample data source intersight_storage_flex_flash_physical_drive — reads ../models/data_intersight_storage_flex_flash_physical_drive.yml
locals { m1231 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_flash_physical_drive.yml"))["data_intersight_storage_flex_flash_physical_drive"] }

data "intersight_storage_flex_flash_physical_drive" "n1231" {
  account_moid = try(local.m1231["account_moid"], null)
  additional_properties = try(local.m1231["additional_properties"], null)
  card_status = try(local.m1231["card_status"], null)
  card_type = try(local.m1231["card_type"], null)
  class_id = try(local.m1231["class_id"], null)
  create_time = try(local.m1231["create_time"], null)
  device_mo_id = try(local.m1231["device_mo_id"], null)
  dn = try(local.m1231["dn"], null)
  domain_group_moid = try(local.m1231["domain_group_moid"], null)
  id = try(local.m1231["id"], null)
  is_upgraded = try(local.m1231["is_upgraded"], null)
  mod_time = try(local.m1231["mod_time"], null)
  model = try(local.m1231["model"], null)
  moid = try(local.m1231["moid"], null)
  object_type = try(local.m1231["object_type"], null)
  oem_id = try(local.m1231["oem_id"], null)
  owners = try(local.m1231["owners"], null)
  pd_status = try(local.m1231["pd_status"], null)
  presence = try(local.m1231["presence"], null)
  results = try(local.m1231["results"], null)
  revision = try(local.m1231["revision"], null)
  rn = try(local.m1231["rn"], null)
  serial = try(local.m1231["serial"], null)
  shared_scope = try(local.m1231["shared_scope"], null)
  vendor = try(local.m1231["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1231["ancestors"], null) == null ? [] : local.m1231["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1231["inventory_device_info"], null) == null ? [] : local.m1231["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1231["parent"], null) == null ? [] : local.m1231["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1231["permission_resources"], null) == null ? [] : local.m1231["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1231["previous_fru"], null) == null ? [] : local.m1231["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1231["registered_device"], null) == null ? [] : local.m1231["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_flash_controller" {
    for_each = try(local.m1231["storage_flex_flash_controller"], null) == null ? [] : local.m1231["storage_flex_flash_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1231["tags"], null) == null ? [] : local.m1231["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1231["version_context"], null) == null ? [] : local.m1231["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
