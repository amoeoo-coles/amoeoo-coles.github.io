# Sample data source intersight_firmware_bios_descriptor — reads ../models/data_intersight_firmware_bios_descriptor.yml
locals { m478 = yamldecode(file("${path.module}/../models/data_intersight_firmware_bios_descriptor.yml"))["data_intersight_firmware_bios_descriptor"] }

data "intersight_firmware_bios_descriptor" "n478" {
  account_moid = try(local.m478["account_moid"], null)
  additional_properties = try(local.m478["additional_properties"], null)
  brand_string = try(local.m478["brand_string"], null)
  class_id = try(local.m478["class_id"], null)
  create_time = try(local.m478["create_time"], null)
  description = try(local.m478["description"], null)
  domain_group_moid = try(local.m478["domain_group_moid"], null)
  id = try(local.m478["id"], null)
  label = try(local.m478["label"], null)
  mod_time = try(local.m478["mod_time"], null)
  model = try(local.m478["model"], null)
  moid = try(local.m478["moid"], null)
  nr_version = try(local.m478["nr_version"], null)
  object_type = try(local.m478["object_type"], null)
  owners = try(local.m478["owners"], null)
  results = try(local.m478["results"], null)
  revision = try(local.m478["revision"], null)
  shared_scope = try(local.m478["shared_scope"], null)
  vendor = try(local.m478["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m478["ancestors"], null) == null ? [] : local.m478["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m478["capabilities"], null) == null ? [] : local.m478["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m478["parent"], null) == null ? [] : local.m478["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m478["permission_resources"], null) == null ? [] : local.m478["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m478["tags"], null) == null ? [] : local.m478["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m478["version_context"], null) == null ? [] : local.m478["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
