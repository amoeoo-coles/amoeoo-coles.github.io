# Sample data source intersight_storage_hitachi_disk — reads ../models/data_intersight_storage_hitachi_disk.yml
locals { m1238 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_disk.yml"))["data_intersight_storage_hitachi_disk"] }

data "intersight_storage_hitachi_disk" "n1238" {
  account_moid = try(local.m1238["account_moid"], null)
  additional_properties = try(local.m1238["additional_properties"], null)
  class_id = try(local.m1238["class_id"], null)
  create_time = try(local.m1238["create_time"], null)
  device_mo_id = try(local.m1238["device_mo_id"], null)
  dn = try(local.m1238["dn"], null)
  domain_group_moid = try(local.m1238["domain_group_moid"], null)
  drive_type_code = try(local.m1238["drive_type_code"], null)
  id = try(local.m1238["id"], null)
  is_upgraded = try(local.m1238["is_upgraded"], null)
  mod_time = try(local.m1238["mod_time"], null)
  model = try(local.m1238["model"], null)
  moid = try(local.m1238["moid"], null)
  name = try(local.m1238["name"], null)
  nr_version = try(local.m1238["nr_version"], null)
  object_type = try(local.m1238["object_type"], null)
  owners = try(local.m1238["owners"], null)
  parity_group_id = try(local.m1238["parity_group_id"], null)
  part_number = try(local.m1238["part_number"], null)
  presence = try(local.m1238["presence"], null)
  protocol = try(local.m1238["protocol"], null)
  results = try(local.m1238["results"], null)
  revision = try(local.m1238["revision"], null)
  rn = try(local.m1238["rn"], null)
  serial = try(local.m1238["serial"], null)
  shared_scope = try(local.m1238["shared_scope"], null)
  speed = try(local.m1238["speed"], null)
  status = try(local.m1238["status"], null)
  type = try(local.m1238["type"], null)
  type_detail = try(local.m1238["type_detail"], null)
  usage = try(local.m1238["usage"], null)
  vendor = try(local.m1238["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1238["ancestors"], null) == null ? [] : local.m1238["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1238["array"], null) == null ? [] : local.m1238["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1238["parent"], null) == null ? [] : local.m1238["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parity_group" {
    for_each = try(local.m1238["parity_group"], null) == null ? [] : local.m1238["parity_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1238["permission_resources"], null) == null ? [] : local.m1238["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1238["previous_fru"], null) == null ? [] : local.m1238["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1238["registered_device"], null) == null ? [] : local.m1238["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1238["storage_utilization"], null) == null ? [] : local.m1238["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1238["tags"], null) == null ? [] : local.m1238["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1238["version_context"], null) == null ? [] : local.m1238["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
