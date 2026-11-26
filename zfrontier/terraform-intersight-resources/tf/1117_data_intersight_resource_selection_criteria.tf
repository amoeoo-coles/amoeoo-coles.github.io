# Sample data source intersight_resource_selection_criteria — reads ../models/data_intersight_resource_selection_criteria.yml
locals { m1117 = yamldecode(file("${path.module}/../models/data_intersight_resource_selection_criteria.yml"))["data_intersight_resource_selection_criteria"] }

data "intersight_resource_selection_criteria" "n1117" {
  account_moid = try(local.m1117["account_moid"], null)
  additional_properties = try(local.m1117["additional_properties"], null)
  class_id = try(local.m1117["class_id"], null)
  create_time = try(local.m1117["create_time"], null)
  description = try(local.m1117["description"], null)
  domain_group_moid = try(local.m1117["domain_group_moid"], null)
  id = try(local.m1117["id"], null)
  mod_time = try(local.m1117["mod_time"], null)
  moid = try(local.m1117["moid"], null)
  name = try(local.m1117["name"], null)
  object_type = try(local.m1117["object_type"], null)
  owners = try(local.m1117["owners"], null)
  place_holders = try(local.m1117["place_holders"], null)
  results = try(local.m1117["results"], null)
  shared_scope = try(local.m1117["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1117["ancestors"], null) == null ? [] : local.m1117["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1117["organization"], null) == null ? [] : local.m1117["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1117["parent"], null) == null ? [] : local.m1117["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1117["permission_resources"], null) == null ? [] : local.m1117["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "selectors" {
    for_each = try(local.m1117["selectors"], null) == null ? [] : local.m1117["selectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1117["tags"], null) == null ? [] : local.m1117["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1117["version_context"], null) == null ? [] : local.m1117["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
