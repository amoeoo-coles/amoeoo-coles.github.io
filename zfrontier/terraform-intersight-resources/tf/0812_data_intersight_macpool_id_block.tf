# Sample data source intersight_macpool_id_block — reads ../models/data_intersight_macpool_id_block.yml
locals { m812 = yamldecode(file("${path.module}/../models/data_intersight_macpool_id_block.yml"))["data_intersight_macpool_id_block"] }

data "intersight_macpool_id_block" "n812" {
  account_moid = try(local.m812["account_moid"], null)
  additional_properties = try(local.m812["additional_properties"], null)
  class_id = try(local.m812["class_id"], null)
  create_time = try(local.m812["create_time"], null)
  domain_group_moid = try(local.m812["domain_group_moid"], null)
  free_block_count = try(local.m812["free_block_count"], null)
  id = try(local.m812["id"], null)
  mod_time = try(local.m812["mod_time"], null)
  moid = try(local.m812["moid"], null)
  next_id_allocator = try(local.m812["next_id_allocator"], null)
  object_type = try(local.m812["object_type"], null)
  owners = try(local.m812["owners"], null)
  results = try(local.m812["results"], null)
  shared_scope = try(local.m812["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m812["ancestors"], null) == null ? [] : local.m812["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_mapping_policy" {
    for_each = try(local.m812["id_mapping_policy"], null) == null ? [] : local.m812["id_mapping_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_block" {
    for_each = try(local.m812["mac_block"], null) == null ? [] : local.m812["mac_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m812["parent"], null) == null ? [] : local.m812["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m812["permission_resources"], null) == null ? [] : local.m812["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m812["pool"], null) == null ? [] : local.m812["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m812["reservations"], null) == null ? [] : local.m812["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m812["tags"], null) == null ? [] : local.m812["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m812["version_context"], null) == null ? [] : local.m812["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
