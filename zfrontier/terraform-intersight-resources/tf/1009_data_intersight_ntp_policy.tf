# Sample data source intersight_ntp_policy — reads ../models/data_intersight_ntp_policy.yml
locals { m1009 = yamldecode(file("${path.module}/../models/data_intersight_ntp_policy.yml"))["data_intersight_ntp_policy"] }

data "intersight_ntp_policy" "n1009" {
  account_moid = try(local.m1009["account_moid"], null)
  additional_properties = try(local.m1009["additional_properties"], null)
  class_id = try(local.m1009["class_id"], null)
  create_time = try(local.m1009["create_time"], null)
  description = try(local.m1009["description"], null)
  domain_group_moid = try(local.m1009["domain_group_moid"], null)
  enabled = try(local.m1009["enabled"], null)
  id = try(local.m1009["id"], null)
  mod_time = try(local.m1009["mod_time"], null)
  moid = try(local.m1009["moid"], null)
  name = try(local.m1009["name"], null)
  ntp_servers = try(local.m1009["ntp_servers"], null)
  object_type = try(local.m1009["object_type"], null)
  owners = try(local.m1009["owners"], null)
  results = try(local.m1009["results"], null)
  shared_scope = try(local.m1009["shared_scope"], null)
  timezone = try(local.m1009["timezone"], null)
  dynamic "ancestors" {
    for_each = try(local.m1009["ancestors"], null) == null ? [] : local.m1009["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "appliance_account" {
    for_each = try(local.m1009["appliance_account"], null) == null ? [] : local.m1009["appliance_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "authenticated_ntp_servers" {
    for_each = try(local.m1009["authenticated_ntp_servers"], null) == null ? [] : local.m1009["authenticated_ntp_servers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1009["organization"], null) == null ? [] : local.m1009["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1009["parent"], null) == null ? [] : local.m1009["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1009["permission_resources"], null) == null ? [] : local.m1009["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1009["profiles"], null) == null ? [] : local.m1009["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1009["tags"], null) == null ? [] : local.m1009["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1009["version_context"], null) == null ? [] : local.m1009["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
