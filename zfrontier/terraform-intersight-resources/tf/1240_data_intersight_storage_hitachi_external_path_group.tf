# Sample data source intersight_storage_hitachi_external_path_group — reads ../models/data_intersight_storage_hitachi_external_path_group.yml
locals { m1240 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_external_path_group.yml"))["data_intersight_storage_hitachi_external_path_group"] }

data "intersight_storage_hitachi_external_path_group" "n1240" {
  account_moid = try(local.m1240["account_moid"], null)
  additional_properties = try(local.m1240["additional_properties"], null)
  class_id = try(local.m1240["class_id"], null)
  create_time = try(local.m1240["create_time"], null)
  domain_group_moid = try(local.m1240["domain_group_moid"], null)
  external_product_id = try(local.m1240["external_product_id"], null)
  external_serial_number = try(local.m1240["external_serial_number"], null)
  id = try(local.m1240["id"], null)
  mod_time = try(local.m1240["mod_time"], null)
  moid = try(local.m1240["moid"], null)
  name = try(local.m1240["name"], null)
  object_type = try(local.m1240["object_type"], null)
  owners = try(local.m1240["owners"], null)
  results = try(local.m1240["results"], null)
  shared_scope = try(local.m1240["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1240["ancestors"], null) == null ? [] : local.m1240["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1240["array"], null) == null ? [] : local.m1240["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "external_parity_groups" {
    for_each = try(local.m1240["external_parity_groups"], null) == null ? [] : local.m1240["external_parity_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "external_paths" {
    for_each = try(local.m1240["external_paths"], null) == null ? [] : local.m1240["external_paths"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1240["parent"], null) == null ? [] : local.m1240["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1240["permission_resources"], null) == null ? [] : local.m1240["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1240["registered_device"], null) == null ? [] : local.m1240["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1240["tags"], null) == null ? [] : local.m1240["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1240["version_context"], null) == null ? [] : local.m1240["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
