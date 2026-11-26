# Sample data source intersight_fcpool_pool — reads ../models/data_intersight_fcpool_pool.yml
locals { m460 = yamldecode(file("${path.module}/../models/data_intersight_fcpool_pool.yml"))["data_intersight_fcpool_pool"] }

data "intersight_fcpool_pool" "n460" {
  account_moid = try(local.m460["account_moid"], null)
  additional_properties = try(local.m460["additional_properties"], null)
  assigned = try(local.m460["assigned"], null)
  assignment_order = try(local.m460["assignment_order"], null)
  class_id = try(local.m460["class_id"], null)
  create_time = try(local.m460["create_time"], null)
  description = try(local.m460["description"], null)
  domain_group_moid = try(local.m460["domain_group_moid"], null)
  id = try(local.m460["id"], null)
  mod_time = try(local.m460["mod_time"], null)
  moid = try(local.m460["moid"], null)
  name = try(local.m460["name"], null)
  object_type = try(local.m460["object_type"], null)
  owners = try(local.m460["owners"], null)
  pool_purpose = try(local.m460["pool_purpose"], null)
  reserved = try(local.m460["reserved"], null)
  results = try(local.m460["results"], null)
  shared_scope = try(local.m460["shared_scope"], null)
  size = try(local.m460["size"], null)
  dynamic "ancestors" {
    for_each = try(local.m460["ancestors"], null) == null ? [] : local.m460["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_heads" {
    for_each = try(local.m460["block_heads"], null) == null ? [] : local.m460["block_heads"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "id_blocks" {
    for_each = try(local.m460["id_blocks"], null) == null ? [] : local.m460["id_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m460["organization"], null) == null ? [] : local.m460["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m460["parent"], null) == null ? [] : local.m460["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m460["permission_resources"], null) == null ? [] : local.m460["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m460["reservations"], null) == null ? [] : local.m460["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m460["tags"], null) == null ? [] : local.m460["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m460["version_context"], null) == null ? [] : local.m460["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
