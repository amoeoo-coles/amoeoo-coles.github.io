# Sample data source intersight_ippool_shadow_block — reads ../models/data_intersight_ippool_shadow_block.yml
locals { m762 = yamldecode(file("${path.module}/../models/data_intersight_ippool_shadow_block.yml"))["data_intersight_ippool_shadow_block"] }

data "intersight_ippool_shadow_block" "n762" {
  account_moid = try(local.m762["account_moid"], null)
  additional_properties = try(local.m762["additional_properties"], null)
  class_id = try(local.m762["class_id"], null)
  create_time = try(local.m762["create_time"], null)
  domain_group_moid = try(local.m762["domain_group_moid"], null)
  free_block_count = try(local.m762["free_block_count"], null)
  id = try(local.m762["id"], null)
  ip_type = try(local.m762["ip_type"], null)
  mod_time = try(local.m762["mod_time"], null)
  moid = try(local.m762["moid"], null)
  next_id_allocator = try(local.m762["next_id_allocator"], null)
  object_type = try(local.m762["object_type"], null)
  owners = try(local.m762["owners"], null)
  results = try(local.m762["results"], null)
  shared_scope = try(local.m762["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m762["ancestors"], null) == null ? [] : local.m762["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_mapping_policy" {
    for_each = try(local.m762["id_mapping_policy"], null) == null ? [] : local.m762["id_mapping_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v4_block" {
    for_each = try(local.m762["ip_v4_block"], null) == null ? [] : local.m762["ip_v4_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v6_block" {
    for_each = try(local.m762["ip_v6_block"], null) == null ? [] : local.m762["ip_v6_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m762["parent"], null) == null ? [] : local.m762["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m762["permission_resources"], null) == null ? [] : local.m762["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m762["pool"], null) == null ? [] : local.m762["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m762["reservations"], null) == null ? [] : local.m762["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m762["tags"], null) == null ? [] : local.m762["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m762["version_context"], null) == null ? [] : local.m762["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m762["vrf"], null) == null ? [] : local.m762["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
