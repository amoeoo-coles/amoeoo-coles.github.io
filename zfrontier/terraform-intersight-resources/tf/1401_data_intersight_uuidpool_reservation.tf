# Sample data source intersight_uuidpool_reservation — reads ../models/data_intersight_uuidpool_reservation.yml
locals { m1401 = yamldecode(file("${path.module}/../models/data_intersight_uuidpool_reservation.yml"))["data_intersight_uuidpool_reservation"] }

data "intersight_uuidpool_reservation" "n1401" {
  account_moid = try(local.m1401["account_moid"], null)
  additional_properties = try(local.m1401["additional_properties"], null)
  allocation_type = try(local.m1401["allocation_type"], null)
  class_id = try(local.m1401["class_id"], null)
  create_time = try(local.m1401["create_time"], null)
  domain_group_moid = try(local.m1401["domain_group_moid"], null)
  id = try(local.m1401["id"], null)
  identity = try(local.m1401["identity"], null)
  mod_time = try(local.m1401["mod_time"], null)
  moid = try(local.m1401["moid"], null)
  object_type = try(local.m1401["object_type"], null)
  owners = try(local.m1401["owners"], null)
  results = try(local.m1401["results"], null)
  shared_scope = try(local.m1401["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1401["ancestors"], null) == null ? [] : local.m1401["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block" {
    for_each = try(local.m1401["block"], null) == null ? [] : local.m1401["block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1401["organization"], null) == null ? [] : local.m1401["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1401["parent"], null) == null ? [] : local.m1401["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1401["permission_resources"], null) == null ? [] : local.m1401["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1401["pool"], null) == null ? [] : local.m1401["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m1401["pool_member"], null) == null ? [] : local.m1401["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1401["tags"], null) == null ? [] : local.m1401["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m1401["universe"], null) == null ? [] : local.m1401["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1401["version_context"], null) == null ? [] : local.m1401["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
