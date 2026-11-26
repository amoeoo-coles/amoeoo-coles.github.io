# Sample data source intersight_resource_license_resource_count — reads ../models/data_intersight_resource_license_resource_count.yml
locals { m1113 = yamldecode(file("${path.module}/../models/data_intersight_resource_license_resource_count.yml"))["data_intersight_resource_license_resource_count"] }

data "intersight_resource_license_resource_count" "n1113" {
  account_moid = try(local.m1113["account_moid"], null)
  additional_properties = try(local.m1113["additional_properties"], null)
  class_id = try(local.m1113["class_id"], null)
  create_time = try(local.m1113["create_time"], null)
  domain_group_moid = try(local.m1113["domain_group_moid"], null)
  id = try(local.m1113["id"], null)
  license_type = try(local.m1113["license_type"], null)
  mod_time = try(local.m1113["mod_time"], null)
  moid = try(local.m1113["moid"], null)
  object_type = try(local.m1113["object_type"], null)
  owners = try(local.m1113["owners"], null)
  resource_count = try(local.m1113["resource_count"], null)
  results = try(local.m1113["results"], null)
  shared_scope = try(local.m1113["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1113["account"], null) == null ? [] : local.m1113["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1113["ancestors"], null) == null ? [] : local.m1113["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_groups" {
    for_each = try(local.m1113["license_groups"], null) == null ? [] : local.m1113["license_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1113["parent"], null) == null ? [] : local.m1113["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1113["permission_resources"], null) == null ? [] : local.m1113["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1113["tags"], null) == null ? [] : local.m1113["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1113["version_context"], null) == null ? [] : local.m1113["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
