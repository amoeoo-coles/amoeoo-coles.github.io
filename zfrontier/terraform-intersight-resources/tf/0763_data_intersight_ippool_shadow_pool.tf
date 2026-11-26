# Sample data source intersight_ippool_shadow_pool — reads ../models/data_intersight_ippool_shadow_pool.yml
locals { m763 = yamldecode(file("${path.module}/../models/data_intersight_ippool_shadow_pool.yml"))["data_intersight_ippool_shadow_pool"] }

data "intersight_ippool_shadow_pool" "n763" {
  account_moid = try(local.m763["account_moid"], null)
  additional_properties = try(local.m763["additional_properties"], null)
  assigned = try(local.m763["assigned"], null)
  assignment_order = try(local.m763["assignment_order"], null)
  class_id = try(local.m763["class_id"], null)
  create_time = try(local.m763["create_time"], null)
  description = try(local.m763["description"], null)
  domain_group_moid = try(local.m763["domain_group_moid"], null)
  id = try(local.m763["id"], null)
  mod_time = try(local.m763["mod_time"], null)
  moid = try(local.m763["moid"], null)
  name = try(local.m763["name"], null)
  object_type = try(local.m763["object_type"], null)
  owners = try(local.m763["owners"], null)
  reserved = try(local.m763["reserved"], null)
  results = try(local.m763["results"], null)
  shared_scope = try(local.m763["shared_scope"], null)
  size = try(local.m763["size"], null)
  v4_assigned = try(local.m763["v4_assigned"], null)
  v4_size = try(local.m763["v4_size"], null)
  v6_assigned = try(local.m763["v6_assigned"], null)
  v6_size = try(local.m763["v6_size"], null)
  dynamic "ancestors" {
    for_each = try(local.m763["ancestors"], null) == null ? [] : local.m763["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_block_heads" {
    for_each = try(local.m763["ip_block_heads"], null) == null ? [] : local.m763["ip_block_heads"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v4_blocks" {
    for_each = try(local.m763["ip_v4_blocks"], null) == null ? [] : local.m763["ip_v4_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v4_config" {
    for_each = try(local.m763["ip_v4_config"], null) == null ? [] : local.m763["ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v6_blocks" {
    for_each = try(local.m763["ip_v6_blocks"], null) == null ? [] : local.m763["ip_v6_blocks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v6_config" {
    for_each = try(local.m763["ip_v6_config"], null) == null ? [] : local.m763["ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m763["parent"], null) == null ? [] : local.m763["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m763["permission_resources"], null) == null ? [] : local.m763["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m763["pool"], null) == null ? [] : local.m763["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservations" {
    for_each = try(local.m763["reservations"], null) == null ? [] : local.m763["reservations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m763["tags"], null) == null ? [] : local.m763["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m763["version_context"], null) == null ? [] : local.m763["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m763["vrf"], null) == null ? [] : local.m763["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
