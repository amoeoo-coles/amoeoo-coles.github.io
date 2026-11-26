# Sample data source intersight_fabric_port_policy — reads ../models/data_intersight_fabric_port_policy.yml
locals { m427 = yamldecode(file("${path.module}/../models/data_intersight_fabric_port_policy.yml"))["data_intersight_fabric_port_policy"] }

data "intersight_fabric_port_policy" "n427" {
  account_moid = try(local.m427["account_moid"], null)
  additional_properties = try(local.m427["additional_properties"], null)
  class_id = try(local.m427["class_id"], null)
  create_time = try(local.m427["create_time"], null)
  description = try(local.m427["description"], null)
  device_model = try(local.m427["device_model"], null)
  domain_group_moid = try(local.m427["domain_group_moid"], null)
  id = try(local.m427["id"], null)
  mod_time = try(local.m427["mod_time"], null)
  moid = try(local.m427["moid"], null)
  name = try(local.m427["name"], null)
  object_type = try(local.m427["object_type"], null)
  owners = try(local.m427["owners"], null)
  results = try(local.m427["results"], null)
  shared_scope = try(local.m427["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m427["ancestors"], null) == null ? [] : local.m427["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m427["organization"], null) == null ? [] : local.m427["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m427["parent"], null) == null ? [] : local.m427["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m427["permission_resources"], null) == null ? [] : local.m427["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m427["profiles"], null) == null ? [] : local.m427["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m427["tags"], null) == null ? [] : local.m427["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m427["version_context"], null) == null ? [] : local.m427["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
