# Sample data source intersight_storage_enclosure_disk_slot_ep — reads ../models/data_intersight_storage_enclosure_disk_slot_ep.yml
locals { m1227 = yamldecode(file("${path.module}/../models/data_intersight_storage_enclosure_disk_slot_ep.yml"))["data_intersight_storage_enclosure_disk_slot_ep"] }

data "intersight_storage_enclosure_disk_slot_ep" "n1227" {
  account_moid = try(local.m1227["account_moid"], null)
  additional_properties = try(local.m1227["additional_properties"], null)
  class_id = try(local.m1227["class_id"], null)
  create_time = try(local.m1227["create_time"], null)
  device_mo_id = try(local.m1227["device_mo_id"], null)
  dn = try(local.m1227["dn"], null)
  domain_group_moid = try(local.m1227["domain_group_moid"], null)
  drive_path = try(local.m1227["drive_path"], null)
  health = try(local.m1227["health"], null)
  id = try(local.m1227["id"], null)
  mod_time = try(local.m1227["mod_time"], null)
  moid = try(local.m1227["moid"], null)
  object_type = try(local.m1227["object_type"], null)
  owners = try(local.m1227["owners"], null)
  presence = try(local.m1227["presence"], null)
  results = try(local.m1227["results"], null)
  rn = try(local.m1227["rn"], null)
  shared_scope = try(local.m1227["shared_scope"], null)
  slot = try(local.m1227["slot"], null)
  dynamic "ancestors" {
    for_each = try(local.m1227["ancestors"], null) == null ? [] : local.m1227["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1227["inventory_device_info"], null) == null ? [] : local.m1227["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1227["parent"], null) == null ? [] : local.m1227["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1227["permission_resources"], null) == null ? [] : local.m1227["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1227["registered_device"], null) == null ? [] : local.m1227["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_enclosure" {
    for_each = try(local.m1227["storage_enclosure"], null) == null ? [] : local.m1227["storage_enclosure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1227["tags"], null) == null ? [] : local.m1227["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1227["version_context"], null) == null ? [] : local.m1227["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
