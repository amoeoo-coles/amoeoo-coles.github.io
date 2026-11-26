# Sample data source intersight_fabric_link_control_policy — reads ../models/data_intersight_fabric_link_control_policy.yml
locals { m416 = yamldecode(file("${path.module}/../models/data_intersight_fabric_link_control_policy.yml"))["data_intersight_fabric_link_control_policy"] }

data "intersight_fabric_link_control_policy" "n416" {
  account_moid = try(local.m416["account_moid"], null)
  additional_properties = try(local.m416["additional_properties"], null)
  class_id = try(local.m416["class_id"], null)
  create_time = try(local.m416["create_time"], null)
  description = try(local.m416["description"], null)
  domain_group_moid = try(local.m416["domain_group_moid"], null)
  id = try(local.m416["id"], null)
  mod_time = try(local.m416["mod_time"], null)
  moid = try(local.m416["moid"], null)
  name = try(local.m416["name"], null)
  object_type = try(local.m416["object_type"], null)
  owners = try(local.m416["owners"], null)
  results = try(local.m416["results"], null)
  shared_scope = try(local.m416["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m416["ancestors"], null) == null ? [] : local.m416["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m416["organization"], null) == null ? [] : local.m416["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m416["parent"], null) == null ? [] : local.m416["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m416["permission_resources"], null) == null ? [] : local.m416["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m416["tags"], null) == null ? [] : local.m416["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "udld_settings" {
    for_each = try(local.m416["udld_settings"], null) == null ? [] : local.m416["udld_settings"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m416["version_context"], null) == null ? [] : local.m416["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
