# Sample data source intersight_fcpool_lease — reads ../models/data_intersight_fcpool_lease.yml
locals { m459 = yamldecode(file("${path.module}/../models/data_intersight_fcpool_lease.yml"))["data_intersight_fcpool_lease"] }

data "intersight_fcpool_lease" "n459" {
  account_moid = try(local.m459["account_moid"], null)
  additional_properties = try(local.m459["additional_properties"], null)
  allocation_type = try(local.m459["allocation_type"], null)
  class_id = try(local.m459["class_id"], null)
  create_time = try(local.m459["create_time"], null)
  domain_group_moid = try(local.m459["domain_group_moid"], null)
  has_duplicate = try(local.m459["has_duplicate"], null)
  id = try(local.m459["id"], null)
  migrate = try(local.m459["migrate"], null)
  mod_time = try(local.m459["mod_time"], null)
  moid = try(local.m459["moid"], null)
  object_type = try(local.m459["object_type"], null)
  owners = try(local.m459["owners"], null)
  pool_purpose = try(local.m459["pool_purpose"], null)
  preferred_wwn_id = try(local.m459["preferred_wwn_id"], null)
  results = try(local.m459["results"], null)
  shared_scope = try(local.m459["shared_scope"], null)
  wwn_id = try(local.m459["wwn_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m459["ancestors"], null) == null ? [] : local.m459["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m459["assigned_to_entity"], null) == null ? [] : local.m459["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m459["parent"], null) == null ? [] : local.m459["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m459["permission_resources"], null) == null ? [] : local.m459["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m459["pool"], null) == null ? [] : local.m459["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m459["pool_member"], null) == null ? [] : local.m459["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m459["reservation"], null) == null ? [] : local.m459["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m459["tags"], null) == null ? [] : local.m459["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m459["universe"], null) == null ? [] : local.m459["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m459["version_context"], null) == null ? [] : local.m459["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
