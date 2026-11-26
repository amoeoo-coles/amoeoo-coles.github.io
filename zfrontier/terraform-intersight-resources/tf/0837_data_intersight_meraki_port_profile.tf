# Sample data source intersight_meraki_port_profile — reads ../models/data_intersight_meraki_port_profile.yml
locals { m837 = yamldecode(file("${path.module}/../models/data_intersight_meraki_port_profile.yml"))["data_intersight_meraki_port_profile"] }

data "intersight_meraki_port_profile" "n837" {
  account_moid = try(local.m837["account_moid"], null)
  additional_properties = try(local.m837["additional_properties"], null)
  class_id = try(local.m837["class_id"], null)
  create_time = try(local.m837["create_time"], null)
  domain_group_moid = try(local.m837["domain_group_moid"], null)
  id = try(local.m837["id"], null)
  mod_time = try(local.m837["mod_time"], null)
  moid = try(local.m837["moid"], null)
  name = try(local.m837["name"], null)
  object_type = try(local.m837["object_type"], null)
  owners = try(local.m837["owners"], null)
  profile_id = try(local.m837["profile_id"], null)
  results = try(local.m837["results"], null)
  shared_scope = try(local.m837["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m837["ancestors"], null) == null ? [] : local.m837["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m837["parent"], null) == null ? [] : local.m837["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m837["permission_resources"], null) == null ? [] : local.m837["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m837["registered_device"], null) == null ? [] : local.m837["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m837["tags"], null) == null ? [] : local.m837["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m837["version_context"], null) == null ? [] : local.m837["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
