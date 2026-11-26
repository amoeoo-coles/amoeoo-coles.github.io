# Sample data source intersight_firmware_hba_descriptor — reads ../models/data_intersight_firmware_hba_descriptor.yml
locals { m490 = yamldecode(file("${path.module}/../models/data_intersight_firmware_hba_descriptor.yml"))["data_intersight_firmware_hba_descriptor"] }

data "intersight_firmware_hba_descriptor" "n490" {
  account_moid = try(local.m490["account_moid"], null)
  additional_properties = try(local.m490["additional_properties"], null)
  brand_string = try(local.m490["brand_string"], null)
  class_id = try(local.m490["class_id"], null)
  create_time = try(local.m490["create_time"], null)
  description = try(local.m490["description"], null)
  domain_group_moid = try(local.m490["domain_group_moid"], null)
  id = try(local.m490["id"], null)
  label = try(local.m490["label"], null)
  mod_time = try(local.m490["mod_time"], null)
  model = try(local.m490["model"], null)
  moid = try(local.m490["moid"], null)
  nr_version = try(local.m490["nr_version"], null)
  object_type = try(local.m490["object_type"], null)
  owners = try(local.m490["owners"], null)
  results = try(local.m490["results"], null)
  revision = try(local.m490["revision"], null)
  shared_scope = try(local.m490["shared_scope"], null)
  vendor = try(local.m490["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m490["ancestors"], null) == null ? [] : local.m490["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m490["capabilities"], null) == null ? [] : local.m490["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m490["parent"], null) == null ? [] : local.m490["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m490["permission_resources"], null) == null ? [] : local.m490["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m490["tags"], null) == null ? [] : local.m490["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m490["version_context"], null) == null ? [] : local.m490["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
