# Sample data source intersight_fcpool_fc_block — reads ../models/data_intersight_fcpool_fc_block.yml
locals { m458 = yamldecode(file("${path.module}/../models/data_intersight_fcpool_fc_block.yml"))["data_intersight_fcpool_fc_block"] }

data "intersight_fcpool_fc_block" "n458" {
  account_moid = try(local.m458["account_moid"], null)
  additional_properties = try(local.m458["additional_properties"], null)
  class_id = try(local.m458["class_id"], null)
  create_time = try(local.m458["create_time"], null)
  domain_group_moid = try(local.m458["domain_group_moid"], null)
  free_block_count = try(local.m458["free_block_count"], null)
  id = try(local.m458["id"], null)
  mod_time = try(local.m458["mod_time"], null)
  moid = try(local.m458["moid"], null)
  next_id_allocator = try(local.m458["next_id_allocator"], null)
  object_type = try(local.m458["object_type"], null)
  owners = try(local.m458["owners"], null)
  results = try(local.m458["results"], null)
  shared_scope = try(local.m458["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m458["ancestors"], null) == null ? [] : local.m458["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_block" {
    for_each = try(local.m458["id_block"], null) == null ? [] : local.m458["id_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_mapping_policy" {
    for_each = try(local.m458["id_mapping_policy"], null) == null ? [] : local.m458["id_mapping_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m458["parent"], null) == null ? [] : local.m458["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m458["permission_resources"], null) == null ? [] : local.m458["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m458["pool"], null) == null ? [] : local.m458["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m458["reservations"], null) == null ? [] : local.m458["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m458["tags"], null) == null ? [] : local.m458["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m458["version_context"], null) == null ? [] : local.m458["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
