# Sample data source intersight_firmware_psu_descriptor — reads ../models/data_intersight_firmware_psu_descriptor.yml
locals { m497 = yamldecode(file("${path.module}/../models/data_intersight_firmware_psu_descriptor.yml"))["data_intersight_firmware_psu_descriptor"] }

data "intersight_firmware_psu_descriptor" "n497" {
  account_moid = try(local.m497["account_moid"], null)
  additional_properties = try(local.m497["additional_properties"], null)
  brand_string = try(local.m497["brand_string"], null)
  class_id = try(local.m497["class_id"], null)
  create_time = try(local.m497["create_time"], null)
  description = try(local.m497["description"], null)
  domain_group_moid = try(local.m497["domain_group_moid"], null)
  id = try(local.m497["id"], null)
  label = try(local.m497["label"], null)
  mod_time = try(local.m497["mod_time"], null)
  model = try(local.m497["model"], null)
  moid = try(local.m497["moid"], null)
  nr_version = try(local.m497["nr_version"], null)
  object_type = try(local.m497["object_type"], null)
  owners = try(local.m497["owners"], null)
  results = try(local.m497["results"], null)
  revision = try(local.m497["revision"], null)
  shared_scope = try(local.m497["shared_scope"], null)
  vendor = try(local.m497["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m497["ancestors"], null) == null ? [] : local.m497["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m497["capabilities"], null) == null ? [] : local.m497["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m497["parent"], null) == null ? [] : local.m497["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m497["permission_resources"], null) == null ? [] : local.m497["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m497["tags"], null) == null ? [] : local.m497["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m497["version_context"], null) == null ? [] : local.m497["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
