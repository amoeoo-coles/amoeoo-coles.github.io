# Sample data source intersight_iqnpool_block — reads ../models/data_intersight_iqnpool_block.yml
locals { m767 = yamldecode(file("${path.module}/../models/data_intersight_iqnpool_block.yml"))["data_intersight_iqnpool_block"] }

data "intersight_iqnpool_block" "n767" {
  account_moid = try(local.m767["account_moid"], null)
  additional_properties = try(local.m767["additional_properties"], null)
  class_id = try(local.m767["class_id"], null)
  create_time = try(local.m767["create_time"], null)
  domain_group_moid = try(local.m767["domain_group_moid"], null)
  free_block_count = try(local.m767["free_block_count"], null)
  id = try(local.m767["id"], null)
  mod_time = try(local.m767["mod_time"], null)
  moid = try(local.m767["moid"], null)
  next_id_allocator = try(local.m767["next_id_allocator"], null)
  object_type = try(local.m767["object_type"], null)
  owners = try(local.m767["owners"], null)
  prefix = try(local.m767["prefix"], null)
  results = try(local.m767["results"], null)
  shared_scope = try(local.m767["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m767["ancestors"], null) == null ? [] : local.m767["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_mapping_policy" {
    for_each = try(local.m767["id_mapping_policy"], null) == null ? [] : local.m767["id_mapping_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iqn_suffix_block" {
    for_each = try(local.m767["iqn_suffix_block"], null) == null ? [] : local.m767["iqn_suffix_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m767["parent"], null) == null ? [] : local.m767["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m767["permission_resources"], null) == null ? [] : local.m767["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m767["pool"], null) == null ? [] : local.m767["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m767["reservations"], null) == null ? [] : local.m767["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m767["tags"], null) == null ? [] : local.m767["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m767["version_context"], null) == null ? [] : local.m767["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
