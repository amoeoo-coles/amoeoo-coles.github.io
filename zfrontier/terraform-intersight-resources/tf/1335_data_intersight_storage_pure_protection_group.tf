# Sample data source intersight_storage_pure_protection_group — reads ../models/data_intersight_storage_pure_protection_group.yml
locals { m1335 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_protection_group.yml"))["data_intersight_storage_pure_protection_group"] }

data "intersight_storage_pure_protection_group" "n1335" {
  account_moid = try(local.m1335["account_moid"], null)
  additional_properties = try(local.m1335["additional_properties"], null)
  class_id = try(local.m1335["class_id"], null)
  create_time = try(local.m1335["create_time"], null)
  domain_group_moid = try(local.m1335["domain_group_moid"], null)
  id = try(local.m1335["id"], null)
  mod_time = try(local.m1335["mod_time"], null)
  moid = try(local.m1335["moid"], null)
  name = try(local.m1335["name"], null)
  nr_source = try(local.m1335["nr_source"], null)
  object_type = try(local.m1335["object_type"], null)
  owners = try(local.m1335["owners"], null)
  pod_name = try(local.m1335["pod_name"], null)
  prefix = try(local.m1335["prefix"], null)
  realm_name = try(local.m1335["realm_name"], null)
  replication_enabled = try(local.m1335["replication_enabled"], null)
  results = try(local.m1335["results"], null)
  shared_scope = try(local.m1335["shared_scope"], null)
  size = try(local.m1335["size"], null)
  snapshot_enabled = try(local.m1335["snapshot_enabled"], null)
  targets = try(local.m1335["targets"], null)
  dynamic "ancestors" {
    for_each = try(local.m1335["ancestors"], null) == null ? [] : local.m1335["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1335["array"], null) == null ? [] : local.m1335["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_groups" {
    for_each = try(local.m1335["host_groups"], null) == null ? [] : local.m1335["host_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hosts" {
    for_each = try(local.m1335["hosts"], null) == null ? [] : local.m1335["hosts"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1335["parent"], null) == null ? [] : local.m1335["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1335["permission_resources"], null) == null ? [] : local.m1335["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod" {
    for_each = try(local.m1335["pod"], null) == null ? [] : local.m1335["pod"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "realm" {
    for_each = try(local.m1335["realm"], null) == null ? [] : local.m1335["realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1335["registered_device"], null) == null ? [] : local.m1335["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1335["tags"], null) == null ? [] : local.m1335["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1335["version_context"], null) == null ? [] : local.m1335["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volumes" {
    for_each = try(local.m1335["volumes"], null) == null ? [] : local.m1335["volumes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
