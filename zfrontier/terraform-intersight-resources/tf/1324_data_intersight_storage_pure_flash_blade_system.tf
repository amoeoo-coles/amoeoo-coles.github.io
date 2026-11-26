# Sample data source intersight_storage_pure_flash_blade_system — reads ../models/data_intersight_storage_pure_flash_blade_system.yml
locals { m1324 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_flash_blade_system.yml"))["data_intersight_storage_pure_flash_blade_system"] }

data "intersight_storage_pure_flash_blade_system" "n1324" {
  account_moid = try(local.m1324["account_moid"], null)
  additional_properties = try(local.m1324["additional_properties"], null)
  class_id = try(local.m1324["class_id"], null)
  create_time = try(local.m1324["create_time"], null)
  device_mo_id = try(local.m1324["device_mo_id"], null)
  device_type = try(local.m1324["device_type"], null)
  dn = try(local.m1324["dn"], null)
  domain_group_moid = try(local.m1324["domain_group_moid"], null)
  hardware_version = try(local.m1324["hardware_version"], null)
  id = try(local.m1324["id"], null)
  is_upgraded = try(local.m1324["is_upgraded"], null)
  mod_time = try(local.m1324["mod_time"], null)
  model = try(local.m1324["model"], null)
  moid = try(local.m1324["moid"], null)
  name = try(local.m1324["name"], null)
  nr_version = try(local.m1324["nr_version"], null)
  object_type = try(local.m1324["object_type"], null)
  owners = try(local.m1324["owners"], null)
  presence = try(local.m1324["presence"], null)
  results = try(local.m1324["results"], null)
  revision = try(local.m1324["revision"], null)
  rn = try(local.m1324["rn"], null)
  serial = try(local.m1324["serial"], null)
  shared_scope = try(local.m1324["shared_scope"], null)
  uuid = try(local.m1324["uuid"], null)
  vendor = try(local.m1324["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1324["ancestors"], null) == null ? [] : local.m1324["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m1324["device_location"], null) == null ? [] : local.m1324["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_system" {
    for_each = try(local.m1324["file_system"], null) == null ? [] : local.m1324["file_system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "object_store" {
    for_each = try(local.m1324["object_store"], null) == null ? [] : local.m1324["object_store"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1324["parent"], null) == null ? [] : local.m1324["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1324["permission_resources"], null) == null ? [] : local.m1324["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1324["previous_fru"], null) == null ? [] : local.m1324["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1324["registered_device"], null) == null ? [] : local.m1324["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1324["storage_utilization"], null) == null ? [] : local.m1324["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1324["tags"], null) == null ? [] : local.m1324["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1324["version_context"], null) == null ? [] : local.m1324["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
