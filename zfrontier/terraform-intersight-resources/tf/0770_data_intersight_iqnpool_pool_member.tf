# Sample data source intersight_iqnpool_pool_member — reads ../models/data_intersight_iqnpool_pool_member.yml
locals { m770 = yamldecode(file("${path.module}/../models/data_intersight_iqnpool_pool_member.yml"))["data_intersight_iqnpool_pool_member"] }

data "intersight_iqnpool_pool_member" "n770" {
  account_moid = try(local.m770["account_moid"], null)
  additional_properties = try(local.m770["additional_properties"], null)
  assigned = try(local.m770["assigned"], null)
  assigned_by_another = try(local.m770["assigned_by_another"], null)
  class_id = try(local.m770["class_id"], null)
  create_time = try(local.m770["create_time"], null)
  domain_group_moid = try(local.m770["domain_group_moid"], null)
  id = try(local.m770["id"], null)
  iqn_address = try(local.m770["iqn_address"], null)
  iqn_number = try(local.m770["iqn_number"], null)
  iqn_prefix = try(local.m770["iqn_prefix"], null)
  iqn_suffix = try(local.m770["iqn_suffix"], null)
  mod_time = try(local.m770["mod_time"], null)
  moid = try(local.m770["moid"], null)
  object_type = try(local.m770["object_type"], null)
  owners = try(local.m770["owners"], null)
  reserved = try(local.m770["reserved"], null)
  results = try(local.m770["results"], null)
  shared_scope = try(local.m770["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m770["ancestors"], null) == null ? [] : local.m770["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m770["assigned_to_entity"], null) == null ? [] : local.m770["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_head" {
    for_each = try(local.m770["block_head"], null) == null ? [] : local.m770["block_head"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m770["parent"], null) == null ? [] : local.m770["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer" {
    for_each = try(local.m770["peer"], null) == null ? [] : local.m770["peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m770["permission_resources"], null) == null ? [] : local.m770["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m770["pool"], null) == null ? [] : local.m770["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m770["reservation"], null) == null ? [] : local.m770["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m770["tags"], null) == null ? [] : local.m770["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m770["version_context"], null) == null ? [] : local.m770["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
