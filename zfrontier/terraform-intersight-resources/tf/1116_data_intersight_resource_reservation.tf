# Sample data source intersight_resource_reservation — reads ../models/data_intersight_resource_reservation.yml
locals { m1116 = yamldecode(file("${path.module}/../models/data_intersight_resource_reservation.yml"))["data_intersight_resource_reservation"] }

data "intersight_resource_reservation" "n1116" {
  account_moid = try(local.m1116["account_moid"], null)
  additional_properties = try(local.m1116["additional_properties"], null)
  class_id = try(local.m1116["class_id"], null)
  create_time = try(local.m1116["create_time"], null)
  description = try(local.m1116["description"], null)
  domain_group_moid = try(local.m1116["domain_group_moid"], null)
  expiration = try(local.m1116["expiration"], null)
  id = try(local.m1116["id"], null)
  mark_fail = try(local.m1116["mark_fail"], null)
  mod_time = try(local.m1116["mod_time"], null)
  moid = try(local.m1116["moid"], null)
  object_type = try(local.m1116["object_type"], null)
  owners = try(local.m1116["owners"], null)
  reservation_selector = try(local.m1116["reservation_selector"], null)
  resource_moids = try(local.m1116["resource_moids"], null)
  resource_type = try(local.m1116["resource_type"], null)
  results = try(local.m1116["results"], null)
  shared_scope = try(local.m1116["shared_scope"], null)
  status = try(local.m1116["status"], null)
  user_moid = try(local.m1116["user_moid"], null)
  dynamic "account" {
    for_each = try(local.m1116["account"], null) == null ? [] : local.m1116["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1116["ancestors"], null) == null ? [] : local.m1116["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_permission_resources" {
    for_each = try(local.m1116["custom_permission_resources"], null) == null ? [] : local.m1116["custom_permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "groups" {
    for_each = try(local.m1116["groups"], null) == null ? [] : local.m1116["groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "identity" {
    for_each = try(local.m1116["identity"], null) == null ? [] : local.m1116["identity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1116["parent"], null) == null ? [] : local.m1116["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1116["permission_resources"], null) == null ? [] : local.m1116["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1116["tags"], null) == null ? [] : local.m1116["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1116["version_context"], null) == null ? [] : local.m1116["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
