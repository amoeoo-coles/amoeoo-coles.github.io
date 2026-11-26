# Sample data source intersight_storage_physical_disk_usage — reads ../models/data_intersight_storage_physical_disk_usage.yml
locals { m1311 = yamldecode(file("${path.module}/../models/data_intersight_storage_physical_disk_usage.yml"))["data_intersight_storage_physical_disk_usage"] }

data "intersight_storage_physical_disk_usage" "n1311" {
  account_moid = try(local.m1311["account_moid"], null)
  additional_properties = try(local.m1311["additional_properties"], null)
  class_id = try(local.m1311["class_id"], null)
  create_time = try(local.m1311["create_time"], null)
  device_mo_id = try(local.m1311["device_mo_id"], null)
  dn = try(local.m1311["dn"], null)
  domain_group_moid = try(local.m1311["domain_group_moid"], null)
  id = try(local.m1311["id"], null)
  mod_time = try(local.m1311["mod_time"], null)
  moid = try(local.m1311["moid"], null)
  number_of_blocks = try(local.m1311["number_of_blocks"], null)
  object_type = try(local.m1311["object_type"], null)
  owners = try(local.m1311["owners"], null)
  physical_drive = try(local.m1311["physical_drive"], null)
  results = try(local.m1311["results"], null)
  rn = try(local.m1311["rn"], null)
  shared_scope = try(local.m1311["shared_scope"], null)
  span = try(local.m1311["span"], null)
  starting_block = try(local.m1311["starting_block"], null)
  state = try(local.m1311["state"], null)
  virtual_drive = try(local.m1311["virtual_drive"], null)
  dynamic "ancestors" {
    for_each = try(local.m1311["ancestors"], null) == null ? [] : local.m1311["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1311["inventory_device_info"], null) == null ? [] : local.m1311["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1311["parent"], null) == null ? [] : local.m1311["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1311["permission_resources"], null) == null ? [] : local.m1311["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1311["registered_device"], null) == null ? [] : local.m1311["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_virtual_drive" {
    for_each = try(local.m1311["storage_virtual_drive"], null) == null ? [] : local.m1311["storage_virtual_drive"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1311["tags"], null) == null ? [] : local.m1311["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1311["version_context"], null) == null ? [] : local.m1311["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
