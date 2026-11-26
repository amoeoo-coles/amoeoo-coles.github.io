# Sample data source intersight_storage_disk_slot — reads ../models/data_intersight_storage_disk_slot.yml
locals { m1222 = yamldecode(file("${path.module}/../models/data_intersight_storage_disk_slot.yml"))["data_intersight_storage_disk_slot"] }

data "intersight_storage_disk_slot" "n1222" {
  account_moid = try(local.m1222["account_moid"], null)
  additional_properties = try(local.m1222["additional_properties"], null)
  class_id = try(local.m1222["class_id"], null)
  create_time = try(local.m1222["create_time"], null)
  device_mo_id = try(local.m1222["device_mo_id"], null)
  dn = try(local.m1222["dn"], null)
  domain_group_moid = try(local.m1222["domain_group_moid"], null)
  id = try(local.m1222["id"], null)
  is_upgraded = try(local.m1222["is_upgraded"], null)
  mod_time = try(local.m1222["mod_time"], null)
  model = try(local.m1222["model"], null)
  moid = try(local.m1222["moid"], null)
  object_type = try(local.m1222["object_type"], null)
  owners = try(local.m1222["owners"], null)
  presence = try(local.m1222["presence"], null)
  results = try(local.m1222["results"], null)
  revision = try(local.m1222["revision"], null)
  rn = try(local.m1222["rn"], null)
  serial = try(local.m1222["serial"], null)
  shared_scope = try(local.m1222["shared_scope"], null)
  slot_id = try(local.m1222["slot_id"], null)
  vendor = try(local.m1222["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1222["ancestors"], null) == null ? [] : local.m1222["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1222["inventory_device_info"], null) == null ? [] : local.m1222["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1222["parent"], null) == null ? [] : local.m1222["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1222["permission_resources"], null) == null ? [] : local.m1222["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_disk" {
    for_each = try(local.m1222["physical_disk"], null) == null ? [] : local.m1222["physical_disk"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1222["previous_fru"], null) == null ? [] : local.m1222["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1222["registered_device"], null) == null ? [] : local.m1222["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_controller" {
    for_each = try(local.m1222["storage_controller"], null) == null ? [] : local.m1222["storage_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1222["tags"], null) == null ? [] : local.m1222["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1222["version_context"], null) == null ? [] : local.m1222["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
