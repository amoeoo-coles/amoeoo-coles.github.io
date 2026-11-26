# Sample data source intersight_storage_file_item — reads ../models/data_intersight_storage_file_item.yml
locals { m1228 = yamldecode(file("${path.module}/../models/data_intersight_storage_file_item.yml"))["data_intersight_storage_file_item"] }

data "intersight_storage_file_item" "n1228" {
  account_moid = try(local.m1228["account_moid"], null)
  additional_properties = try(local.m1228["additional_properties"], null)
  class_id = try(local.m1228["class_id"], null)
  create_time = try(local.m1228["create_time"], null)
  description = try(local.m1228["description"], null)
  device_mo_id = try(local.m1228["device_mo_id"], null)
  dn = try(local.m1228["dn"], null)
  domain_group_moid = try(local.m1228["domain_group_moid"], null)
  file_id = try(local.m1228["file_id"], null)
  host_visible = try(local.m1228["host_visible"], null)
  id = try(local.m1228["id"], null)
  mod_time = try(local.m1228["mod_time"], null)
  moid = try(local.m1228["moid"], null)
  name = try(local.m1228["name"], null)
  object_type = try(local.m1228["object_type"], null)
  owners = try(local.m1228["owners"], null)
  results = try(local.m1228["results"], null)
  rn = try(local.m1228["rn"], null)
  shared_scope = try(local.m1228["shared_scope"], null)
  size = try(local.m1228["size"], null)
  type = try(local.m1228["type"], null)
  update_time = try(local.m1228["update_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m1228["ancestors"], null) == null ? [] : local.m1228["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1228["parent"], null) == null ? [] : local.m1228["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1228["permission_resources"], null) == null ? [] : local.m1228["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1228["registered_device"], null) == null ? [] : local.m1228["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_item" {
    for_each = try(local.m1228["storage_item"], null) == null ? [] : local.m1228["storage_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1228["tags"], null) == null ? [] : local.m1228["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1228["version_context"], null) == null ? [] : local.m1228["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
