# Sample data source intersight_ippool_ip_lease — reads ../models/data_intersight_ippool_ip_lease.yml
locals { m758 = yamldecode(file("${path.module}/../models/data_intersight_ippool_ip_lease.yml"))["data_intersight_ippool_ip_lease"] }

data "intersight_ippool_ip_lease" "n758" {
  account_moid = try(local.m758["account_moid"], null)
  additional_properties = try(local.m758["additional_properties"], null)
  allocation_type = try(local.m758["allocation_type"], null)
  class_id = try(local.m758["class_id"], null)
  create_time = try(local.m758["create_time"], null)
  domain_group_moid = try(local.m758["domain_group_moid"], null)
  has_duplicate = try(local.m758["has_duplicate"], null)
  id = try(local.m758["id"], null)
  ip_type = try(local.m758["ip_type"], null)
  ip_v4_address = try(local.m758["ip_v4_address"], null)
  ip_v6_address = try(local.m758["ip_v6_address"], null)
  migrate = try(local.m758["migrate"], null)
  mod_time = try(local.m758["mod_time"], null)
  moid = try(local.m758["moid"], null)
  object_type = try(local.m758["object_type"], null)
  owners = try(local.m758["owners"], null)
  preferred_ip_v4_address = try(local.m758["preferred_ip_v4_address"], null)
  preferred_ip_v6_address = try(local.m758["preferred_ip_v6_address"], null)
  results = try(local.m758["results"], null)
  shared_scope = try(local.m758["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m758["ancestors"], null) == null ? [] : local.m758["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m758["assigned_to_entity"], null) == null ? [] : local.m758["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_lease" {
    for_each = try(local.m758["block_lease"], null) == null ? [] : local.m758["block_lease"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v4_config" {
    for_each = try(local.m758["ip_v4_config"], null) == null ? [] : local.m758["ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_v6_config" {
    for_each = try(local.m758["ip_v6_config"], null) == null ? [] : local.m758["ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m758["parent"], null) == null ? [] : local.m758["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m758["permission_resources"], null) == null ? [] : local.m758["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m758["pool"], null) == null ? [] : local.m758["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m758["pool_member"], null) == null ? [] : local.m758["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m758["reservation"], null) == null ? [] : local.m758["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m758["tags"], null) == null ? [] : local.m758["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m758["universe"], null) == null ? [] : local.m758["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m758["version_context"], null) == null ? [] : local.m758["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m758["vrf"], null) == null ? [] : local.m758["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
