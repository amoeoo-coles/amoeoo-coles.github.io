# Sample data source intersight_partnerintegration_doc_issues — reads ../models/data_intersight_partnerintegration_doc_issues.yml
locals { m1053 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_doc_issues.yml"))["data_intersight_partnerintegration_doc_issues"] }

data "intersight_partnerintegration_doc_issues" "n1053" {
  account_moid = try(local.m1053["account_moid"], null)
  additional_properties = try(local.m1053["additional_properties"], null)
  class_id = try(local.m1053["class_id"], null)
  create_time = try(local.m1053["create_time"], null)
  documentation_issues = try(local.m1053["documentation_issues"], null)
  domain_group_moid = try(local.m1053["domain_group_moid"], null)
  id = try(local.m1053["id"], null)
  mod_time = try(local.m1053["mod_time"], null)
  moid = try(local.m1053["moid"], null)
  object_type = try(local.m1053["object_type"], null)
  owners = try(local.m1053["owners"], null)
  results = try(local.m1053["results"], null)
  shared_scope = try(local.m1053["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1053["ancestors"], null) == null ? [] : local.m1053["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory" {
    for_each = try(local.m1053["inventory"], null) == null ? [] : local.m1053["inventory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1053["parent"], null) == null ? [] : local.m1053["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1053["permission_resources"], null) == null ? [] : local.m1053["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1053["tags"], null) == null ? [] : local.m1053["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1053["version_context"], null) == null ? [] : local.m1053["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
