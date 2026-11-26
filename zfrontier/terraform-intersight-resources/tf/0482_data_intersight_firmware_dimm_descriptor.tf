# Sample data source intersight_firmware_dimm_descriptor — reads ../models/data_intersight_firmware_dimm_descriptor.yml
locals { m482 = yamldecode(file("${path.module}/../models/data_intersight_firmware_dimm_descriptor.yml"))["data_intersight_firmware_dimm_descriptor"] }

data "intersight_firmware_dimm_descriptor" "n482" {
  account_moid = try(local.m482["account_moid"], null)
  additional_properties = try(local.m482["additional_properties"], null)
  brand_string = try(local.m482["brand_string"], null)
  class_id = try(local.m482["class_id"], null)
  create_time = try(local.m482["create_time"], null)
  description = try(local.m482["description"], null)
  domain_group_moid = try(local.m482["domain_group_moid"], null)
  id = try(local.m482["id"], null)
  label = try(local.m482["label"], null)
  mod_time = try(local.m482["mod_time"], null)
  model = try(local.m482["model"], null)
  moid = try(local.m482["moid"], null)
  nr_version = try(local.m482["nr_version"], null)
  object_type = try(local.m482["object_type"], null)
  owners = try(local.m482["owners"], null)
  results = try(local.m482["results"], null)
  revision = try(local.m482["revision"], null)
  shared_scope = try(local.m482["shared_scope"], null)
  vendor = try(local.m482["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m482["ancestors"], null) == null ? [] : local.m482["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m482["capabilities"], null) == null ? [] : local.m482["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m482["parent"], null) == null ? [] : local.m482["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m482["permission_resources"], null) == null ? [] : local.m482["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m482["tags"], null) == null ? [] : local.m482["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m482["version_context"], null) == null ? [] : local.m482["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
