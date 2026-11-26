# Sample data source intersight_storage_flex_util_virtual_drive — reads ../models/data_intersight_storage_flex_util_virtual_drive.yml
locals { m1235 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_util_virtual_drive.yml"))["data_intersight_storage_flex_util_virtual_drive"] }

data "intersight_storage_flex_util_virtual_drive" "n1235" {
  account_moid = try(local.m1235["account_moid"], null)
  additional_properties = try(local.m1235["additional_properties"], null)
  class_id = try(local.m1235["class_id"], null)
  create_time = try(local.m1235["create_time"], null)
  device_mo_id = try(local.m1235["device_mo_id"], null)
  dn = try(local.m1235["dn"], null)
  domain_group_moid = try(local.m1235["domain_group_moid"], null)
  drive_status = try(local.m1235["drive_status"], null)
  drive_type = try(local.m1235["drive_type"], null)
  host_accessible = try(local.m1235["host_accessible"], null)
  id = try(local.m1235["id"], null)
  mod_time = try(local.m1235["mod_time"], null)
  moid = try(local.m1235["moid"], null)
  object_type = try(local.m1235["object_type"], null)
  owners = try(local.m1235["owners"], null)
  partition_id = try(local.m1235["partition_id"], null)
  partition_name = try(local.m1235["partition_name"], null)
  resident_image = try(local.m1235["resident_image"], null)
  results = try(local.m1235["results"], null)
  rn = try(local.m1235["rn"], null)
  shared_scope = try(local.m1235["shared_scope"], null)
  size = try(local.m1235["size"], null)
  virtual_drive = try(local.m1235["virtual_drive"], null)
  dynamic "ancestors" {
    for_each = try(local.m1235["ancestors"], null) == null ? [] : local.m1235["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1235["inventory_device_info"], null) == null ? [] : local.m1235["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1235["parent"], null) == null ? [] : local.m1235["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1235["permission_resources"], null) == null ? [] : local.m1235["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1235["registered_device"], null) == null ? [] : local.m1235["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_util_controller" {
    for_each = try(local.m1235["storage_flex_util_controller"], null) == null ? [] : local.m1235["storage_flex_util_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1235["tags"], null) == null ? [] : local.m1235["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1235["version_context"], null) == null ? [] : local.m1235["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
