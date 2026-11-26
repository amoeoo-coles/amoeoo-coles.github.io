# Sample data source intersight_fmc_physical_interface — reads ../models/data_intersight_fmc_physical_interface.yml
locals { m512 = yamldecode(file("${path.module}/../models/data_intersight_fmc_physical_interface.yml"))["data_intersight_fmc_physical_interface"] }

data "intersight_fmc_physical_interface" "n512" {
  account_moid = try(local.m512["account_moid"], null)
  additional_properties = try(local.m512["additional_properties"], null)
  class_id = try(local.m512["class_id"], null)
  create_time = try(local.m512["create_time"], null)
  device_id = try(local.m512["device_id"], null)
  domain_group_moid = try(local.m512["domain_group_moid"], null)
  domain_id = try(local.m512["domain_id"], null)
  id = try(local.m512["id"], null)
  mod_time = try(local.m512["mod_time"], null)
  moid = try(local.m512["moid"], null)
  name = try(local.m512["name"], null)
  object_type = try(local.m512["object_type"], null)
  owners = try(local.m512["owners"], null)
  physical_interface_id = try(local.m512["physical_interface_id"], null)
  results = try(local.m512["results"], null)
  shared_scope = try(local.m512["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m512["ancestors"], null) == null ? [] : local.m512["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m512["parent"], null) == null ? [] : local.m512["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m512["permission_resources"], null) == null ? [] : local.m512["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m512["registered_device"], null) == null ? [] : local.m512["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m512["tags"], null) == null ? [] : local.m512["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m512["version_context"], null) == null ? [] : local.m512["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
