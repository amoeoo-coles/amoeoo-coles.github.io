# Sample data source intersight_firmware_gpu_descriptor — reads ../models/data_intersight_firmware_gpu_descriptor.yml
locals { m489 = yamldecode(file("${path.module}/../models/data_intersight_firmware_gpu_descriptor.yml"))["data_intersight_firmware_gpu_descriptor"] }

data "intersight_firmware_gpu_descriptor" "n489" {
  account_moid = try(local.m489["account_moid"], null)
  additional_properties = try(local.m489["additional_properties"], null)
  brand_string = try(local.m489["brand_string"], null)
  class_id = try(local.m489["class_id"], null)
  create_time = try(local.m489["create_time"], null)
  description = try(local.m489["description"], null)
  domain_group_moid = try(local.m489["domain_group_moid"], null)
  id = try(local.m489["id"], null)
  label = try(local.m489["label"], null)
  mod_time = try(local.m489["mod_time"], null)
  model = try(local.m489["model"], null)
  moid = try(local.m489["moid"], null)
  nr_version = try(local.m489["nr_version"], null)
  object_type = try(local.m489["object_type"], null)
  owners = try(local.m489["owners"], null)
  results = try(local.m489["results"], null)
  revision = try(local.m489["revision"], null)
  shared_scope = try(local.m489["shared_scope"], null)
  vendor = try(local.m489["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m489["ancestors"], null) == null ? [] : local.m489["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m489["capabilities"], null) == null ? [] : local.m489["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m489["parent"], null) == null ? [] : local.m489["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m489["permission_resources"], null) == null ? [] : local.m489["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m489["tags"], null) == null ? [] : local.m489["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m489["version_context"], null) == null ? [] : local.m489["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
