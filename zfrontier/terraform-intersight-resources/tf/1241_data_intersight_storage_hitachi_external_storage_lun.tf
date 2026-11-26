# Sample data source intersight_storage_hitachi_external_storage_lun — reads ../models/data_intersight_storage_hitachi_external_storage_lun.yml
locals { m1241 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_external_storage_lun.yml"))["data_intersight_storage_hitachi_external_storage_lun"] }

data "intersight_storage_hitachi_external_storage_lun" "n1241" {
  account_moid = try(local.m1241["account_moid"], null)
  additional_properties = try(local.m1241["additional_properties"], null)
  class_id = try(local.m1241["class_id"], null)
  create_time = try(local.m1241["create_time"], null)
  domain_group_moid = try(local.m1241["domain_group_moid"], null)
  external_lun = try(local.m1241["external_lun"], null)
  external_port_id = try(local.m1241["external_port_id"], null)
  external_volume_capacity = try(local.m1241["external_volume_capacity"], null)
  external_volume_info = try(local.m1241["external_volume_info"], null)
  external_wwn = try(local.m1241["external_wwn"], null)
  id = try(local.m1241["id"], null)
  iscsi_ip_address = try(local.m1241["iscsi_ip_address"], null)
  iscsi_name = try(local.m1241["iscsi_name"], null)
  mod_time = try(local.m1241["mod_time"], null)
  moid = try(local.m1241["moid"], null)
  object_type = try(local.m1241["object_type"], null)
  owners = try(local.m1241["owners"], null)
  port_id = try(local.m1241["port_id"], null)
  results = try(local.m1241["results"], null)
  shared_scope = try(local.m1241["shared_scope"], null)
  virtual_port_id = try(local.m1241["virtual_port_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1241["ancestors"], null) == null ? [] : local.m1241["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1241["array"], null) == null ? [] : local.m1241["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "external_storage_port" {
    for_each = try(local.m1241["external_storage_port"], null) == null ? [] : local.m1241["external_storage_port"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1241["parent"], null) == null ? [] : local.m1241["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1241["permission_resources"], null) == null ? [] : local.m1241["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1241["registered_device"], null) == null ? [] : local.m1241["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1241["tags"], null) == null ? [] : local.m1241["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1241["version_context"], null) == null ? [] : local.m1241["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
