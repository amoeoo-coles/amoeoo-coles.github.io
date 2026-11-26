# Sample data source intersight_storage_virtual_drive_extension — reads ../models/data_intersight_storage_virtual_drive_extension.yml
locals { m1353 = yamldecode(file("${path.module}/../models/data_intersight_storage_virtual_drive_extension.yml"))["data_intersight_storage_virtual_drive_extension"] }

data "intersight_storage_virtual_drive_extension" "n1353" {
  account_moid = try(local.m1353["account_moid"], null)
  additional_properties = try(local.m1353["additional_properties"], null)
  bootable = try(local.m1353["bootable"], null)
  class_id = try(local.m1353["class_id"], null)
  container_id = try(local.m1353["container_id"], null)
  create_time = try(local.m1353["create_time"], null)
  device_mo_id = try(local.m1353["device_mo_id"], null)
  dn = try(local.m1353["dn"], null)
  domain_group_moid = try(local.m1353["domain_group_moid"], null)
  drive_state = try(local.m1353["drive_state"], null)
  id = try(local.m1353["id"], null)
  mod_time = try(local.m1353["mod_time"], null)
  moid = try(local.m1353["moid"], null)
  name = try(local.m1353["name"], null)
  object_type = try(local.m1353["object_type"], null)
  oper_device_id = try(local.m1353["oper_device_id"], null)
  owners = try(local.m1353["owners"], null)
  results = try(local.m1353["results"], null)
  rn = try(local.m1353["rn"], null)
  shared_scope = try(local.m1353["shared_scope"], null)
  uuid = try(local.m1353["uuid"], null)
  vendor_uuid = try(local.m1353["vendor_uuid"], null)
  virtual_drive_dn = try(local.m1353["virtual_drive_dn"], null)
  virtual_drive_id = try(local.m1353["virtual_drive_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1353["ancestors"], null) == null ? [] : local.m1353["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1353["inventory_device_info"], null) == null ? [] : local.m1353["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1353["parent"], null) == null ? [] : local.m1353["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1353["permission_resources"], null) == null ? [] : local.m1353["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1353["registered_device"], null) == null ? [] : local.m1353["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1353["storage_controller"], null) == null ? [] : local.m1353["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1353["tags"], null) == null ? [] : local.m1353["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1353["version_context"], null) == null ? [] : local.m1353["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_drive" {
    for_each = try(local.m1353["virtual_drive"], null) == null ? [] : local.m1353["virtual_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
