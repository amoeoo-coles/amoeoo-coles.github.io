# Sample data source intersight_storage_flex_flash_virtual_drive — reads ../models/data_intersight_storage_flex_flash_virtual_drive.yml
locals { m1232 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_flash_virtual_drive.yml"))["data_intersight_storage_flex_flash_virtual_drive"] }

data "intersight_storage_flex_flash_virtual_drive" "n1232" {
  account_moid = try(local.m1232["account_moid"], null)
  additional_properties = try(local.m1232["additional_properties"], null)
  class_id = try(local.m1232["class_id"], null)
  create_time = try(local.m1232["create_time"], null)
  device_mo_id = try(local.m1232["device_mo_id"], null)
  dn = try(local.m1232["dn"], null)
  domain_group_moid = try(local.m1232["domain_group_moid"], null)
  drive_scope = try(local.m1232["drive_scope"], null)
  drive_status = try(local.m1232["drive_status"], null)
  id = try(local.m1232["id"], null)
  is_upgraded = try(local.m1232["is_upgraded"], null)
  mod_time = try(local.m1232["mod_time"], null)
  model = try(local.m1232["model"], null)
  moid = try(local.m1232["moid"], null)
  object_type = try(local.m1232["object_type"], null)
  owners = try(local.m1232["owners"], null)
  partition_id = try(local.m1232["partition_id"], null)
  presence = try(local.m1232["presence"], null)
  resident_image = try(local.m1232["resident_image"], null)
  results = try(local.m1232["results"], null)
  revision = try(local.m1232["revision"], null)
  rn = try(local.m1232["rn"], null)
  serial = try(local.m1232["serial"], null)
  shared_scope = try(local.m1232["shared_scope"], null)
  size = try(local.m1232["size"], null)
  vendor = try(local.m1232["vendor"], null)
  virtual_drive = try(local.m1232["virtual_drive"], null)
  dynamic "ancestors" {
    for_each = try(local.m1232["ancestors"], null) == null ? [] : local.m1232["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1232["inventory_device_info"], null) == null ? [] : local.m1232["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1232["parent"], null) == null ? [] : local.m1232["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1232["permission_resources"], null) == null ? [] : local.m1232["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1232["previous_fru"], null) == null ? [] : local.m1232["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1232["registered_device"], null) == null ? [] : local.m1232["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_flash_controller" {
    for_each = try(local.m1232["storage_flex_flash_controller"], null) == null ? [] : local.m1232["storage_flex_flash_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1232["tags"], null) == null ? [] : local.m1232["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1232["version_context"], null) == null ? [] : local.m1232["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
