# Sample data source intersight_resourcepool_membership_reservation — reads ../models/data_intersight_resourcepool_membership_reservation.yml
locals { m1125 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_membership_reservation.yml"))["data_intersight_resourcepool_membership_reservation"] }

data "intersight_resourcepool_membership_reservation" "n1125" {
  account_moid = try(local.m1125["account_moid"], null)
  additional_properties = try(local.m1125["additional_properties"], null)
  class_id = try(local.m1125["class_id"], null)
  create_time = try(local.m1125["create_time"], null)
  description = try(local.m1125["description"], null)
  domain_group_moid = try(local.m1125["domain_group_moid"], null)
  expiration = try(local.m1125["expiration"], null)
  id = try(local.m1125["id"], null)
  mod_time = try(local.m1125["mod_time"], null)
  moid = try(local.m1125["moid"], null)
  object_type = try(local.m1125["object_type"], null)
  owners = try(local.m1125["owners"], null)
  reservation_selector = try(local.m1125["reservation_selector"], null)
  resource_type = try(local.m1125["resource_type"], null)
  results = try(local.m1125["results"], null)
  shared_scope = try(local.m1125["shared_scope"], null)
  status = try(local.m1125["status"], null)
  dynamic "account" {
    for_each = try(local.m1125["account"], null) == null ? [] : local.m1125["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1125["ancestors"], null) == null ? [] : local.m1125["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "identity" {
    for_each = try(local.m1125["identity"], null) == null ? [] : local.m1125["identity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1125["parent"], null) == null ? [] : local.m1125["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1125["permission_resources"], null) == null ? [] : local.m1125["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pools" {
    for_each = try(local.m1125["pools"], null) == null ? [] : local.m1125["pools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1125["tags"], null) == null ? [] : local.m1125["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1125["version_context"], null) == null ? [] : local.m1125["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
