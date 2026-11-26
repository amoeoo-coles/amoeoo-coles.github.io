# Sample data source intersight_equipment_fru — reads ../models/data_intersight_equipment_fru.yml
locals { m317 = yamldecode(file("${path.module}/../models/data_intersight_equipment_fru.yml"))["data_intersight_equipment_fru"] }

data "intersight_equipment_fru" "n317" {
  account_moid = try(local.m317["account_moid"], null)
  action = try(local.m317["action"], null)
  additional_properties = try(local.m317["additional_properties"], null)
  class_id = try(local.m317["class_id"], null)
  create_time = try(local.m317["create_time"], null)
  device_mo_id = try(local.m317["device_mo_id"], null)
  dn = try(local.m317["dn"], null)
  domain_group_moid = try(local.m317["domain_group_moid"], null)
  id = try(local.m317["id"], null)
  is_upgraded = try(local.m317["is_upgraded"], null)
  mod_time = try(local.m317["mod_time"], null)
  model = try(local.m317["model"], null)
  moid = try(local.m317["moid"], null)
  object_type = try(local.m317["object_type"], null)
  owners = try(local.m317["owners"], null)
  presence = try(local.m317["presence"], null)
  results = try(local.m317["results"], null)
  revision = try(local.m317["revision"], null)
  rn = try(local.m317["rn"], null)
  serial = try(local.m317["serial"], null)
  shared_scope = try(local.m317["shared_scope"], null)
  vendor = try(local.m317["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m317["ancestors"], null) == null ? [] : local.m317["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_fru" {
    for_each = try(local.m317["current_fru"], null) == null ? [] : local.m317["current_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m317["inventory_device_info"], null) == null ? [] : local.m317["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m317["parent"], null) == null ? [] : local.m317["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m317["permission_resources"], null) == null ? [] : local.m317["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m317["previous_fru"], null) == null ? [] : local.m317["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m317["registered_device"], null) == null ? [] : local.m317["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m317["tags"], null) == null ? [] : local.m317["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m317["version_context"], null) == null ? [] : local.m317["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
