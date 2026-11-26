# Sample data source intersight_fmc_device_ha_pair — reads ../models/data_intersight_fmc_device_ha_pair.yml
locals { m510 = yamldecode(file("${path.module}/../models/data_intersight_fmc_device_ha_pair.yml"))["data_intersight_fmc_device_ha_pair"] }

data "intersight_fmc_device_ha_pair" "n510" {
  account_moid = try(local.m510["account_moid"], null)
  additional_properties = try(local.m510["additional_properties"], null)
  class_id = try(local.m510["class_id"], null)
  create_time = try(local.m510["create_time"], null)
  device_id = try(local.m510["device_id"], null)
  domain_group_moid = try(local.m510["domain_group_moid"], null)
  domain_id = try(local.m510["domain_id"], null)
  id = try(local.m510["id"], null)
  mod_time = try(local.m510["mod_time"], null)
  moid = try(local.m510["moid"], null)
  name = try(local.m510["name"], null)
  object_type = try(local.m510["object_type"], null)
  owners = try(local.m510["owners"], null)
  results = try(local.m510["results"], null)
  shared_scope = try(local.m510["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m510["ancestors"], null) == null ? [] : local.m510["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m510["parent"], null) == null ? [] : local.m510["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m510["permission_resources"], null) == null ? [] : local.m510["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m510["registered_device"], null) == null ? [] : local.m510["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m510["tags"], null) == null ? [] : local.m510["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m510["version_context"], null) == null ? [] : local.m510["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
