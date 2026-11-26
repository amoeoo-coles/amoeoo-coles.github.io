# Sample data source intersight_firmware_iom_descriptor — reads ../models/data_intersight_firmware_iom_descriptor.yml
locals { m491 = yamldecode(file("${path.module}/../models/data_intersight_firmware_iom_descriptor.yml"))["data_intersight_firmware_iom_descriptor"] }

data "intersight_firmware_iom_descriptor" "n491" {
  account_moid = try(local.m491["account_moid"], null)
  additional_properties = try(local.m491["additional_properties"], null)
  brand_string = try(local.m491["brand_string"], null)
  class_id = try(local.m491["class_id"], null)
  create_time = try(local.m491["create_time"], null)
  description = try(local.m491["description"], null)
  domain_group_moid = try(local.m491["domain_group_moid"], null)
  id = try(local.m491["id"], null)
  label = try(local.m491["label"], null)
  mod_time = try(local.m491["mod_time"], null)
  model = try(local.m491["model"], null)
  moid = try(local.m491["moid"], null)
  nr_version = try(local.m491["nr_version"], null)
  object_type = try(local.m491["object_type"], null)
  owners = try(local.m491["owners"], null)
  results = try(local.m491["results"], null)
  revision = try(local.m491["revision"], null)
  shared_scope = try(local.m491["shared_scope"], null)
  vendor = try(local.m491["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m491["ancestors"], null) == null ? [] : local.m491["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m491["capabilities"], null) == null ? [] : local.m491["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m491["parent"], null) == null ? [] : local.m491["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m491["permission_resources"], null) == null ? [] : local.m491["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m491["tags"], null) == null ? [] : local.m491["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m491["version_context"], null) == null ? [] : local.m491["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
