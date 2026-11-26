# Sample data source intersight_fcpool_pool_member — reads ../models/data_intersight_fcpool_pool_member.yml
locals { m461 = yamldecode(file("${path.module}/../models/data_intersight_fcpool_pool_member.yml"))["data_intersight_fcpool_pool_member"] }

data "intersight_fcpool_pool_member" "n461" {
  account_moid = try(local.m461["account_moid"], null)
  additional_properties = try(local.m461["additional_properties"], null)
  assigned = try(local.m461["assigned"], null)
  assigned_by_another = try(local.m461["assigned_by_another"], null)
  class_id = try(local.m461["class_id"], null)
  create_time = try(local.m461["create_time"], null)
  domain_group_moid = try(local.m461["domain_group_moid"], null)
  id = try(local.m461["id"], null)
  mod_time = try(local.m461["mod_time"], null)
  moid = try(local.m461["moid"], null)
  object_type = try(local.m461["object_type"], null)
  owners = try(local.m461["owners"], null)
  reserved = try(local.m461["reserved"], null)
  results = try(local.m461["results"], null)
  shared_scope = try(local.m461["shared_scope"], null)
  wwn_id = try(local.m461["wwn_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m461["ancestors"], null) == null ? [] : local.m461["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assigned_to_entity" {
    for_each = try(local.m461["assigned_to_entity"], null) == null ? [] : local.m461["assigned_to_entity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_head" {
    for_each = try(local.m461["block_head"], null) == null ? [] : local.m461["block_head"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m461["parent"], null) == null ? [] : local.m461["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "peer" {
    for_each = try(local.m461["peer"], null) == null ? [] : local.m461["peer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m461["permission_resources"], null) == null ? [] : local.m461["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m461["pool"], null) == null ? [] : local.m461["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "reservation" {
    for_each = try(local.m461["reservation"], null) == null ? [] : local.m461["reservation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m461["tags"], null) == null ? [] : local.m461["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m461["version_context"], null) == null ? [] : local.m461["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
