# Sample data source intersight_resourcepool_pool_member — reads ../models/data_intersight_resourcepool_pool_member.yml
locals { m1127 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_pool_member.yml"))["data_intersight_resourcepool_pool_member"] }

data "intersight_resourcepool_pool_member" "n1127" {
  account_moid = try(local.m1127["account_moid"], null)
  additional_properties = try(local.m1127["additional_properties"], null)
  assigned = try(local.m1127["assigned"], null)
  class_id = try(local.m1127["class_id"], null)
  create_time = try(local.m1127["create_time"], null)
  domain_group_moid = try(local.m1127["domain_group_moid"], null)
  features = try(local.m1127["features"], null)
  id = try(local.m1127["id"], null)
  mod_time = try(local.m1127["mod_time"], null)
  moid = try(local.m1127["moid"], null)
  object_type = try(local.m1127["object_type"], null)
  owners = try(local.m1127["owners"], null)
  reserved = try(local.m1127["reserved"], null)
  results = try(local.m1127["results"], null)
  shared_scope = try(local.m1127["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1127["ancestors"], null) == null ? [] : local.m1127["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m1127["assigned_to_entity"], null) == null ? [] : local.m1127["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1127["parent"], null) == null ? [] : local.m1127["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer" {
    for_each = try(local.m1127["peer"], null) == null ? [] : local.m1127["peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1127["permission_resources"], null) == null ? [] : local.m1127["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1127["pool"], null) == null ? [] : local.m1127["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualification_type" {
    for_each = try(local.m1127["qualification_type"], null) == null ? [] : local.m1127["qualification_type"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m1127["reservation"], null) == null ? [] : local.m1127["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m1127["resource"], null) == null ? [] : local.m1127["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1127["tags"], null) == null ? [] : local.m1127["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1127["version_context"], null) == null ? [] : local.m1127["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
