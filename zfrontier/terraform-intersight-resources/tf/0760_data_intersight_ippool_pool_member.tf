# Sample data source intersight_ippool_pool_member — reads ../models/data_intersight_ippool_pool_member.yml
locals { m760 = yamldecode(file("${path.module}/../models/data_intersight_ippool_pool_member.yml"))["data_intersight_ippool_pool_member"] }

data "intersight_ippool_pool_member" "n760" {
  account_moid = try(local.m760["account_moid"], null)
  additional_properties = try(local.m760["additional_properties"], null)
  assigned = try(local.m760["assigned"], null)
  assigned_by_another = try(local.m760["assigned_by_another"], null)
  class_id = try(local.m760["class_id"], null)
  create_time = try(local.m760["create_time"], null)
  domain_group_moid = try(local.m760["domain_group_moid"], null)
  id = try(local.m760["id"], null)
  ip_type = try(local.m760["ip_type"], null)
  ip_v4_address = try(local.m760["ip_v4_address"], null)
  ip_v6_address = try(local.m760["ip_v6_address"], null)
  mod_time = try(local.m760["mod_time"], null)
  moid = try(local.m760["moid"], null)
  object_type = try(local.m760["object_type"], null)
  owners = try(local.m760["owners"], null)
  reserved = try(local.m760["reserved"], null)
  results = try(local.m760["results"], null)
  shared_scope = try(local.m760["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m760["ancestors"], null) == null ? [] : local.m760["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m760["assigned_to_entity"], null) == null ? [] : local.m760["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip_block" {
    for_each = try(local.m760["ip_block"], null) == null ? [] : local.m760["ip_block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m760["parent"], null) == null ? [] : local.m760["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer" {
    for_each = try(local.m760["peer"], null) == null ? [] : local.m760["peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m760["permission_resources"], null) == null ? [] : local.m760["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m760["pool"], null) == null ? [] : local.m760["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m760["reservation"], null) == null ? [] : local.m760["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m760["tags"], null) == null ? [] : local.m760["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m760["version_context"], null) == null ? [] : local.m760["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
