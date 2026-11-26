# Sample data source intersight_meraki_organization — reads ../models/data_intersight_meraki_organization.yml
locals { m836 = yamldecode(file("${path.module}/../models/data_intersight_meraki_organization.yml"))["data_intersight_meraki_organization"] }

data "intersight_meraki_organization" "n836" {
  account_moid = try(local.m836["account_moid"], null)
  additional_properties = try(local.m836["additional_properties"], null)
  class_id = try(local.m836["class_id"], null)
  create_time = try(local.m836["create_time"], null)
  domain_group_moid = try(local.m836["domain_group_moid"], null)
  id = try(local.m836["id"], null)
  mod_time = try(local.m836["mod_time"], null)
  moid = try(local.m836["moid"], null)
  name = try(local.m836["name"], null)
  object_type = try(local.m836["object_type"], null)
  organization_id = try(local.m836["organization_id"], null)
  owners = try(local.m836["owners"], null)
  results = try(local.m836["results"], null)
  shared_scope = try(local.m836["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m836["ancestors"], null) == null ? [] : local.m836["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m836["parent"], null) == null ? [] : local.m836["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m836["permission_resources"], null) == null ? [] : local.m836["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m836["registered_device"], null) == null ? [] : local.m836["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m836["tags"], null) == null ? [] : local.m836["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m836["version_context"], null) == null ? [] : local.m836["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
