# Sample data source intersight_storage_flex_util_physical_drive — reads ../models/data_intersight_storage_flex_util_physical_drive.yml
locals { m1234 = yamldecode(file("${path.module}/../models/data_intersight_storage_flex_util_physical_drive.yml"))["data_intersight_storage_flex_util_physical_drive"] }

data "intersight_storage_flex_util_physical_drive" "n1234" {
  account_moid = try(local.m1234["account_moid"], null)
  additional_properties = try(local.m1234["additional_properties"], null)
  block_size = try(local.m1234["block_size"], null)
  capacity = try(local.m1234["capacity"], null)
  class_id = try(local.m1234["class_id"], null)
  controller = try(local.m1234["controller"], null)
  create_time = try(local.m1234["create_time"], null)
  device_mo_id = try(local.m1234["device_mo_id"], null)
  dn = try(local.m1234["dn"], null)
  domain_group_moid = try(local.m1234["domain_group_moid"], null)
  drives_enabled = try(local.m1234["drives_enabled"], null)
  health = try(local.m1234["health"], null)
  id = try(local.m1234["id"], null)
  is_upgraded = try(local.m1234["is_upgraded"], null)
  manufacturer_date = try(local.m1234["manufacturer_date"], null)
  manufacturer_id = try(local.m1234["manufacturer_id"], null)
  mod_time = try(local.m1234["mod_time"], null)
  model = try(local.m1234["model"], null)
  moid = try(local.m1234["moid"], null)
  object_type = try(local.m1234["object_type"], null)
  oem_id = try(local.m1234["oem_id"], null)
  owners = try(local.m1234["owners"], null)
  partition_count = try(local.m1234["partition_count"], null)
  pd_status = try(local.m1234["pd_status"], null)
  physical_drive = try(local.m1234["physical_drive"], null)
  presence = try(local.m1234["presence"], null)
  product_name = try(local.m1234["product_name"], null)
  product_revision = try(local.m1234["product_revision"], null)
  read_error_count = try(local.m1234["read_error_count"], null)
  read_error_threshold = try(local.m1234["read_error_threshold"], null)
  results = try(local.m1234["results"], null)
  revision = try(local.m1234["revision"], null)
  rn = try(local.m1234["rn"], null)
  serial = try(local.m1234["serial"], null)
  shared_scope = try(local.m1234["shared_scope"], null)
  vendor = try(local.m1234["vendor"], null)
  write_enabled = try(local.m1234["write_enabled"], null)
  write_error_count = try(local.m1234["write_error_count"], null)
  write_error_threshold = try(local.m1234["write_error_threshold"], null)
  dynamic "ancestors" {
    for_each = try(local.m1234["ancestors"], null) == null ? [] : local.m1234["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1234["inventory_device_info"], null) == null ? [] : local.m1234["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1234["parent"], null) == null ? [] : local.m1234["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1234["permission_resources"], null) == null ? [] : local.m1234["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1234["previous_fru"], null) == null ? [] : local.m1234["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1234["registered_device"], null) == null ? [] : local.m1234["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_flex_util_controller" {
    for_each = try(local.m1234["storage_flex_util_controller"], null) == null ? [] : local.m1234["storage_flex_util_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1234["tags"], null) == null ? [] : local.m1234["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1234["version_context"], null) == null ? [] : local.m1234["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
