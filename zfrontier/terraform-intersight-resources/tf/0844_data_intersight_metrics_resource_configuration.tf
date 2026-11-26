# Sample data source intersight_metrics_resource_configuration — reads ../models/data_intersight_metrics_resource_configuration.yml
locals { m844 = yamldecode(file("${path.module}/../models/data_intersight_metrics_resource_configuration.yml"))["data_intersight_metrics_resource_configuration"] }

data "intersight_metrics_resource_configuration" "n844" {
  account_moid = try(local.m844["account_moid"], null)
  additional_properties = try(local.m844["additional_properties"], null)
  class_id = try(local.m844["class_id"], null)
  create_time = try(local.m844["create_time"], null)
  domain_group_moid = try(local.m844["domain_group_moid"], null)
  enabled = try(local.m844["enabled"], null)
  id = try(local.m844["id"], null)
  mod_time = try(local.m844["mod_time"], null)
  moid = try(local.m844["moid"], null)
  object_type = try(local.m844["object_type"], null)
  owners = try(local.m844["owners"], null)
  results = try(local.m844["results"], null)
  shared_scope = try(local.m844["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m844["ancestors"], null) == null ? [] : local.m844["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "domain" {
    for_each = try(local.m844["domain"], null) == null ? [] : local.m844["domain"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m844["parent"], null) == null ? [] : local.m844["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m844["permission_resources"], null) == null ? [] : local.m844["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource" {
    for_each = try(local.m844["resource"], null) == null ? [] : local.m844["resource"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m844["tags"], null) == null ? [] : local.m844["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m844["version_context"], null) == null ? [] : local.m844["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
