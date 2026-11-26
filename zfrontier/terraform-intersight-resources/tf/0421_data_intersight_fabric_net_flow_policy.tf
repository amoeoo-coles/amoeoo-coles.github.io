# Sample data source intersight_fabric_net_flow_policy — reads ../models/data_intersight_fabric_net_flow_policy.yml
locals { m421 = yamldecode(file("${path.module}/../models/data_intersight_fabric_net_flow_policy.yml"))["data_intersight_fabric_net_flow_policy"] }

data "intersight_fabric_net_flow_policy" "n421" {
  account_moid = try(local.m421["account_moid"], null)
  additional_properties = try(local.m421["additional_properties"], null)
  class_id = try(local.m421["class_id"], null)
  create_time = try(local.m421["create_time"], null)
  description = try(local.m421["description"], null)
  domain_group_moid = try(local.m421["domain_group_moid"], null)
  id = try(local.m421["id"], null)
  mod_time = try(local.m421["mod_time"], null)
  moid = try(local.m421["moid"], null)
  name = try(local.m421["name"], null)
  object_type = try(local.m421["object_type"], null)
  owners = try(local.m421["owners"], null)
  results = try(local.m421["results"], null)
  shared_scope = try(local.m421["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m421["ancestors"], null) == null ? [] : local.m421["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m421["organization"], null) == null ? [] : local.m421["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m421["parent"], null) == null ? [] : local.m421["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m421["permission_resources"], null) == null ? [] : local.m421["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m421["profiles"], null) == null ? [] : local.m421["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m421["tags"], null) == null ? [] : local.m421["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m421["version_context"], null) == null ? [] : local.m421["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
