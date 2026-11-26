# Sample data source intersight_storage_pure_controller — reads ../models/data_intersight_storage_pure_controller.yml
locals { m1315 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_controller.yml"))["data_intersight_storage_pure_controller"] }

data "intersight_storage_pure_controller" "n1315" {
  account_moid = try(local.m1315["account_moid"], null)
  additional_properties = try(local.m1315["additional_properties"], null)
  class_id = try(local.m1315["class_id"], null)
  create_time = try(local.m1315["create_time"], null)
  device_mo_id = try(local.m1315["device_mo_id"], null)
  dn = try(local.m1315["dn"], null)
  domain_group_moid = try(local.m1315["domain_group_moid"], null)
  id = try(local.m1315["id"], null)
  is_upgraded = try(local.m1315["is_upgraded"], null)
  mod_time = try(local.m1315["mod_time"], null)
  model = try(local.m1315["model"], null)
  moid = try(local.m1315["moid"], null)
  name = try(local.m1315["name"], null)
  nr_version = try(local.m1315["nr_version"], null)
  object_type = try(local.m1315["object_type"], null)
  operational_mode = try(local.m1315["operational_mode"], null)
  owners = try(local.m1315["owners"], null)
  presence = try(local.m1315["presence"], null)
  results = try(local.m1315["results"], null)
  revision = try(local.m1315["revision"], null)
  rn = try(local.m1315["rn"], null)
  serial = try(local.m1315["serial"], null)
  shared_scope = try(local.m1315["shared_scope"], null)
  status = try(local.m1315["status"], null)
  vendor = try(local.m1315["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1315["ancestors"], null) == null ? [] : local.m1315["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1315["array"], null) == null ? [] : local.m1315["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1315["parent"], null) == null ? [] : local.m1315["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1315["permission_resources"], null) == null ? [] : local.m1315["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1315["previous_fru"], null) == null ? [] : local.m1315["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1315["registered_device"], null) == null ? [] : local.m1315["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1315["tags"], null) == null ? [] : local.m1315["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1315["version_context"], null) == null ? [] : local.m1315["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
