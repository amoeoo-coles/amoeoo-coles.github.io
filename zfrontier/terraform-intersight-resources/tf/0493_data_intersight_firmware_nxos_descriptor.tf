# Sample data source intersight_firmware_nxos_descriptor — reads ../models/data_intersight_firmware_nxos_descriptor.yml
locals { m493 = yamldecode(file("${path.module}/../models/data_intersight_firmware_nxos_descriptor.yml"))["data_intersight_firmware_nxos_descriptor"] }

data "intersight_firmware_nxos_descriptor" "n493" {
  account_moid = try(local.m493["account_moid"], null)
  additional_properties = try(local.m493["additional_properties"], null)
  brand_string = try(local.m493["brand_string"], null)
  class_id = try(local.m493["class_id"], null)
  create_time = try(local.m493["create_time"], null)
  description = try(local.m493["description"], null)
  domain_group_moid = try(local.m493["domain_group_moid"], null)
  id = try(local.m493["id"], null)
  label = try(local.m493["label"], null)
  mod_time = try(local.m493["mod_time"], null)
  model = try(local.m493["model"], null)
  moid = try(local.m493["moid"], null)
  nr_version = try(local.m493["nr_version"], null)
  object_type = try(local.m493["object_type"], null)
  owners = try(local.m493["owners"], null)
  results = try(local.m493["results"], null)
  revision = try(local.m493["revision"], null)
  shared_scope = try(local.m493["shared_scope"], null)
  vendor = try(local.m493["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m493["ancestors"], null) == null ? [] : local.m493["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m493["capabilities"], null) == null ? [] : local.m493["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m493["parent"], null) == null ? [] : local.m493["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m493["permission_resources"], null) == null ? [] : local.m493["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m493["tags"], null) == null ? [] : local.m493["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m493["version_context"], null) == null ? [] : local.m493["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
