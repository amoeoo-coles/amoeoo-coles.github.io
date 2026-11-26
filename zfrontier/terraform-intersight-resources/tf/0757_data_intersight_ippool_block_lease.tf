# Sample data source intersight_ippool_block_lease — reads ../models/data_intersight_ippool_block_lease.yml
locals { m757 = yamldecode(file("${path.module}/../models/data_intersight_ippool_block_lease.yml"))["data_intersight_ippool_block_lease"] }

data "intersight_ippool_block_lease" "n757" {
  account_moid = try(local.m757["account_moid"], null)
  additional_properties = try(local.m757["additional_properties"], null)
  class_id = try(local.m757["class_id"], null)
  create_time = try(local.m757["create_time"], null)
  domain_group_moid = try(local.m757["domain_group_moid"], null)
  id = try(local.m757["id"], null)
  ip_type = try(local.m757["ip_type"], null)
  mod_time = try(local.m757["mod_time"], null)
  moid = try(local.m757["moid"], null)
  nr_count = try(local.m757["nr_count"], null)
  object_type = try(local.m757["object_type"], null)
  owners = try(local.m757["owners"], null)
  results = try(local.m757["results"], null)
  shared_scope = try(local.m757["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m757["ancestors"], null) == null ? [] : local.m757["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m757["assigned_to_entity"], null) == null ? [] : local.m757["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_leases" {
    for_each = try(local.m757["ip_leases"], null) == null ? [] : local.m757["ip_leases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m757["parent"], null) == null ? [] : local.m757["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m757["permission_resources"], null) == null ? [] : local.m757["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m757["pool"], null) == null ? [] : local.m757["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m757["tags"], null) == null ? [] : local.m757["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m757["universe"], null) == null ? [] : local.m757["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m757["version_context"], null) == null ? [] : local.m757["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m757["vrf"], null) == null ? [] : local.m757["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
