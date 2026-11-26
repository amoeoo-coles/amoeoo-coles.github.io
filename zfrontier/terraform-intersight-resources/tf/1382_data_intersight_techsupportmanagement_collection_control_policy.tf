# Sample data source intersight_techsupportmanagement_collection_control_policy — reads ../models/data_intersight_techsupportmanagement_collection_control_policy.yml
locals { m1382 = yamldecode(file("${path.module}/../models/data_intersight_techsupportmanagement_collection_control_policy.yml"))["data_intersight_techsupportmanagement_collection_control_policy"] }

data "intersight_techsupportmanagement_collection_control_policy" "n1382" {
  account_moid = try(local.m1382["account_moid"], null)
  additional_properties = try(local.m1382["additional_properties"], null)
  class_id = try(local.m1382["class_id"], null)
  create_time = try(local.m1382["create_time"], null)
  deployment_type = try(local.m1382["deployment_type"], null)
  domain_group_moid = try(local.m1382["domain_group_moid"], null)
  id = try(local.m1382["id"], null)
  mod_time = try(local.m1382["mod_time"], null)
  moid = try(local.m1382["moid"], null)
  object_type = try(local.m1382["object_type"], null)
  owners = try(local.m1382["owners"], null)
  results = try(local.m1382["results"], null)
  shared_scope = try(local.m1382["shared_scope"], null)
  tech_support_collection = try(local.m1382["tech_support_collection"], null)
  dynamic "account" {
    for_each = try(local.m1382["account"], null) == null ? [] : local.m1382["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1382["ancestors"], null) == null ? [] : local.m1382["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1382["parent"], null) == null ? [] : local.m1382["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1382["permission_resources"], null) == null ? [] : local.m1382["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1382["tags"], null) == null ? [] : local.m1382["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1382["version_context"], null) == null ? [] : local.m1382["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
