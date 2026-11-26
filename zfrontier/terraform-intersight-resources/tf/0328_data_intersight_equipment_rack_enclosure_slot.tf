# Sample data source intersight_equipment_rack_enclosure_slot — reads ../models/data_intersight_equipment_rack_enclosure_slot.yml
locals { m328 = yamldecode(file("${path.module}/../models/data_intersight_equipment_rack_enclosure_slot.yml"))["data_intersight_equipment_rack_enclosure_slot"] }

data "intersight_equipment_rack_enclosure_slot" "n328" {
  account_moid = try(local.m328["account_moid"], null)
  additional_properties = try(local.m328["additional_properties"], null)
  class_id = try(local.m328["class_id"], null)
  create_time = try(local.m328["create_time"], null)
  device_mo_id = try(local.m328["device_mo_id"], null)
  dn = try(local.m328["dn"], null)
  domain_group_moid = try(local.m328["domain_group_moid"], null)
  id = try(local.m328["id"], null)
  is_upgraded = try(local.m328["is_upgraded"], null)
  mod_time = try(local.m328["mod_time"], null)
  model = try(local.m328["model"], null)
  moid = try(local.m328["moid"], null)
  object_type = try(local.m328["object_type"], null)
  owners = try(local.m328["owners"], null)
  presence = try(local.m328["presence"], null)
  rack_id = try(local.m328["rack_id"], null)
  rack_unit_dn = try(local.m328["rack_unit_dn"], null)
  results = try(local.m328["results"], null)
  revision = try(local.m328["revision"], null)
  rn = try(local.m328["rn"], null)
  serial = try(local.m328["serial"], null)
  shared_scope = try(local.m328["shared_scope"], null)
  vendor = try(local.m328["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m328["ancestors"], null) == null ? [] : local.m328["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_rack_enclosure" {
    for_each = try(local.m328["equipment_rack_enclosure"], null) == null ? [] : local.m328["equipment_rack_enclosure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m328["inventory_device_info"], null) == null ? [] : local.m328["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m328["parent"], null) == null ? [] : local.m328["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m328["permission_resources"], null) == null ? [] : local.m328["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m328["previous_fru"], null) == null ? [] : local.m328["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rack_unit" {
    for_each = try(local.m328["rack_unit"], null) == null ? [] : local.m328["rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m328["registered_device"], null) == null ? [] : local.m328["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m328["tags"], null) == null ? [] : local.m328["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m328["version_context"], null) == null ? [] : local.m328["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
