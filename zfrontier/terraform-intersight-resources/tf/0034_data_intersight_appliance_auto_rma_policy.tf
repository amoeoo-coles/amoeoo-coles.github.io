# Sample data source intersight_appliance_auto_rma_policy — reads ../models/data_intersight_appliance_auto_rma_policy.yml
locals { m034 = yamldecode(file("${path.module}/../models/data_intersight_appliance_auto_rma_policy.yml"))["data_intersight_appliance_auto_rma_policy"] }

data "intersight_appliance_auto_rma_policy" "n034" {
  account_moid = try(local.m034["account_moid"], null)
  additional_properties = try(local.m034["additional_properties"], null)
  class_id = try(local.m034["class_id"], null)
  create_time = try(local.m034["create_time"], null)
  domain_group_moid = try(local.m034["domain_group_moid"], null)
  enable = try(local.m034["enable"], null)
  id = try(local.m034["id"], null)
  mod_time = try(local.m034["mod_time"], null)
  moid = try(local.m034["moid"], null)
  object_type = try(local.m034["object_type"], null)
  owners = try(local.m034["owners"], null)
  results = try(local.m034["results"], null)
  shared_scope = try(local.m034["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m034["ancestors"], null) == null ? [] : local.m034["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m034["parent"], null) == null ? [] : local.m034["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m034["permission_resources"], null) == null ? [] : local.m034["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m034["registered_device"], null) == null ? [] : local.m034["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m034["tags"], null) == null ? [] : local.m034["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m034["version_context"], null) == null ? [] : local.m034["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
