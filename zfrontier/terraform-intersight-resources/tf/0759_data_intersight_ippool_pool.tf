# Sample data source intersight_ippool_pool — reads ../models/data_intersight_ippool_pool.yml
locals { m759 = yamldecode(file("${path.module}/../models/data_intersight_ippool_pool.yml"))["data_intersight_ippool_pool"] }

data "intersight_ippool_pool" "n759" {
  account_moid = try(local.m759["account_moid"], null)
  additional_properties = try(local.m759["additional_properties"], null)
  assigned = try(local.m759["assigned"], null)
  assignment_order = try(local.m759["assignment_order"], null)
  class_id = try(local.m759["class_id"], null)
  create_time = try(local.m759["create_time"], null)
  description = try(local.m759["description"], null)
  domain_group_moid = try(local.m759["domain_group_moid"], null)
  enable_block_level_subnet_config = try(local.m759["enable_block_level_subnet_config"], null)
  id = try(local.m759["id"], null)
  mod_time = try(local.m759["mod_time"], null)
  moid = try(local.m759["moid"], null)
  name = try(local.m759["name"], null)
  object_type = try(local.m759["object_type"], null)
  owners = try(local.m759["owners"], null)
  reserved = try(local.m759["reserved"], null)
  results = try(local.m759["results"], null)
  shared_scope = try(local.m759["shared_scope"], null)
  size = try(local.m759["size"], null)
  v4_assigned = try(local.m759["v4_assigned"], null)
  v4_size = try(local.m759["v4_size"], null)
  v6_assigned = try(local.m759["v6_assigned"], null)
  v6_size = try(local.m759["v6_size"], null)
  dynamic "ancestors" {
    for_each = try(local.m759["ancestors"], null) == null ? [] : local.m759["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v4_blocks" {
    for_each = try(local.m759["ip_v4_blocks"], null) == null ? [] : local.m759["ip_v4_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v4_config" {
    for_each = try(local.m759["ip_v4_config"], null) == null ? [] : local.m759["ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v6_blocks" {
    for_each = try(local.m759["ip_v6_blocks"], null) == null ? [] : local.m759["ip_v6_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v6_config" {
    for_each = try(local.m759["ip_v6_config"], null) == null ? [] : local.m759["ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m759["organization"], null) == null ? [] : local.m759["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m759["parent"], null) == null ? [] : local.m759["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m759["permission_resources"], null) == null ? [] : local.m759["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m759["reservations"], null) == null ? [] : local.m759["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shadow_pools" {
    for_each = try(local.m759["shadow_pools"], null) == null ? [] : local.m759["shadow_pools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m759["tags"], null) == null ? [] : local.m759["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m759["version_context"], null) == null ? [] : local.m759["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
