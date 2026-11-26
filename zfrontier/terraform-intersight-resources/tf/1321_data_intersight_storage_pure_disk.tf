# Sample data source intersight_storage_pure_disk — reads ../models/data_intersight_storage_pure_disk.yml
locals { m1321 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_disk.yml"))["data_intersight_storage_pure_disk"] }

data "intersight_storage_pure_disk" "n1321" {
  account_moid = try(local.m1321["account_moid"], null)
  additional_properties = try(local.m1321["additional_properties"], null)
  class_id = try(local.m1321["class_id"], null)
  create_time = try(local.m1321["create_time"], null)
  device_mo_id = try(local.m1321["device_mo_id"], null)
  dn = try(local.m1321["dn"], null)
  domain_group_moid = try(local.m1321["domain_group_moid"], null)
  id = try(local.m1321["id"], null)
  is_upgraded = try(local.m1321["is_upgraded"], null)
  mod_time = try(local.m1321["mod_time"], null)
  model = try(local.m1321["model"], null)
  moid = try(local.m1321["moid"], null)
  name = try(local.m1321["name"], null)
  nr_version = try(local.m1321["nr_version"], null)
  object_type = try(local.m1321["object_type"], null)
  owners = try(local.m1321["owners"], null)
  part_number = try(local.m1321["part_number"], null)
  presence = try(local.m1321["presence"], null)
  protocol = try(local.m1321["protocol"], null)
  results = try(local.m1321["results"], null)
  revision = try(local.m1321["revision"], null)
  rn = try(local.m1321["rn"], null)
  serial = try(local.m1321["serial"], null)
  shared_scope = try(local.m1321["shared_scope"], null)
  speed = try(local.m1321["speed"], null)
  status = try(local.m1321["status"], null)
  type = try(local.m1321["type"], null)
  vendor = try(local.m1321["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1321["ancestors"], null) == null ? [] : local.m1321["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1321["array"], null) == null ? [] : local.m1321["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1321["parent"], null) == null ? [] : local.m1321["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1321["permission_resources"], null) == null ? [] : local.m1321["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1321["previous_fru"], null) == null ? [] : local.m1321["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1321["registered_device"], null) == null ? [] : local.m1321["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1321["storage_utilization"], null) == null ? [] : local.m1321["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1321["tags"], null) == null ? [] : local.m1321["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1321["version_context"], null) == null ? [] : local.m1321["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
