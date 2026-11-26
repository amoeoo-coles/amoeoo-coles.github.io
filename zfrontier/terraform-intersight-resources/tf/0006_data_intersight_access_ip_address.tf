# Sample data source intersight_access_ip_address — reads ../models/data_intersight_access_ip_address.yml
locals { m006 = yamldecode(file("${path.module}/../models/data_intersight_access_ip_address.yml"))["data_intersight_access_ip_address"] }

data "intersight_access_ip_address" "n006" {
  account_moid = try(local.m006["account_moid"], null)
  additional_properties = try(local.m006["additional_properties"], null)
  class_id = try(local.m006["class_id"], null)
  create_time = try(local.m006["create_time"], null)
  description = try(local.m006["description"], null)
  domain_group_moid = try(local.m006["domain_group_moid"], null)
  id = try(local.m006["id"], null)
  ipv4_address = try(local.m006["ipv4_address"], null)
  ipv6_address = try(local.m006["ipv6_address"], null)
  mod_time = try(local.m006["mod_time"], null)
  moid = try(local.m006["moid"], null)
  name = try(local.m006["name"], null)
  object_type = try(local.m006["object_type"], null)
  oob_ipv4_address = try(local.m006["oob_ipv4_address"], null)
  owners = try(local.m006["owners"], null)
  results = try(local.m006["results"], null)
  shared_scope = try(local.m006["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m006["ancestors"], null) == null ? [] : local.m006["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ipv4_lease" {
    for_each = try(local.m006["ipv4_lease"], null) == null ? [] : local.m006["ipv4_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ipv6_lease" {
    for_each = try(local.m006["ipv6_lease"], null) == null ? [] : local.m006["ipv6_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "oob_ipv4_lease" {
    for_each = try(local.m006["oob_ipv4_lease"], null) == null ? [] : local.m006["oob_ipv4_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m006["parent"], null) == null ? [] : local.m006["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m006["permission_resources"], null) == null ? [] : local.m006["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m006["profile"], null) == null ? [] : local.m006["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m006["tags"], null) == null ? [] : local.m006["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m006["version_context"], null) == null ? [] : local.m006["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
