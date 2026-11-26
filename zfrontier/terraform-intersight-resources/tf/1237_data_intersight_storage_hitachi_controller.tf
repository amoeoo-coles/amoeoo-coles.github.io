# Sample data source intersight_storage_hitachi_controller — reads ../models/data_intersight_storage_hitachi_controller.yml
locals { m1237 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_controller.yml"))["data_intersight_storage_hitachi_controller"] }

data "intersight_storage_hitachi_controller" "n1237" {
  account_moid = try(local.m1237["account_moid"], null)
  additional_properties = try(local.m1237["additional_properties"], null)
  class_id = try(local.m1237["class_id"], null)
  create_time = try(local.m1237["create_time"], null)
  device_mo_id = try(local.m1237["device_mo_id"], null)
  dn = try(local.m1237["dn"], null)
  domain_group_moid = try(local.m1237["domain_group_moid"], null)
  id = try(local.m1237["id"], null)
  is_upgraded = try(local.m1237["is_upgraded"], null)
  mod_time = try(local.m1237["mod_time"], null)
  model = try(local.m1237["model"], null)
  moid = try(local.m1237["moid"], null)
  name = try(local.m1237["name"], null)
  nr_version = try(local.m1237["nr_version"], null)
  object_type = try(local.m1237["object_type"], null)
  operational_mode = try(local.m1237["operational_mode"], null)
  owners = try(local.m1237["owners"], null)
  presence = try(local.m1237["presence"], null)
  results = try(local.m1237["results"], null)
  revision = try(local.m1237["revision"], null)
  rn = try(local.m1237["rn"], null)
  serial = try(local.m1237["serial"], null)
  shared_scope = try(local.m1237["shared_scope"], null)
  status = try(local.m1237["status"], null)
  vendor = try(local.m1237["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1237["ancestors"], null) == null ? [] : local.m1237["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1237["array"], null) == null ? [] : local.m1237["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1237["parent"], null) == null ? [] : local.m1237["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1237["permission_resources"], null) == null ? [] : local.m1237["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1237["previous_fru"], null) == null ? [] : local.m1237["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1237["registered_device"], null) == null ? [] : local.m1237["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1237["tags"], null) == null ? [] : local.m1237["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1237["version_context"], null) == null ? [] : local.m1237["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
