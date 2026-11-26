# Sample data source intersight_firmware_mswitch_descriptor — reads ../models/data_intersight_firmware_mswitch_descriptor.yml
locals { m492 = yamldecode(file("${path.module}/../models/data_intersight_firmware_mswitch_descriptor.yml"))["data_intersight_firmware_mswitch_descriptor"] }

data "intersight_firmware_mswitch_descriptor" "n492" {
  account_moid = try(local.m492["account_moid"], null)
  additional_properties = try(local.m492["additional_properties"], null)
  brand_string = try(local.m492["brand_string"], null)
  class_id = try(local.m492["class_id"], null)
  create_time = try(local.m492["create_time"], null)
  description = try(local.m492["description"], null)
  domain_group_moid = try(local.m492["domain_group_moid"], null)
  id = try(local.m492["id"], null)
  label = try(local.m492["label"], null)
  mod_time = try(local.m492["mod_time"], null)
  model = try(local.m492["model"], null)
  moid = try(local.m492["moid"], null)
  nr_version = try(local.m492["nr_version"], null)
  object_type = try(local.m492["object_type"], null)
  owners = try(local.m492["owners"], null)
  results = try(local.m492["results"], null)
  revision = try(local.m492["revision"], null)
  shared_scope = try(local.m492["shared_scope"], null)
  vendor = try(local.m492["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m492["ancestors"], null) == null ? [] : local.m492["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m492["capabilities"], null) == null ? [] : local.m492["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m492["parent"], null) == null ? [] : local.m492["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m492["permission_resources"], null) == null ? [] : local.m492["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m492["tags"], null) == null ? [] : local.m492["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m492["version_context"], null) == null ? [] : local.m492["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
