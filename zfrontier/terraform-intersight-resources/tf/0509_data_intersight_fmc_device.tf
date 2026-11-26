# Sample data source intersight_fmc_device — reads ../models/data_intersight_fmc_device.yml
locals { m509 = yamldecode(file("${path.module}/../models/data_intersight_fmc_device.yml"))["data_intersight_fmc_device"] }

data "intersight_fmc_device" "n509" {
  account_moid = try(local.m509["account_moid"], null)
  additional_properties = try(local.m509["additional_properties"], null)
  class_id = try(local.m509["class_id"], null)
  create_time = try(local.m509["create_time"], null)
  device_id = try(local.m509["device_id"], null)
  domain_group_moid = try(local.m509["domain_group_moid"], null)
  domain_id = try(local.m509["domain_id"], null)
  id = try(local.m509["id"], null)
  mod_time = try(local.m509["mod_time"], null)
  moid = try(local.m509["moid"], null)
  name = try(local.m509["name"], null)
  object_type = try(local.m509["object_type"], null)
  owners = try(local.m509["owners"], null)
  results = try(local.m509["results"], null)
  shared_scope = try(local.m509["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m509["ancestors"], null) == null ? [] : local.m509["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m509["parent"], null) == null ? [] : local.m509["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m509["permission_resources"], null) == null ? [] : local.m509["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m509["registered_device"], null) == null ? [] : local.m509["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m509["tags"], null) == null ? [] : local.m509["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m509["version_context"], null) == null ? [] : local.m509["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
