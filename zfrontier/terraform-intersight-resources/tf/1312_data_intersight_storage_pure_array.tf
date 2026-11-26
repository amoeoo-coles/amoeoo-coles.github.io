# Sample data source intersight_storage_pure_array — reads ../models/data_intersight_storage_pure_array.yml
locals { m1312 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_array.yml"))["data_intersight_storage_pure_array"] }

data "intersight_storage_pure_array" "n1312" {
  account_moid = try(local.m1312["account_moid"], null)
  additional_properties = try(local.m1312["additional_properties"], null)
  api_version = try(local.m1312["api_version"], null)
  class_id = try(local.m1312["class_id"], null)
  create_time = try(local.m1312["create_time"], null)
  device_mo_id = try(local.m1312["device_mo_id"], null)
  device_type = try(local.m1312["device_type"], null)
  dn = try(local.m1312["dn"], null)
  domain_group_moid = try(local.m1312["domain_group_moid"], null)
  hardware_version = try(local.m1312["hardware_version"], null)
  id = try(local.m1312["id"], null)
  is_upgraded = try(local.m1312["is_upgraded"], null)
  mod_time = try(local.m1312["mod_time"], null)
  model = try(local.m1312["model"], null)
  moid = try(local.m1312["moid"], null)
  name = try(local.m1312["name"], null)
  nr_version = try(local.m1312["nr_version"], null)
  object_type = try(local.m1312["object_type"], null)
  owners = try(local.m1312["owners"], null)
  presence = try(local.m1312["presence"], null)
  results = try(local.m1312["results"], null)
  revision = try(local.m1312["revision"], null)
  rn = try(local.m1312["rn"], null)
  serial = try(local.m1312["serial"], null)
  shared_scope = try(local.m1312["shared_scope"], null)
  uuid = try(local.m1312["uuid"], null)
  vendor = try(local.m1312["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1312["ancestors"], null) == null ? [] : local.m1312["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m1312["device_location"], null) == null ? [] : local.m1312["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1312["parent"], null) == null ? [] : local.m1312["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1312["permission_resources"], null) == null ? [] : local.m1312["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1312["previous_fru"], null) == null ? [] : local.m1312["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1312["registered_device"], null) == null ? [] : local.m1312["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1312["storage_utilization"], null) == null ? [] : local.m1312["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1312["tags"], null) == null ? [] : local.m1312["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1312["version_context"], null) == null ? [] : local.m1312["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
