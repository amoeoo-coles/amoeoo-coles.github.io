# Sample data source intersight_dnac_device — reads ../models/data_intersight_dnac_device.yml
locals { m288 = yamldecode(file("${path.module}/../models/data_intersight_dnac_device.yml"))["data_intersight_dnac_device"] }

data "intersight_dnac_device" "n288" {
  account_moid = try(local.m288["account_moid"], null)
  additional_properties = try(local.m288["additional_properties"], null)
  class_id = try(local.m288["class_id"], null)
  create_time = try(local.m288["create_time"], null)
  device_id = try(local.m288["device_id"], null)
  domain_group_moid = try(local.m288["domain_group_moid"], null)
  host_name = try(local.m288["host_name"], null)
  id = try(local.m288["id"], null)
  management_ip_address = try(local.m288["management_ip_address"], null)
  mod_time = try(local.m288["mod_time"], null)
  moid = try(local.m288["moid"], null)
  object_type = try(local.m288["object_type"], null)
  owners = try(local.m288["owners"], null)
  results = try(local.m288["results"], null)
  shared_scope = try(local.m288["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m288["ancestors"], null) == null ? [] : local.m288["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m288["parent"], null) == null ? [] : local.m288["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m288["permission_resources"], null) == null ? [] : local.m288["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m288["registered_device"], null) == null ? [] : local.m288["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m288["tags"], null) == null ? [] : local.m288["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m288["version_context"], null) == null ? [] : local.m288["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
