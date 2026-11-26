# Sample data source intersight_tam_advisory_count — reads ../models/data_intersight_tam_advisory_count.yml
locals { m1359 = yamldecode(file("${path.module}/../models/data_intersight_tam_advisory_count.yml"))["data_intersight_tam_advisory_count"] }

data "intersight_tam_advisory_count" "n1359" {
  account_moid = try(local.m1359["account_moid"], null)
  additional_properties = try(local.m1359["additional_properties"], null)
  advisory_count = try(local.m1359["advisory_count"], null)
  class_id = try(local.m1359["class_id"], null)
  create_time = try(local.m1359["create_time"], null)
  domain_group_moid = try(local.m1359["domain_group_moid"], null)
  id = try(local.m1359["id"], null)
  mod_time = try(local.m1359["mod_time"], null)
  moid = try(local.m1359["moid"], null)
  object_type = try(local.m1359["object_type"], null)
  owners = try(local.m1359["owners"], null)
  results = try(local.m1359["results"], null)
  shared_scope = try(local.m1359["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1359["account"], null) == null ? [] : local.m1359["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1359["ancestors"], null) == null ? [] : local.m1359["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1359["parent"], null) == null ? [] : local.m1359["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1359["permission_resources"], null) == null ? [] : local.m1359["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1359["tags"], null) == null ? [] : local.m1359["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1359["version_context"], null) == null ? [] : local.m1359["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
