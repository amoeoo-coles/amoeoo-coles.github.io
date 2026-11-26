# Sample data source intersight_ippool_reservation — reads ../models/data_intersight_ippool_reservation.yml
locals { m761 = yamldecode(file("${path.module}/../models/data_intersight_ippool_reservation.yml"))["data_intersight_ippool_reservation"] }

data "intersight_ippool_reservation" "n761" {
  account_moid = try(local.m761["account_moid"], null)
  additional_properties = try(local.m761["additional_properties"], null)
  allocation_type = try(local.m761["allocation_type"], null)
  class_id = try(local.m761["class_id"], null)
  create_time = try(local.m761["create_time"], null)
  domain_group_moid = try(local.m761["domain_group_moid"], null)
  id = try(local.m761["id"], null)
  identity = try(local.m761["identity"], null)
  ip_type = try(local.m761["ip_type"], null)
  ip_v4_address = try(local.m761["ip_v4_address"], null)
  ip_v6_address = try(local.m761["ip_v6_address"], null)
  mod_time = try(local.m761["mod_time"], null)
  moid = try(local.m761["moid"], null)
  object_type = try(local.m761["object_type"], null)
  owners = try(local.m761["owners"], null)
  results = try(local.m761["results"], null)
  shared_scope = try(local.m761["shared_scope"], null)
  vrf_moid = try(local.m761["vrf_moid"], null)
  dynamic "ancestors" {
    for_each = try(local.m761["ancestors"], null) == null ? [] : local.m761["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_head" {
    for_each = try(local.m761["block_head"], null) == null ? [] : local.m761["block_head"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m761["organization"], null) == null ? [] : local.m761["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m761["parent"], null) == null ? [] : local.m761["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m761["permission_resources"], null) == null ? [] : local.m761["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m761["pool"], null) == null ? [] : local.m761["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m761["pool_member"], null) == null ? [] : local.m761["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "shadow_pool" {
    for_each = try(local.m761["shadow_pool"], null) == null ? [] : local.m761["shadow_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m761["tags"], null) == null ? [] : local.m761["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m761["universe"], null) == null ? [] : local.m761["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m761["version_context"], null) == null ? [] : local.m761["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vrf" {
    for_each = try(local.m761["vrf"], null) == null ? [] : local.m761["vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
