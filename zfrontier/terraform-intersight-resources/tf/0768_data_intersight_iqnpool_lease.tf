# Sample data source intersight_iqnpool_lease — reads ../models/data_intersight_iqnpool_lease.yml
locals { m768 = yamldecode(file("${path.module}/../models/data_intersight_iqnpool_lease.yml"))["data_intersight_iqnpool_lease"] }

data "intersight_iqnpool_lease" "n768" {
  account_moid = try(local.m768["account_moid"], null)
  additional_properties = try(local.m768["additional_properties"], null)
  allocation_type = try(local.m768["allocation_type"], null)
  class_id = try(local.m768["class_id"], null)
  create_time = try(local.m768["create_time"], null)
  domain_group_moid = try(local.m768["domain_group_moid"], null)
  has_duplicate = try(local.m768["has_duplicate"], null)
  id = try(local.m768["id"], null)
  iqn_address = try(local.m768["iqn_address"], null)
  iqn_number = try(local.m768["iqn_number"], null)
  iqn_prefix = try(local.m768["iqn_prefix"], null)
  iqn_suffix = try(local.m768["iqn_suffix"], null)
  migrate = try(local.m768["migrate"], null)
  mod_time = try(local.m768["mod_time"], null)
  moid = try(local.m768["moid"], null)
  object_type = try(local.m768["object_type"], null)
  owners = try(local.m768["owners"], null)
  preferred_iqn_address = try(local.m768["preferred_iqn_address"], null)
  results = try(local.m768["results"], null)
  shared_scope = try(local.m768["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m768["ancestors"], null) == null ? [] : local.m768["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m768["assigned_to_entity"], null) == null ? [] : local.m768["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m768["parent"], null) == null ? [] : local.m768["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m768["permission_resources"], null) == null ? [] : local.m768["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m768["pool"], null) == null ? [] : local.m768["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m768["pool_member"], null) == null ? [] : local.m768["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m768["reservation"], null) == null ? [] : local.m768["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m768["tags"], null) == null ? [] : local.m768["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m768["universe"], null) == null ? [] : local.m768["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m768["version_context"], null) == null ? [] : local.m768["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
