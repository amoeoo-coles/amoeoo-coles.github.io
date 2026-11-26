# Sample data source intersight_firmware_cimc_descriptor — reads ../models/data_intersight_firmware_cimc_descriptor.yml
locals { m481 = yamldecode(file("${path.module}/../models/data_intersight_firmware_cimc_descriptor.yml"))["data_intersight_firmware_cimc_descriptor"] }

data "intersight_firmware_cimc_descriptor" "n481" {
  account_moid = try(local.m481["account_moid"], null)
  additional_properties = try(local.m481["additional_properties"], null)
  brand_string = try(local.m481["brand_string"], null)
  class_id = try(local.m481["class_id"], null)
  create_time = try(local.m481["create_time"], null)
  description = try(local.m481["description"], null)
  domain_group_moid = try(local.m481["domain_group_moid"], null)
  id = try(local.m481["id"], null)
  label = try(local.m481["label"], null)
  mod_time = try(local.m481["mod_time"], null)
  model = try(local.m481["model"], null)
  moid = try(local.m481["moid"], null)
  nr_version = try(local.m481["nr_version"], null)
  object_type = try(local.m481["object_type"], null)
  owners = try(local.m481["owners"], null)
  results = try(local.m481["results"], null)
  revision = try(local.m481["revision"], null)
  shared_scope = try(local.m481["shared_scope"], null)
  vendor = try(local.m481["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m481["ancestors"], null) == null ? [] : local.m481["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m481["capabilities"], null) == null ? [] : local.m481["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m481["parent"], null) == null ? [] : local.m481["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m481["permission_resources"], null) == null ? [] : local.m481["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m481["tags"], null) == null ? [] : local.m481["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m481["version_context"], null) == null ? [] : local.m481["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
