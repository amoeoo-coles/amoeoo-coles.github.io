# Sample data source intersight_appliance_metrics_ingestion_utilization — reads ../models/data_intersight_appliance_metrics_ingestion_utilization.yml
locals { m066 = yamldecode(file("${path.module}/../models/data_intersight_appliance_metrics_ingestion_utilization.yml"))["data_intersight_appliance_metrics_ingestion_utilization"] }

data "intersight_appliance_metrics_ingestion_utilization" "n066" {
  account_moid = try(local.m066["account_moid"], null)
  additional_properties = try(local.m066["additional_properties"], null)
  class_id = try(local.m066["class_id"], null)
  create_time = try(local.m066["create_time"], null)
  domain_group_moid = try(local.m066["domain_group_moid"], null)
  end_time = try(local.m066["end_time"], null)
  id = try(local.m066["id"], null)
  meta_field = try(local.m066["meta_field"], null)
  mod_time = try(local.m066["mod_time"], null)
  moid = try(local.m066["moid"], null)
  object_type = try(local.m066["object_type"], null)
  owners = try(local.m066["owners"], null)
  results = try(local.m066["results"], null)
  shared_scope = try(local.m066["shared_scope"], null)
  time = try(local.m066["time"], null)
  utilization = try(local.m066["utilization"], null)
  dynamic "ancestors" {
    for_each = try(local.m066["ancestors"], null) == null ? [] : local.m066["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "attributes" {
    for_each = try(local.m066["attributes"], null) == null ? [] : local.m066["attributes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m066["parent"], null) == null ? [] : local.m066["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m066["permission_resources"], null) == null ? [] : local.m066["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m066["tags"], null) == null ? [] : local.m066["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m066["version_context"], null) == null ? [] : local.m066["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
