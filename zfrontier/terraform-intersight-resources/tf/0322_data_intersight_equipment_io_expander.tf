# Sample data source intersight_equipment_io_expander — reads ../models/data_intersight_equipment_io_expander.yml
locals { m322 = yamldecode(file("${path.module}/../models/data_intersight_equipment_io_expander.yml"))["data_intersight_equipment_io_expander"] }

data "intersight_equipment_io_expander" "n322" {
  account_moid = try(local.m322["account_moid"], null)
  additional_properties = try(local.m322["additional_properties"], null)
  class_id = try(local.m322["class_id"], null)
  create_time = try(local.m322["create_time"], null)
  device_mo_id = try(local.m322["device_mo_id"], null)
  dn = try(local.m322["dn"], null)
  domain_group_moid = try(local.m322["domain_group_moid"], null)
  id = try(local.m322["id"], null)
  is_upgraded = try(local.m322["is_upgraded"], null)
  mod_time = try(local.m322["mod_time"], null)
  model = try(local.m322["model"], null)
  moid = try(local.m322["moid"], null)
  object_type = try(local.m322["object_type"], null)
  oper_state = try(local.m322["oper_state"], null)
  owners = try(local.m322["owners"], null)
  presence = try(local.m322["presence"], null)
  results = try(local.m322["results"], null)
  revision = try(local.m322["revision"], null)
  rn = try(local.m322["rn"], null)
  serial = try(local.m322["serial"], null)
  shared_scope = try(local.m322["shared_scope"], null)
  vendor = try(local.m322["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m322["ancestors"], null) == null ? [] : local.m322["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m322["compute_blade"], null) == null ? [] : local.m322["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m322["inventory_device_info"], null) == null ? [] : local.m322["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m322["parent"], null) == null ? [] : local.m322["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m322["permission_resources"], null) == null ? [] : local.m322["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m322["previous_fru"], null) == null ? [] : local.m322["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m322["registered_device"], null) == null ? [] : local.m322["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m322["tags"], null) == null ? [] : local.m322["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m322["version_context"], null) == null ? [] : local.m322["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
