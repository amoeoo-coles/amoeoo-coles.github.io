# Sample data source intersight_firmware_psx_descriptor — reads ../models/data_intersight_firmware_psx_descriptor.yml
locals { m498 = yamldecode(file("${path.module}/../models/data_intersight_firmware_psx_descriptor.yml"))["data_intersight_firmware_psx_descriptor"] }

data "intersight_firmware_psx_descriptor" "n498" {
  account_moid = try(local.m498["account_moid"], null)
  additional_properties = try(local.m498["additional_properties"], null)
  brand_string = try(local.m498["brand_string"], null)
  class_id = try(local.m498["class_id"], null)
  create_time = try(local.m498["create_time"], null)
  description = try(local.m498["description"], null)
  domain_group_moid = try(local.m498["domain_group_moid"], null)
  id = try(local.m498["id"], null)
  label = try(local.m498["label"], null)
  mod_time = try(local.m498["mod_time"], null)
  model = try(local.m498["model"], null)
  moid = try(local.m498["moid"], null)
  nr_version = try(local.m498["nr_version"], null)
  object_type = try(local.m498["object_type"], null)
  owners = try(local.m498["owners"], null)
  results = try(local.m498["results"], null)
  revision = try(local.m498["revision"], null)
  shared_scope = try(local.m498["shared_scope"], null)
  vendor = try(local.m498["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m498["ancestors"], null) == null ? [] : local.m498["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m498["capabilities"], null) == null ? [] : local.m498["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m498["parent"], null) == null ? [] : local.m498["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m498["permission_resources"], null) == null ? [] : local.m498["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m498["tags"], null) == null ? [] : local.m498["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m498["version_context"], null) == null ? [] : local.m498["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
