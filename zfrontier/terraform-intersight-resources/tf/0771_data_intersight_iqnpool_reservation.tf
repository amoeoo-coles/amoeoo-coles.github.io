# Sample data source intersight_iqnpool_reservation — reads ../models/data_intersight_iqnpool_reservation.yml
locals { m771 = yamldecode(file("${path.module}/../models/data_intersight_iqnpool_reservation.yml"))["data_intersight_iqnpool_reservation"] }

data "intersight_iqnpool_reservation" "n771" {
  account_moid = try(local.m771["account_moid"], null)
  additional_properties = try(local.m771["additional_properties"], null)
  allocation_type = try(local.m771["allocation_type"], null)
  class_id = try(local.m771["class_id"], null)
  create_time = try(local.m771["create_time"], null)
  domain_group_moid = try(local.m771["domain_group_moid"], null)
  id = try(local.m771["id"], null)
  identity = try(local.m771["identity"], null)
  iqn_number = try(local.m771["iqn_number"], null)
  iqn_prefix = try(local.m771["iqn_prefix"], null)
  iqn_suffix = try(local.m771["iqn_suffix"], null)
  mod_time = try(local.m771["mod_time"], null)
  moid = try(local.m771["moid"], null)
  object_type = try(local.m771["object_type"], null)
  owners = try(local.m771["owners"], null)
  results = try(local.m771["results"], null)
  shared_scope = try(local.m771["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m771["ancestors"], null) == null ? [] : local.m771["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block" {
    for_each = try(local.m771["block"], null) == null ? [] : local.m771["block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m771["organization"], null) == null ? [] : local.m771["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m771["parent"], null) == null ? [] : local.m771["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m771["permission_resources"], null) == null ? [] : local.m771["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m771["pool"], null) == null ? [] : local.m771["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m771["pool_member"], null) == null ? [] : local.m771["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m771["tags"], null) == null ? [] : local.m771["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m771["universe"], null) == null ? [] : local.m771["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m771["version_context"], null) == null ? [] : local.m771["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
