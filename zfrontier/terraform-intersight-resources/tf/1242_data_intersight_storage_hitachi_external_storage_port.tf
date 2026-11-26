# Sample data source intersight_storage_hitachi_external_storage_port — reads ../models/data_intersight_storage_hitachi_external_storage_port.yml
locals { m1242 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_external_storage_port.yml"))["data_intersight_storage_hitachi_external_storage_port"] }

data "intersight_storage_hitachi_external_storage_port" "n1242" {
  account_moid = try(local.m1242["account_moid"], null)
  additional_properties = try(local.m1242["additional_properties"], null)
  class_id = try(local.m1242["class_id"], null)
  create_time = try(local.m1242["create_time"], null)
  domain_group_moid = try(local.m1242["domain_group_moid"], null)
  external_is_used = try(local.m1242["external_is_used"], null)
  external_path_mode = try(local.m1242["external_path_mode"], null)
  external_port_id = try(local.m1242["external_port_id"], null)
  external_serial_number = try(local.m1242["external_serial_number"], null)
  external_storage_info = try(local.m1242["external_storage_info"], null)
  external_wwn = try(local.m1242["external_wwn"], null)
  id = try(local.m1242["id"], null)
  iscsi_ip_address = try(local.m1242["iscsi_ip_address"], null)
  iscsi_name = try(local.m1242["iscsi_name"], null)
  mod_time = try(local.m1242["mod_time"], null)
  moid = try(local.m1242["moid"], null)
  object_type = try(local.m1242["object_type"], null)
  owners = try(local.m1242["owners"], null)
  port_id = try(local.m1242["port_id"], null)
  results = try(local.m1242["results"], null)
  shared_scope = try(local.m1242["shared_scope"], null)
  virtual_port_id = try(local.m1242["virtual_port_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1242["ancestors"], null) == null ? [] : local.m1242["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1242["array"], null) == null ? [] : local.m1242["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1242["parent"], null) == null ? [] : local.m1242["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1242["permission_resources"], null) == null ? [] : local.m1242["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1242["registered_device"], null) == null ? [] : local.m1242["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1242["tags"], null) == null ? [] : local.m1242["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1242["version_context"], null) == null ? [] : local.m1242["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
