# Sample data source intersight_equipment_hybrid_drive_slot — reads ../models/data_intersight_equipment_hybrid_drive_slot.yml
locals { m318 = yamldecode(file("${path.module}/../models/data_intersight_equipment_hybrid_drive_slot.yml"))["data_intersight_equipment_hybrid_drive_slot"] }

data "intersight_equipment_hybrid_drive_slot" "n318" {
  account_moid = try(local.m318["account_moid"], null)
  additional_properties = try(local.m318["additional_properties"], null)
  class_id = try(local.m318["class_id"], null)
  create_time = try(local.m318["create_time"], null)
  current_mode = try(local.m318["current_mode"], null)
  device_mo_id = try(local.m318["device_mo_id"], null)
  dn = try(local.m318["dn"], null)
  domain_group_moid = try(local.m318["domain_group_moid"], null)
  id = try(local.m318["id"], null)
  is_upgraded = try(local.m318["is_upgraded"], null)
  mod_time = try(local.m318["mod_time"], null)
  model = try(local.m318["model"], null)
  moid = try(local.m318["moid"], null)
  object_type = try(local.m318["object_type"], null)
  owners = try(local.m318["owners"], null)
  presence = try(local.m318["presence"], null)
  requested_mode = try(local.m318["requested_mode"], null)
  results = try(local.m318["results"], null)
  revision = try(local.m318["revision"], null)
  rn = try(local.m318["rn"], null)
  serial = try(local.m318["serial"], null)
  shared_scope = try(local.m318["shared_scope"], null)
  slot_id = try(local.m318["slot_id"], null)
  vendor = try(local.m318["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m318["ancestors"], null) == null ? [] : local.m318["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m318["compute_blade"], null) == null ? [] : local.m318["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_board" {
    for_each = try(local.m318["compute_board"], null) == null ? [] : local.m318["compute_board"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m318["compute_rack_unit"], null) == null ? [] : local.m318["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m318["parent"], null) == null ? [] : local.m318["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m318["permission_resources"], null) == null ? [] : local.m318["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m318["previous_fru"], null) == null ? [] : local.m318["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m318["registered_device"], null) == null ? [] : local.m318["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m318["tags"], null) == null ? [] : local.m318["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m318["version_context"], null) == null ? [] : local.m318["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
