# Sample data source intersight_iqnpool_pool — reads ../models/data_intersight_iqnpool_pool.yml
locals { m769 = yamldecode(file("${path.module}/../models/data_intersight_iqnpool_pool.yml"))["data_intersight_iqnpool_pool"] }

data "intersight_iqnpool_pool" "n769" {
  account_moid = try(local.m769["account_moid"], null)
  additional_properties = try(local.m769["additional_properties"], null)
  assigned = try(local.m769["assigned"], null)
  assignment_order = try(local.m769["assignment_order"], null)
  class_id = try(local.m769["class_id"], null)
  create_time = try(local.m769["create_time"], null)
  description = try(local.m769["description"], null)
  domain_group_moid = try(local.m769["domain_group_moid"], null)
  id = try(local.m769["id"], null)
  mod_time = try(local.m769["mod_time"], null)
  moid = try(local.m769["moid"], null)
  name = try(local.m769["name"], null)
  object_type = try(local.m769["object_type"], null)
  owners = try(local.m769["owners"], null)
  prefix = try(local.m769["prefix"], null)
  reserved = try(local.m769["reserved"], null)
  results = try(local.m769["results"], null)
  shared_scope = try(local.m769["shared_scope"], null)
  size = try(local.m769["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m769["ancestors"], null) == null ? [] : local.m769["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_heads" {
    for_each = try(local.m769["block_heads"], null) == null ? [] : local.m769["block_heads"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iqn_suffix_blocks" {
    for_each = try(local.m769["iqn_suffix_blocks"], null) == null ? [] : local.m769["iqn_suffix_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m769["organization"], null) == null ? [] : local.m769["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m769["parent"], null) == null ? [] : local.m769["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m769["permission_resources"], null) == null ? [] : local.m769["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m769["reservations"], null) == null ? [] : local.m769["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m769["tags"], null) == null ? [] : local.m769["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m769["version_context"], null) == null ? [] : local.m769["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
