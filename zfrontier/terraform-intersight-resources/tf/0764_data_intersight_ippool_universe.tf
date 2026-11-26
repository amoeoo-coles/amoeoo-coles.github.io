# Sample data source intersight_ippool_universe — reads ../models/data_intersight_ippool_universe.yml
locals { m764 = yamldecode(file("${path.module}/../models/data_intersight_ippool_universe.yml"))["data_intersight_ippool_universe"] }

data "intersight_ippool_universe" "n764" {
  account_moid = try(local.m764["account_moid"], null)
  additional_properties = try(local.m764["additional_properties"], null)
  class_id = try(local.m764["class_id"], null)
  create_time = try(local.m764["create_time"], null)
  domain_group_moid = try(local.m764["domain_group_moid"], null)
  id = try(local.m764["id"], null)
  mod_time = try(local.m764["mod_time"], null)
  moid = try(local.m764["moid"], null)
  object_type = try(local.m764["object_type"], null)
  owners = try(local.m764["owners"], null)
  results = try(local.m764["results"], null)
  shared_scope = try(local.m764["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m764["ancestors"], null) == null ? [] : local.m764["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m764["parent"], null) == null ? [] : local.m764["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m764["permission_resources"], null) == null ? [] : local.m764["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m764["tags"], null) == null ? [] : local.m764["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m764["version_context"], null) == null ? [] : local.m764["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m764["vrf"], null) == null ? [] : local.m764["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
