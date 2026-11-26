# Sample data source intersight_fabric_fc_network_policy — reads ../models/data_intersight_fabric_fc_network_policy.yml
locals { m406 = yamldecode(file("${path.module}/../models/data_intersight_fabric_fc_network_policy.yml"))["data_intersight_fabric_fc_network_policy"] }

data "intersight_fabric_fc_network_policy" "n406" {
  account_moid = try(local.m406["account_moid"], null)
  additional_properties = try(local.m406["additional_properties"], null)
  class_id = try(local.m406["class_id"], null)
  create_time = try(local.m406["create_time"], null)
  description = try(local.m406["description"], null)
  domain_group_moid = try(local.m406["domain_group_moid"], null)
  enable_trunking = try(local.m406["enable_trunking"], null)
  id = try(local.m406["id"], null)
  mod_time = try(local.m406["mod_time"], null)
  moid = try(local.m406["moid"], null)
  name = try(local.m406["name"], null)
  object_type = try(local.m406["object_type"], null)
  owners = try(local.m406["owners"], null)
  results = try(local.m406["results"], null)
  shared_scope = try(local.m406["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m406["ancestors"], null) == null ? [] : local.m406["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m406["organization"], null) == null ? [] : local.m406["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m406["parent"], null) == null ? [] : local.m406["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m406["permission_resources"], null) == null ? [] : local.m406["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m406["profiles"], null) == null ? [] : local.m406["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m406["tags"], null) == null ? [] : local.m406["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m406["version_context"], null) == null ? [] : local.m406["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
