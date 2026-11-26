# Sample data source intersight_macpool_pool — reads ../models/data_intersight_macpool_pool.yml
locals { m814 = yamldecode(file("${path.module}/../models/data_intersight_macpool_pool.yml"))["data_intersight_macpool_pool"] }

data "intersight_macpool_pool" "n814" {
  account_moid = try(local.m814["account_moid"], null)
  additional_properties = try(local.m814["additional_properties"], null)
  assigned = try(local.m814["assigned"], null)
  assignment_order = try(local.m814["assignment_order"], null)
  class_id = try(local.m814["class_id"], null)
  create_time = try(local.m814["create_time"], null)
  description = try(local.m814["description"], null)
  domain_group_moid = try(local.m814["domain_group_moid"], null)
  id = try(local.m814["id"], null)
  mod_time = try(local.m814["mod_time"], null)
  moid = try(local.m814["moid"], null)
  name = try(local.m814["name"], null)
  object_type = try(local.m814["object_type"], null)
  owners = try(local.m814["owners"], null)
  reserved = try(local.m814["reserved"], null)
  results = try(local.m814["results"], null)
  shared_scope = try(local.m814["shared_scope"], null)
  size = try(local.m814["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m814["ancestors"], null) == null ? [] : local.m814["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_heads" {
    for_each = try(local.m814["block_heads"], null) == null ? [] : local.m814["block_heads"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mac_blocks" {
    for_each = try(local.m814["mac_blocks"], null) == null ? [] : local.m814["mac_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m814["organization"], null) == null ? [] : local.m814["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m814["parent"], null) == null ? [] : local.m814["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m814["permission_resources"], null) == null ? [] : local.m814["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m814["reservations"], null) == null ? [] : local.m814["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m814["tags"], null) == null ? [] : local.m814["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m814["version_context"], null) == null ? [] : local.m814["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
