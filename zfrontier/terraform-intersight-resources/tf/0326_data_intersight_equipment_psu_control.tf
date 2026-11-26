# Sample data source intersight_equipment_psu_control — reads ../models/data_intersight_equipment_psu_control.yml
locals { m326 = yamldecode(file("${path.module}/../models/data_intersight_equipment_psu_control.yml"))["data_intersight_equipment_psu_control"] }

data "intersight_equipment_psu_control" "n326" {
  account_moid = try(local.m326["account_moid"], null)
  additional_properties = try(local.m326["additional_properties"], null)
  class_id = try(local.m326["class_id"], null)
  cluster_state = try(local.m326["cluster_state"], null)
  create_time = try(local.m326["create_time"], null)
  device_mo_id = try(local.m326["device_mo_id"], null)
  dn = try(local.m326["dn"], null)
  domain_group_moid = try(local.m326["domain_group_moid"], null)
  id = try(local.m326["id"], null)
  input_power_state = try(local.m326["input_power_state"], null)
  is_upgraded = try(local.m326["is_upgraded"], null)
  mod_time = try(local.m326["mod_time"], null)
  model = try(local.m326["model"], null)
  moid = try(local.m326["moid"], null)
  name = try(local.m326["name"], null)
  object_type = try(local.m326["object_type"], null)
  oper_qualifier = try(local.m326["oper_qualifier"], null)
  oper_reason = try(local.m326["oper_reason"], null)
  oper_state = try(local.m326["oper_state"], null)
  output_power_state = try(local.m326["output_power_state"], null)
  owners = try(local.m326["owners"], null)
  presence = try(local.m326["presence"], null)
  redundancy = try(local.m326["redundancy"], null)
  results = try(local.m326["results"], null)
  revision = try(local.m326["revision"], null)
  rn = try(local.m326["rn"], null)
  serial = try(local.m326["serial"], null)
  shared_scope = try(local.m326["shared_scope"], null)
  vendor = try(local.m326["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m326["ancestors"], null) == null ? [] : local.m326["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m326["equipment_chassis"], null) == null ? [] : local.m326["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m326["inventory_device_info"], null) == null ? [] : local.m326["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m326["parent"], null) == null ? [] : local.m326["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m326["permission_resources"], null) == null ? [] : local.m326["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m326["previous_fru"], null) == null ? [] : local.m326["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m326["registered_device"], null) == null ? [] : local.m326["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m326["tags"], null) == null ? [] : local.m326["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m326["version_context"], null) == null ? [] : local.m326["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
