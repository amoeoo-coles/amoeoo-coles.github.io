# Sample data source intersight_fabric_link_aggregation_policy — reads ../models/data_intersight_fabric_link_aggregation_policy.yml
locals { m415 = yamldecode(file("${path.module}/../models/data_intersight_fabric_link_aggregation_policy.yml"))["data_intersight_fabric_link_aggregation_policy"] }

data "intersight_fabric_link_aggregation_policy" "n415" {
  account_moid = try(local.m415["account_moid"], null)
  additional_properties = try(local.m415["additional_properties"], null)
  class_id = try(local.m415["class_id"], null)
  create_time = try(local.m415["create_time"], null)
  description = try(local.m415["description"], null)
  domain_group_moid = try(local.m415["domain_group_moid"], null)
  id = try(local.m415["id"], null)
  lacp_rate = try(local.m415["lacp_rate"], null)
  mod_time = try(local.m415["mod_time"], null)
  moid = try(local.m415["moid"], null)
  name = try(local.m415["name"], null)
  object_type = try(local.m415["object_type"], null)
  owners = try(local.m415["owners"], null)
  results = try(local.m415["results"], null)
  shared_scope = try(local.m415["shared_scope"], null)
  suspend_individual = try(local.m415["suspend_individual"], null)
  dynamic "ancestors" {
    for_each = try(local.m415["ancestors"], null) == null ? [] : local.m415["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m415["organization"], null) == null ? [] : local.m415["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m415["parent"], null) == null ? [] : local.m415["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m415["permission_resources"], null) == null ? [] : local.m415["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m415["tags"], null) == null ? [] : local.m415["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m415["version_context"], null) == null ? [] : local.m415["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
