# Sample data source intersight_niatelemetry_anomaly — reads ../models/data_intersight_niatelemetry_anomaly.yml
locals { m913 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_anomaly.yml"))["data_intersight_niatelemetry_anomaly"] }

data "intersight_niatelemetry_anomaly" "n913" {
  account_moid = try(local.m913["account_moid"], null)
  additional_properties = try(local.m913["additional_properties"], null)
  alert_type_id = try(local.m913["alert_type_id"], null)
  anomaly_id = try(local.m913["anomaly_id"], null)
  category = try(local.m913["category"], null)
  class_id = try(local.m913["class_id"], null)
  create_time = try(local.m913["create_time"], null)
  deep_link = try(local.m913["deep_link"], null)
  description = try(local.m913["description"], null)
  details = try(local.m913["details"], null)
  domain_group_moid = try(local.m913["domain_group_moid"], null)
  entity_id = try(local.m913["entity_id"], null)
  entity_type = try(local.m913["entity_type"], null)
  event_time = try(local.m913["event_time"], null)
  fabric_name = try(local.m913["fabric_name"], null)
  first_raised_time = try(local.m913["first_raised_time"], null)
  id = try(local.m913["id"], null)
  last_raised_time = try(local.m913["last_raised_time"], null)
  last_updated_time = try(local.m913["last_updated_time"], null)
  mod_time = try(local.m913["mod_time"], null)
  moid = try(local.m913["moid"], null)
  notification_type = try(local.m913["notification_type"], null)
  object_type = try(local.m913["object_type"], null)
  owners = try(local.m913["owners"], null)
  product = try(local.m913["product"], null)
  region = try(local.m913["region"], null)
  results = try(local.m913["results"], null)
  severity = try(local.m913["severity"], null)
  shared_scope = try(local.m913["shared_scope"], null)
  title = try(local.m913["title"], null)
  dynamic "ancestors" {
    for_each = try(local.m913["ancestors"], null) == null ? [] : local.m913["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m913["fabric"], null) == null ? [] : local.m913["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m913["parent"], null) == null ? [] : local.m913["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m913["permission_resources"], null) == null ? [] : local.m913["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m913["tags"], null) == null ? [] : local.m913["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m913["version_context"], null) == null ? [] : local.m913["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
