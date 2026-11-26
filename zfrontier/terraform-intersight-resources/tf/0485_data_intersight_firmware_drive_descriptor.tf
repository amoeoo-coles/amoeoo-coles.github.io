# Sample data source intersight_firmware_drive_descriptor — reads ../models/data_intersight_firmware_drive_descriptor.yml
locals { m485 = yamldecode(file("${path.module}/../models/data_intersight_firmware_drive_descriptor.yml"))["data_intersight_firmware_drive_descriptor"] }

data "intersight_firmware_drive_descriptor" "n485" {
  account_moid = try(local.m485["account_moid"], null)
  additional_properties = try(local.m485["additional_properties"], null)
  brand_string = try(local.m485["brand_string"], null)
  class_id = try(local.m485["class_id"], null)
  create_time = try(local.m485["create_time"], null)
  description = try(local.m485["description"], null)
  domain_group_moid = try(local.m485["domain_group_moid"], null)
  id = try(local.m485["id"], null)
  label = try(local.m485["label"], null)
  mod_time = try(local.m485["mod_time"], null)
  model = try(local.m485["model"], null)
  moid = try(local.m485["moid"], null)
  nr_version = try(local.m485["nr_version"], null)
  object_type = try(local.m485["object_type"], null)
  owners = try(local.m485["owners"], null)
  results = try(local.m485["results"], null)
  revision = try(local.m485["revision"], null)
  shared_scope = try(local.m485["shared_scope"], null)
  vendor = try(local.m485["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m485["ancestors"], null) == null ? [] : local.m485["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m485["capabilities"], null) == null ? [] : local.m485["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m485["parent"], null) == null ? [] : local.m485["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m485["permission_resources"], null) == null ? [] : local.m485["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m485["tags"], null) == null ? [] : local.m485["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m485["version_context"], null) == null ? [] : local.m485["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
