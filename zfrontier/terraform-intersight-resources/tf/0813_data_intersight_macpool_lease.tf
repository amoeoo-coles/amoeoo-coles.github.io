# Sample data source intersight_macpool_lease — reads ../models/data_intersight_macpool_lease.yml
locals { m813 = yamldecode(file("${path.module}/../models/data_intersight_macpool_lease.yml"))["data_intersight_macpool_lease"] }

data "intersight_macpool_lease" "n813" {
  account_moid = try(local.m813["account_moid"], null)
  additional_properties = try(local.m813["additional_properties"], null)
  allocation_type = try(local.m813["allocation_type"], null)
  class_id = try(local.m813["class_id"], null)
  create_time = try(local.m813["create_time"], null)
  domain_group_moid = try(local.m813["domain_group_moid"], null)
  has_duplicate = try(local.m813["has_duplicate"], null)
  id = try(local.m813["id"], null)
  mac_address = try(local.m813["mac_address"], null)
  migrate = try(local.m813["migrate"], null)
  mod_time = try(local.m813["mod_time"], null)
  moid = try(local.m813["moid"], null)
  object_type = try(local.m813["object_type"], null)
  owners = try(local.m813["owners"], null)
  preferred_mac_address = try(local.m813["preferred_mac_address"], null)
  results = try(local.m813["results"], null)
  shared_scope = try(local.m813["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m813["ancestors"], null) == null ? [] : local.m813["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m813["assigned_to_entity"], null) == null ? [] : local.m813["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m813["parent"], null) == null ? [] : local.m813["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m813["permission_resources"], null) == null ? [] : local.m813["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m813["pool"], null) == null ? [] : local.m813["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m813["pool_member"], null) == null ? [] : local.m813["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m813["reservation"], null) == null ? [] : local.m813["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m813["tags"], null) == null ? [] : local.m813["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m813["universe"], null) == null ? [] : local.m813["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m813["version_context"], null) == null ? [] : local.m813["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
