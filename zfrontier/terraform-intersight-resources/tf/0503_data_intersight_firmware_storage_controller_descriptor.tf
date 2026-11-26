# Sample data source intersight_firmware_storage_controller_descriptor — reads ../models/data_intersight_firmware_storage_controller_descriptor.yml
locals { m503 = yamldecode(file("${path.module}/../models/data_intersight_firmware_storage_controller_descriptor.yml"))["data_intersight_firmware_storage_controller_descriptor"] }

data "intersight_firmware_storage_controller_descriptor" "n503" {
  account_moid = try(local.m503["account_moid"], null)
  additional_properties = try(local.m503["additional_properties"], null)
  brand_string = try(local.m503["brand_string"], null)
  class_id = try(local.m503["class_id"], null)
  create_time = try(local.m503["create_time"], null)
  description = try(local.m503["description"], null)
  domain_group_moid = try(local.m503["domain_group_moid"], null)
  id = try(local.m503["id"], null)
  label = try(local.m503["label"], null)
  mod_time = try(local.m503["mod_time"], null)
  model = try(local.m503["model"], null)
  moid = try(local.m503["moid"], null)
  nr_version = try(local.m503["nr_version"], null)
  object_type = try(local.m503["object_type"], null)
  owners = try(local.m503["owners"], null)
  results = try(local.m503["results"], null)
  revision = try(local.m503["revision"], null)
  shared_scope = try(local.m503["shared_scope"], null)
  vendor = try(local.m503["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m503["ancestors"], null) == null ? [] : local.m503["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m503["capabilities"], null) == null ? [] : local.m503["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m503["parent"], null) == null ? [] : local.m503["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m503["permission_resources"], null) == null ? [] : local.m503["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m503["tags"], null) == null ? [] : local.m503["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m503["version_context"], null) == null ? [] : local.m503["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
