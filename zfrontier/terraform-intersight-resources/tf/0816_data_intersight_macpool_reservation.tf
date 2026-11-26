# Sample data source intersight_macpool_reservation — reads ../models/data_intersight_macpool_reservation.yml
locals { m816 = yamldecode(file("${path.module}/../models/data_intersight_macpool_reservation.yml"))["data_intersight_macpool_reservation"] }

data "intersight_macpool_reservation" "n816" {
  account_moid = try(local.m816["account_moid"], null)
  additional_properties = try(local.m816["additional_properties"], null)
  allocation_type = try(local.m816["allocation_type"], null)
  class_id = try(local.m816["class_id"], null)
  create_time = try(local.m816["create_time"], null)
  domain_group_moid = try(local.m816["domain_group_moid"], null)
  id = try(local.m816["id"], null)
  identity = try(local.m816["identity"], null)
  mod_time = try(local.m816["mod_time"], null)
  moid = try(local.m816["moid"], null)
  object_type = try(local.m816["object_type"], null)
  owners = try(local.m816["owners"], null)
  results = try(local.m816["results"], null)
  shared_scope = try(local.m816["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m816["ancestors"], null) == null ? [] : local.m816["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_head" {
    for_each = try(local.m816["block_head"], null) == null ? [] : local.m816["block_head"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "member_of" {
    for_each = try(local.m816["member_of"], null) == null ? [] : local.m816["member_of"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m816["organization"], null) == null ? [] : local.m816["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m816["parent"], null) == null ? [] : local.m816["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m816["permission_resources"], null) == null ? [] : local.m816["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m816["pool"], null) == null ? [] : local.m816["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m816["pool_member"], null) == null ? [] : local.m816["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m816["tags"], null) == null ? [] : local.m816["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m816["universe"], null) == null ? [] : local.m816["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m816["version_context"], null) == null ? [] : local.m816["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
