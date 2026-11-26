# Sample data source intersight_fcpool_reservation — reads ../models/data_intersight_fcpool_reservation.yml
locals { m462 = yamldecode(file("${path.module}/../models/data_intersight_fcpool_reservation.yml"))["data_intersight_fcpool_reservation"] }

data "intersight_fcpool_reservation" "n462" {
  account_moid = try(local.m462["account_moid"], null)
  additional_properties = try(local.m462["additional_properties"], null)
  allocation_type = try(local.m462["allocation_type"], null)
  class_id = try(local.m462["class_id"], null)
  create_time = try(local.m462["create_time"], null)
  domain_group_moid = try(local.m462["domain_group_moid"], null)
  id = try(local.m462["id"], null)
  id_purpose = try(local.m462["id_purpose"], null)
  identity = try(local.m462["identity"], null)
  mod_time = try(local.m462["mod_time"], null)
  moid = try(local.m462["moid"], null)
  object_type = try(local.m462["object_type"], null)
  owners = try(local.m462["owners"], null)
  results = try(local.m462["results"], null)
  shared_scope = try(local.m462["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m462["ancestors"], null) == null ? [] : local.m462["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block" {
    for_each = try(local.m462["block"], null) == null ? [] : local.m462["block"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m462["organization"], null) == null ? [] : local.m462["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m462["parent"], null) == null ? [] : local.m462["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m462["permission_resources"], null) == null ? [] : local.m462["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m462["pool"], null) == null ? [] : local.m462["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool_member" {
    for_each = try(local.m462["pool_member"], null) == null ? [] : local.m462["pool_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m462["tags"], null) == null ? [] : local.m462["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "universe" {
    for_each = try(local.m462["universe"], null) == null ? [] : local.m462["universe"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m462["version_context"], null) == null ? [] : local.m462["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
