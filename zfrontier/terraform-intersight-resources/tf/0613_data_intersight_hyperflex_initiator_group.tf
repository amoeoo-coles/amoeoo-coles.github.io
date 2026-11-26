# Sample data source intersight_hyperflex_initiator_group — reads ../models/data_intersight_hyperflex_initiator_group.yml
locals { m613 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_initiator_group.yml"))["data_intersight_hyperflex_initiator_group"] }

data "intersight_hyperflex_initiator_group" "n613" {
  account_moid = try(local.m613["account_moid"], null)
  additional_properties = try(local.m613["additional_properties"], null)
  class_id = try(local.m613["class_id"], null)
  create_time = try(local.m613["create_time"], null)
  description = try(local.m613["description"], null)
  domain_group_moid = try(local.m613["domain_group_moid"], null)
  id = try(local.m613["id"], null)
  initiator_count = try(local.m613["initiator_count"], null)
  inventory_source = try(local.m613["inventory_source"], null)
  mod_time = try(local.m613["mod_time"], null)
  moid = try(local.m613["moid"], null)
  name = try(local.m613["name"], null)
  nr_version = try(local.m613["nr_version"], null)
  object_type = try(local.m613["object_type"], null)
  owners = try(local.m613["owners"], null)
  results = try(local.m613["results"], null)
  shared_scope = try(local.m613["shared_scope"], null)
  target_uuids = try(local.m613["target_uuids"], null)
  uuid = try(local.m613["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m613["ancestors"], null) == null ? [] : local.m613["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m613["cluster"], null) == null ? [] : local.m613["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiators" {
    for_each = try(local.m613["initiators"], null) == null ? [] : local.m613["initiators"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m613["parent"], null) == null ? [] : local.m613["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m613["permission_resources"], null) == null ? [] : local.m613["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m613["storage_utilization"], null) == null ? [] : local.m613["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m613["tags"], null) == null ? [] : local.m613["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "targets" {
    for_each = try(local.m613["targets"], null) == null ? [] : local.m613["targets"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m613["version_context"], null) == null ? [] : local.m613["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
