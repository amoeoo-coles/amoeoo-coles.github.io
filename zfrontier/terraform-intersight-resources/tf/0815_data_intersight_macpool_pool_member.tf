# Sample data source intersight_macpool_pool_member — reads ../models/data_intersight_macpool_pool_member.yml
locals { m815 = yamldecode(file("${path.module}/../models/data_intersight_macpool_pool_member.yml"))["data_intersight_macpool_pool_member"] }

data "intersight_macpool_pool_member" "n815" {
  account_moid = try(local.m815["account_moid"], null)
  additional_properties = try(local.m815["additional_properties"], null)
  assigned = try(local.m815["assigned"], null)
  assigned_by_another = try(local.m815["assigned_by_another"], null)
  class_id = try(local.m815["class_id"], null)
  create_time = try(local.m815["create_time"], null)
  domain_group_moid = try(local.m815["domain_group_moid"], null)
  id = try(local.m815["id"], null)
  mac_address = try(local.m815["mac_address"], null)
  mod_time = try(local.m815["mod_time"], null)
  moid = try(local.m815["moid"], null)
  object_type = try(local.m815["object_type"], null)
  owners = try(local.m815["owners"], null)
  reserved = try(local.m815["reserved"], null)
  results = try(local.m815["results"], null)
  shared_scope = try(local.m815["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m815["ancestors"], null) == null ? [] : local.m815["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m815["assigned_to_entity"], null) == null ? [] : local.m815["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_head" {
    for_each = try(local.m815["block_head"], null) == null ? [] : local.m815["block_head"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m815["parent"], null) == null ? [] : local.m815["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer" {
    for_each = try(local.m815["peer"], null) == null ? [] : local.m815["peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m815["permission_resources"], null) == null ? [] : local.m815["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m815["pool"], null) == null ? [] : local.m815["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m815["reservation"], null) == null ? [] : local.m815["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m815["tags"], null) == null ? [] : local.m815["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m815["version_context"], null) == null ? [] : local.m815["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
