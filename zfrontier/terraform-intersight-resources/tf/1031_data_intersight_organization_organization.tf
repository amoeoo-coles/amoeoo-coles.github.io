# Sample data source intersight_organization_organization — reads ../models/data_intersight_organization_organization.yml
locals { m1031 = yamldecode(file("${path.module}/../models/data_intersight_organization_organization.yml"))["data_intersight_organization_organization"] }

data "intersight_organization_organization" "n1031" {
  account_moid = try(local.m1031["account_moid"], null)
  additional_properties = try(local.m1031["additional_properties"], null)
  class_id = try(local.m1031["class_id"], null)
  create_time = try(local.m1031["create_time"], null)
  description = try(local.m1031["description"], null)
  domain_group_moid = try(local.m1031["domain_group_moid"], null)
  id = try(local.m1031["id"], null)
  mod_time = try(local.m1031["mod_time"], null)
  moid = try(local.m1031["moid"], null)
  name = try(local.m1031["name"], null)
  object_type = try(local.m1031["object_type"], null)
  owners = try(local.m1031["owners"], null)
  results = try(local.m1031["results"], null)
  shared_scope = try(local.m1031["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1031["account"], null) == null ? [] : local.m1031["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1031["ancestors"], null) == null ? [] : local.m1031["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1031["parent"], null) == null ? [] : local.m1031["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1031["permission_resources"], null) == null ? [] : local.m1031["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_groups" {
    for_each = try(local.m1031["resource_groups"], null) == null ? [] : local.m1031["resource_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shared_with_resources" {
    for_each = try(local.m1031["shared_with_resources"], null) == null ? [] : local.m1031["shared_with_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1031["tags"], null) == null ? [] : local.m1031["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1031["version_context"], null) == null ? [] : local.m1031["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
