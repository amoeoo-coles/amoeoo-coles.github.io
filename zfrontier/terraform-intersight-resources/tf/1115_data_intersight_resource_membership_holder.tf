# Sample data source intersight_resource_membership_holder — reads ../models/data_intersight_resource_membership_holder.yml
locals { m1115 = yamldecode(file("${path.module}/../models/data_intersight_resource_membership_holder.yml"))["data_intersight_resource_membership_holder"] }

data "intersight_resource_membership_holder" "n1115" {
  account_moid = try(local.m1115["account_moid"], null)
  additional_properties = try(local.m1115["additional_properties"], null)
  class_id = try(local.m1115["class_id"], null)
  create_time = try(local.m1115["create_time"], null)
  domain_group_moid = try(local.m1115["domain_group_moid"], null)
  id = try(local.m1115["id"], null)
  mod_time = try(local.m1115["mod_time"], null)
  moid = try(local.m1115["moid"], null)
  name = try(local.m1115["name"], null)
  object_type = try(local.m1115["object_type"], null)
  owners = try(local.m1115["owners"], null)
  results = try(local.m1115["results"], null)
  shared_scope = try(local.m1115["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1115["account"], null) == null ? [] : local.m1115["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1115["ancestors"], null) == null ? [] : local.m1115["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1115["parent"], null) == null ? [] : local.m1115["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1115["permission_resources"], null) == null ? [] : local.m1115["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1115["tags"], null) == null ? [] : local.m1115["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1115["version_context"], null) == null ? [] : local.m1115["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
