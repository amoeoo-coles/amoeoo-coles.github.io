# Sample data source intersight_storage_virtual_drive_container — reads ../models/data_intersight_storage_virtual_drive_container.yml
locals { m1352 = yamldecode(file("${path.module}/../models/data_intersight_storage_virtual_drive_container.yml"))["data_intersight_storage_virtual_drive_container"] }

data "intersight_storage_virtual_drive_container" "n1352" {
  account_moid = try(local.m1352["account_moid"], null)
  additional_properties = try(local.m1352["additional_properties"], null)
  class_id = try(local.m1352["class_id"], null)
  container_id = try(local.m1352["container_id"], null)
  create_time = try(local.m1352["create_time"], null)
  device_mo_id = try(local.m1352["device_mo_id"], null)
  dn = try(local.m1352["dn"], null)
  domain_group_moid = try(local.m1352["domain_group_moid"], null)
  id = try(local.m1352["id"], null)
  is_upgraded = try(local.m1352["is_upgraded"], null)
  mod_time = try(local.m1352["mod_time"], null)
  model = try(local.m1352["model"], null)
  moid = try(local.m1352["moid"], null)
  object_type = try(local.m1352["object_type"], null)
  owners = try(local.m1352["owners"], null)
  presence = try(local.m1352["presence"], null)
  results = try(local.m1352["results"], null)
  revision = try(local.m1352["revision"], null)
  rn = try(local.m1352["rn"], null)
  serial = try(local.m1352["serial"], null)
  shared_scope = try(local.m1352["shared_scope"], null)
  vendor = try(local.m1352["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1352["ancestors"], null) == null ? [] : local.m1352["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m1352["equipment_chassis"], null) == null ? [] : local.m1352["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1352["inventory_device_info"], null) == null ? [] : local.m1352["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1352["parent"], null) == null ? [] : local.m1352["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1352["permission_resources"], null) == null ? [] : local.m1352["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1352["previous_fru"], null) == null ? [] : local.m1352["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1352["registered_device"], null) == null ? [] : local.m1352["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1352["tags"], null) == null ? [] : local.m1352["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1352["version_context"], null) == null ? [] : local.m1352["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drive" {
    for_each = try(local.m1352["virtual_drive"], null) == null ? [] : local.m1352["virtual_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
