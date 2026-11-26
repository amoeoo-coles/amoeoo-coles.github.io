# Sample data source intersight_uuidpool_pool_member — reads ../models/data_intersight_uuidpool_pool_member.yml
locals { m1400 = yamldecode(file("${path.module}/../models/data_intersight_uuidpool_pool_member.yml"))["data_intersight_uuidpool_pool_member"] }

data "intersight_uuidpool_pool_member" "n1400" {
  account_moid = try(local.m1400["account_moid"], null)
  additional_properties = try(local.m1400["additional_properties"], null)
  assigned = try(local.m1400["assigned"], null)
  assigned_by_another = try(local.m1400["assigned_by_another"], null)
  class_id = try(local.m1400["class_id"], null)
  create_time = try(local.m1400["create_time"], null)
  domain_group_moid = try(local.m1400["domain_group_moid"], null)
  id = try(local.m1400["id"], null)
  mod_time = try(local.m1400["mod_time"], null)
  moid = try(local.m1400["moid"], null)
  object_type = try(local.m1400["object_type"], null)
  owners = try(local.m1400["owners"], null)
  reserved = try(local.m1400["reserved"], null)
  results = try(local.m1400["results"], null)
  shared_scope = try(local.m1400["shared_scope"], null)
  uuid = try(local.m1400["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1400["ancestors"], null) == null ? [] : local.m1400["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m1400["assigned_to_entity"], null) == null ? [] : local.m1400["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_head" {
    for_each = try(local.m1400["block_head"], null) == null ? [] : local.m1400["block_head"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1400["parent"], null) == null ? [] : local.m1400["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer" {
    for_each = try(local.m1400["peer"], null) == null ? [] : local.m1400["peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1400["permission_resources"], null) == null ? [] : local.m1400["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1400["pool"], null) == null ? [] : local.m1400["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m1400["reservation"], null) == null ? [] : local.m1400["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1400["tags"], null) == null ? [] : local.m1400["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1400["version_context"], null) == null ? [] : local.m1400["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
