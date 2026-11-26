# Sample data source intersight_vrf_vrf — reads ../models/data_intersight_vrf_vrf.yml
locals { m1492 = yamldecode(file("${path.module}/../models/data_intersight_vrf_vrf.yml"))["data_intersight_vrf_vrf"] }

data "intersight_vrf_vrf" "n1492" {
  account_moid = try(local.m1492["account_moid"], null)
  additional_properties = try(local.m1492["additional_properties"], null)
  class_id = try(local.m1492["class_id"], null)
  create_time = try(local.m1492["create_time"], null)
  description = try(local.m1492["description"], null)
  domain_group_moid = try(local.m1492["domain_group_moid"], null)
  id = try(local.m1492["id"], null)
  mod_time = try(local.m1492["mod_time"], null)
  moid = try(local.m1492["moid"], null)
  name = try(local.m1492["name"], null)
  object_type = try(local.m1492["object_type"], null)
  owners = try(local.m1492["owners"], null)
  results = try(local.m1492["results"], null)
  shared_scope = try(local.m1492["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1492["account"], null) == null ? [] : local.m1492["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1492["ancestors"], null) == null ? [] : local.m1492["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1492["parent"], null) == null ? [] : local.m1492["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1492["permission_resources"], null) == null ? [] : local.m1492["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1492["tags"], null) == null ? [] : local.m1492["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1492["version_context"], null) == null ? [] : local.m1492["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
