# Sample data source intersight_uuidpool_block — reads ../models/data_intersight_uuidpool_block.yml
locals { m1398 = yamldecode(file("${path.module}/../models/data_intersight_uuidpool_block.yml"))["data_intersight_uuidpool_block"] }

data "intersight_uuidpool_block" "n1398" {
  account_moid = try(local.m1398["account_moid"], null)
  additional_properties = try(local.m1398["additional_properties"], null)
  class_id = try(local.m1398["class_id"], null)
  create_time = try(local.m1398["create_time"], null)
  domain_group_moid = try(local.m1398["domain_group_moid"], null)
  free_block_count = try(local.m1398["free_block_count"], null)
  id = try(local.m1398["id"], null)
  mod_time = try(local.m1398["mod_time"], null)
  moid = try(local.m1398["moid"], null)
  next_id_allocator = try(local.m1398["next_id_allocator"], null)
  object_type = try(local.m1398["object_type"], null)
  owners = try(local.m1398["owners"], null)
  prefix = try(local.m1398["prefix"], null)
  results = try(local.m1398["results"], null)
  shared_scope = try(local.m1398["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1398["ancestors"], null) == null ? [] : local.m1398["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_mapping_policy" {
    for_each = try(local.m1398["id_mapping_policy"], null) == null ? [] : local.m1398["id_mapping_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1398["parent"], null) == null ? [] : local.m1398["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1398["permission_resources"], null) == null ? [] : local.m1398["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1398["pool"], null) == null ? [] : local.m1398["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m1398["reservations"], null) == null ? [] : local.m1398["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1398["tags"], null) == null ? [] : local.m1398["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "uuid_suffix_block" {
    for_each = try(local.m1398["uuid_suffix_block"], null) == null ? [] : local.m1398["uuid_suffix_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1398["version_context"], null) == null ? [] : local.m1398["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
