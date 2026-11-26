# Sample data source intersight_uuidpool_uuid_lease — reads ../models/data_intersight_uuidpool_uuid_lease.yml
locals { m1403 = yamldecode(file("${path.module}/../models/data_intersight_uuidpool_uuid_lease.yml"))["data_intersight_uuidpool_uuid_lease"] }

data "intersight_uuidpool_uuid_lease" "n1403" {
  account_moid = try(local.m1403["account_moid"], null)
  additional_properties = try(local.m1403["additional_properties"], null)
  allocation_type = try(local.m1403["allocation_type"], null)
  class_id = try(local.m1403["class_id"], null)
  create_time = try(local.m1403["create_time"], null)
  domain_group_moid = try(local.m1403["domain_group_moid"], null)
  has_duplicate = try(local.m1403["has_duplicate"], null)
  id = try(local.m1403["id"], null)
  migrate = try(local.m1403["migrate"], null)
  mod_time = try(local.m1403["mod_time"], null)
  moid = try(local.m1403["moid"], null)
  object_type = try(local.m1403["object_type"], null)
  owners = try(local.m1403["owners"], null)
  preferred_uuid = try(local.m1403["preferred_uuid"], null)
  results = try(local.m1403["results"], null)
  shared_scope = try(local.m1403["shared_scope"], null)
  uuid = try(local.m1403["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1403["ancestors"], null) == null ? [] : local.m1403["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m1403["assigned_to_entity"], null) == null ? [] : local.m1403["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1403["parent"], null) == null ? [] : local.m1403["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1403["permission_resources"], null) == null ? [] : local.m1403["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1403["pool"], null) == null ? [] : local.m1403["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m1403["pool_member"], null) == null ? [] : local.m1403["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m1403["reservation"], null) == null ? [] : local.m1403["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1403["tags"], null) == null ? [] : local.m1403["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m1403["universe"], null) == null ? [] : local.m1403["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1403["version_context"], null) == null ? [] : local.m1403["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
