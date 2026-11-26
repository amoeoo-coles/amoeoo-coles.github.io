# Sample data source intersight_storage_sas_expander — reads ../models/data_intersight_storage_sas_expander.yml
locals { m1346 = yamldecode(file("${path.module}/../models/data_intersight_storage_sas_expander.yml"))["data_intersight_storage_sas_expander"] }

data "intersight_storage_sas_expander" "n1346" {
  account_moid = try(local.m1346["account_moid"], null)
  additional_properties = try(local.m1346["additional_properties"], null)
  class_id = try(local.m1346["class_id"], null)
  create_time = try(local.m1346["create_time"], null)
  device_mo_id = try(local.m1346["device_mo_id"], null)
  dn = try(local.m1346["dn"], null)
  domain_group_moid = try(local.m1346["domain_group_moid"], null)
  expander_id = try(local.m1346["expander_id"], null)
  id = try(local.m1346["id"], null)
  is_upgraded = try(local.m1346["is_upgraded"], null)
  mod_time = try(local.m1346["mod_time"], null)
  model = try(local.m1346["model"], null)
  moid = try(local.m1346["moid"], null)
  name = try(local.m1346["name"], null)
  object_type = try(local.m1346["object_type"], null)
  oper_state = try(local.m1346["oper_state"], null)
  operability = try(local.m1346["operability"], null)
  owners = try(local.m1346["owners"], null)
  presence = try(local.m1346["presence"], null)
  results = try(local.m1346["results"], null)
  revision = try(local.m1346["revision"], null)
  rn = try(local.m1346["rn"], null)
  sas_address = try(local.m1346["sas_address"], null)
  serial = try(local.m1346["serial"], null)
  shared_scope = try(local.m1346["shared_scope"], null)
  vendor = try(local.m1346["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1346["ancestors"], null) == null ? [] : local.m1346["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m1346["compute_rack_unit"], null) == null ? [] : local.m1346["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller" {
    for_each = try(local.m1346["controller"], null) == null ? [] : local.m1346["controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m1346["equipment_chassis"], null) == null ? [] : local.m1346["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1346["inventory_device_info"], null) == null ? [] : local.m1346["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1346["parent"], null) == null ? [] : local.m1346["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1346["permission_resources"], null) == null ? [] : local.m1346["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1346["previous_fru"], null) == null ? [] : local.m1346["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1346["registered_device"], null) == null ? [] : local.m1346["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1346["tags"], null) == null ? [] : local.m1346["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1346["version_context"], null) == null ? [] : local.m1346["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
