# Sample data source intersight_workflow_catalog — reads ../models/data_intersight_workflow_catalog.yml
locals { m1520 = yamldecode(file("${path.module}/../models/data_intersight_workflow_catalog.yml"))["data_intersight_workflow_catalog"] }

data "intersight_workflow_catalog" "n1520" {
  account_moid = try(local.m1520["account_moid"], null)
  additional_properties = try(local.m1520["additional_properties"], null)
  class_id = try(local.m1520["class_id"], null)
  create_time = try(local.m1520["create_time"], null)
  domain_group_moid = try(local.m1520["domain_group_moid"], null)
  id = try(local.m1520["id"], null)
  mod_time = try(local.m1520["mod_time"], null)
  moid = try(local.m1520["moid"], null)
  name = try(local.m1520["name"], null)
  object_type = try(local.m1520["object_type"], null)
  owners = try(local.m1520["owners"], null)
  results = try(local.m1520["results"], null)
  shared_scope = try(local.m1520["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1520["ancestors"], null) == null ? [] : local.m1520["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1520["organization"], null) == null ? [] : local.m1520["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1520["parent"], null) == null ? [] : local.m1520["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1520["permission_resources"], null) == null ? [] : local.m1520["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1520["tags"], null) == null ? [] : local.m1520["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1520["version_context"], null) == null ? [] : local.m1520["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
