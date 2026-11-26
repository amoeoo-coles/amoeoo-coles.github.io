# Sample data source intersight_resourcepool_reservation — reads ../models/data_intersight_resourcepool_reservation.yml
locals { m1129 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_reservation.yml"))["data_intersight_resourcepool_reservation"] }

data "intersight_resourcepool_reservation" "n1129" {
  account_moid = try(local.m1129["account_moid"], null)
  additional_properties = try(local.m1129["additional_properties"], null)
  allocation_type = try(local.m1129["allocation_type"], null)
  class_id = try(local.m1129["class_id"], null)
  create_time = try(local.m1129["create_time"], null)
  domain_group_moid = try(local.m1129["domain_group_moid"], null)
  id = try(local.m1129["id"], null)
  identity = try(local.m1129["identity"], null)
  mod_time = try(local.m1129["mod_time"], null)
  moid = try(local.m1129["moid"], null)
  object_type = try(local.m1129["object_type"], null)
  owners = try(local.m1129["owners"], null)
  resource_serial = try(local.m1129["resource_serial"], null)
  resource_type = try(local.m1129["resource_type"], null)
  results = try(local.m1129["results"], null)
  shared_scope = try(local.m1129["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1129["ancestors"], null) == null ? [] : local.m1129["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1129["organization"], null) == null ? [] : local.m1129["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1129["parent"], null) == null ? [] : local.m1129["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1129["permission_resources"], null) == null ? [] : local.m1129["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1129["pool"], null) == null ? [] : local.m1129["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m1129["pool_member"], null) == null ? [] : local.m1129["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1129["tags"], null) == null ? [] : local.m1129["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m1129["universe"], null) == null ? [] : local.m1129["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1129["version_context"], null) == null ? [] : local.m1129["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
