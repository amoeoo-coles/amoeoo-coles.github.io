# Sample data source intersight_metrics_metrics_exploration — reads ../models/data_intersight_metrics_metrics_exploration.yml
locals { m843 = yamldecode(file("${path.module}/../models/data_intersight_metrics_metrics_exploration.yml"))["data_intersight_metrics_metrics_exploration"] }

data "intersight_metrics_metrics_exploration" "n843" {
  account_moid = try(local.m843["account_moid"], null)
  additional_properties = try(local.m843["additional_properties"], null)
  class_id = try(local.m843["class_id"], null)
  create_time = try(local.m843["create_time"], null)
  description = try(local.m843["description"], null)
  domain_group_moid = try(local.m843["domain_group_moid"], null)
  granularity = try(local.m843["granularity"], null)
  id = try(local.m843["id"], null)
  intervals = try(local.m843["intervals"], null)
  is_widget = try(local.m843["is_widget"], null)
  mod_time = try(local.m843["mod_time"], null)
  moid = try(local.m843["moid"], null)
  name = try(local.m843["name"], null)
  object_type = try(local.m843["object_type"], null)
  owners = try(local.m843["owners"], null)
  raw_queries = try(local.m843["raw_queries"], null)
  results = try(local.m843["results"], null)
  shared_scope = try(local.m843["shared_scope"], null)
  visual_config = try(local.m843["visual_config"], null)
  dynamic "ancestors" {
    for_each = try(local.m843["ancestors"], null) == null ? [] : local.m843["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "metric_criteria" {
    for_each = try(local.m843["metric_criteria"], null) == null ? [] : local.m843["metric_criteria"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m843["organization"], null) == null ? [] : local.m843["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m843["parent"], null) == null ? [] : local.m843["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m843["permission_resources"], null) == null ? [] : local.m843["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m843["tags"], null) == null ? [] : local.m843["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m843["version_context"], null) == null ? [] : local.m843["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
