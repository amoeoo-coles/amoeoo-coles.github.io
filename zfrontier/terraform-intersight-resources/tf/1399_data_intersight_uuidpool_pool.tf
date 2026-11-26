# Sample data source intersight_uuidpool_pool — reads ../models/data_intersight_uuidpool_pool.yml
locals { m1399 = yamldecode(file("${path.module}/../models/data_intersight_uuidpool_pool.yml"))["data_intersight_uuidpool_pool"] }

data "intersight_uuidpool_pool" "n1399" {
  account_moid = try(local.m1399["account_moid"], null)
  additional_properties = try(local.m1399["additional_properties"], null)
  assigned = try(local.m1399["assigned"], null)
  assignment_order = try(local.m1399["assignment_order"], null)
  class_id = try(local.m1399["class_id"], null)
  create_time = try(local.m1399["create_time"], null)
  description = try(local.m1399["description"], null)
  domain_group_moid = try(local.m1399["domain_group_moid"], null)
  id = try(local.m1399["id"], null)
  mod_time = try(local.m1399["mod_time"], null)
  moid = try(local.m1399["moid"], null)
  name = try(local.m1399["name"], null)
  object_type = try(local.m1399["object_type"], null)
  owners = try(local.m1399["owners"], null)
  prefix = try(local.m1399["prefix"], null)
  reserved = try(local.m1399["reserved"], null)
  results = try(local.m1399["results"], null)
  shared_scope = try(local.m1399["shared_scope"], null)
  size = try(local.m1399["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m1399["ancestors"], null) == null ? [] : local.m1399["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_heads" {
    for_each = try(local.m1399["block_heads"], null) == null ? [] : local.m1399["block_heads"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1399["organization"], null) == null ? [] : local.m1399["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1399["parent"], null) == null ? [] : local.m1399["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1399["permission_resources"], null) == null ? [] : local.m1399["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m1399["reservations"], null) == null ? [] : local.m1399["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1399["tags"], null) == null ? [] : local.m1399["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "uuid_suffix_blocks" {
    for_each = try(local.m1399["uuid_suffix_blocks"], null) == null ? [] : local.m1399["uuid_suffix_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1399["version_context"], null) == null ? [] : local.m1399["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
