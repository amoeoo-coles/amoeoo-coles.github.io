# Sample data source intersight_firmware_sas_expander_descriptor — reads ../models/data_intersight_firmware_sas_expander_descriptor.yml
locals { m500 = yamldecode(file("${path.module}/../models/data_intersight_firmware_sas_expander_descriptor.yml"))["data_intersight_firmware_sas_expander_descriptor"] }

data "intersight_firmware_sas_expander_descriptor" "n500" {
  account_moid = try(local.m500["account_moid"], null)
  additional_properties = try(local.m500["additional_properties"], null)
  brand_string = try(local.m500["brand_string"], null)
  class_id = try(local.m500["class_id"], null)
  create_time = try(local.m500["create_time"], null)
  description = try(local.m500["description"], null)
  domain_group_moid = try(local.m500["domain_group_moid"], null)
  id = try(local.m500["id"], null)
  label = try(local.m500["label"], null)
  mod_time = try(local.m500["mod_time"], null)
  model = try(local.m500["model"], null)
  moid = try(local.m500["moid"], null)
  nr_version = try(local.m500["nr_version"], null)
  object_type = try(local.m500["object_type"], null)
  owners = try(local.m500["owners"], null)
  results = try(local.m500["results"], null)
  revision = try(local.m500["revision"], null)
  shared_scope = try(local.m500["shared_scope"], null)
  vendor = try(local.m500["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m500["ancestors"], null) == null ? [] : local.m500["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m500["capabilities"], null) == null ? [] : local.m500["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m500["parent"], null) == null ? [] : local.m500["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m500["permission_resources"], null) == null ? [] : local.m500["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m500["tags"], null) == null ? [] : local.m500["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m500["version_context"], null) == null ? [] : local.m500["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
