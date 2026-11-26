# Sample data source intersight_storage_hitachi_array — reads ../models/data_intersight_storage_hitachi_array.yml
locals { m1236 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_array.yml"))["data_intersight_storage_hitachi_array"] }

data "intersight_storage_hitachi_array" "n1236" {
  account_moid = try(local.m1236["account_moid"], null)
  additional_properties = try(local.m1236["additional_properties"], null)
  class_id = try(local.m1236["class_id"], null)
  create_time = try(local.m1236["create_time"], null)
  ctl1_ip = try(local.m1236["ctl1_ip"], null)
  ctl1_micro_version = try(local.m1236["ctl1_micro_version"], null)
  ctl2_ip = try(local.m1236["ctl2_ip"], null)
  ctl2_micro_version = try(local.m1236["ctl2_micro_version"], null)
  device_id = try(local.m1236["device_id"], null)
  device_mo_id = try(local.m1236["device_mo_id"], null)
  device_type = try(local.m1236["device_type"], null)
  dn = try(local.m1236["dn"], null)
  domain_group_moid = try(local.m1236["domain_group_moid"], null)
  hardware_version = try(local.m1236["hardware_version"], null)
  id = try(local.m1236["id"], null)
  ip = try(local.m1236["ip"], null)
  is_upgraded = try(local.m1236["is_upgraded"], null)
  mod_time = try(local.m1236["mod_time"], null)
  model = try(local.m1236["model"], null)
  moid = try(local.m1236["moid"], null)
  name = try(local.m1236["name"], null)
  nr_version = try(local.m1236["nr_version"], null)
  object_type = try(local.m1236["object_type"], null)
  owners = try(local.m1236["owners"], null)
  presence = try(local.m1236["presence"], null)
  results = try(local.m1236["results"], null)
  revision = try(local.m1236["revision"], null)
  rn = try(local.m1236["rn"], null)
  serial = try(local.m1236["serial"], null)
  shared_scope = try(local.m1236["shared_scope"], null)
  svp_ip = try(local.m1236["svp_ip"], null)
  target_ctl = try(local.m1236["target_ctl"], null)
  uuid = try(local.m1236["uuid"], null)
  vendor = try(local.m1236["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1236["ancestors"], null) == null ? [] : local.m1236["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m1236["device_location"], null) == null ? [] : local.m1236["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1236["parent"], null) == null ? [] : local.m1236["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1236["permission_resources"], null) == null ? [] : local.m1236["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1236["previous_fru"], null) == null ? [] : local.m1236["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1236["registered_device"], null) == null ? [] : local.m1236["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1236["storage_utilization"], null) == null ? [] : local.m1236["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1236["tags"], null) == null ? [] : local.m1236["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1236["version_context"], null) == null ? [] : local.m1236["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
