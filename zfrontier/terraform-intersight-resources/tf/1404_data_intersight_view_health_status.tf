# Sample data source intersight_view_health_status — reads ../models/data_intersight_view_health_status.yml
locals { m1404 = yamldecode(file("${path.module}/../models/data_intersight_view_health_status.yml"))["data_intersight_view_health_status"] }

data "intersight_view_health_status" "n1404" {
  account_moid = try(local.m1404["account_moid"], null)
  additional_properties = try(local.m1404["additional_properties"], null)
  class_id = try(local.m1404["class_id"], null)
  create_time = try(local.m1404["create_time"], null)
  domain_group_moid = try(local.m1404["domain_group_moid"], null)
  id = try(local.m1404["id"], null)
  mod_time = try(local.m1404["mod_time"], null)
  moid = try(local.m1404["moid"], null)
  object_type = try(local.m1404["object_type"], null)
  owners = try(local.m1404["owners"], null)
  results = try(local.m1404["results"], null)
  shared_scope = try(local.m1404["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1404["ancestors"], null) == null ? [] : local.m1404["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1404["parent"], null) == null ? [] : local.m1404["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1404["permission_resources"], null) == null ? [] : local.m1404["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1404["tags"], null) == null ? [] : local.m1404["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1404["version_context"], null) == null ? [] : local.m1404["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
