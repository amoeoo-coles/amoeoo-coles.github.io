# Sample data source intersight_niatelemetry_insight_group_details — reads ../models/data_intersight_niatelemetry_insight_group_details.yml
locals { m964 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_insight_group_details.yml"))["data_intersight_niatelemetry_insight_group_details"] }

data "intersight_niatelemetry_insight_group_details" "n964" {
  account_moid = try(local.m964["account_moid"], null)
  additional_properties = try(local.m964["additional_properties"], null)
  alert_rules_count = try(local.m964["alert_rules_count"], null)
  analysis_settings_status = try(local.m964["analysis_settings_status"], null)
  bug_scan_settings_status = try(local.m964["bug_scan_settings_status"], null)
  class_id = try(local.m964["class_id"], null)
  create_time = try(local.m964["create_time"], null)
  delta_analysis_job_count = try(local.m964["delta_analysis_job_count"], null)
  domain_group_moid = try(local.m964["domain_group_moid"], null)
  email_settings_count = try(local.m964["email_settings_count"], null)
  flow_settings_count = try(local.m964["flow_settings_count"], null)
  flow_settings_status = try(local.m964["flow_settings_status"], null)
  group_name = try(local.m964["group_name"], null)
  id = try(local.m964["id"], null)
  kafka_settings_count = try(local.m964["kafka_settings_count"], null)
  micro_burst_settings_status = try(local.m964["micro_burst_settings_status"], null)
  mod_time = try(local.m964["mod_time"], null)
  moid = try(local.m964["moid"], null)
  object_type = try(local.m964["object_type"], null)
  owners = try(local.m964["owners"], null)
  prechange_analysis_count = try(local.m964["prechange_analysis_count"], null)
  results = try(local.m964["results"], null)
  shared_scope = try(local.m964["shared_scope"], null)
  tac_collection_config_count = try(local.m964["tac_collection_config_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m964["ancestors"], null) == null ? [] : local.m964["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "insight_sites" {
    for_each = try(local.m964["insight_sites"], null) == null ? [] : local.m964["insight_sites"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m964["parent"], null) == null ? [] : local.m964["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m964["permission_resources"], null) == null ? [] : local.m964["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m964["registered_device"], null) == null ? [] : local.m964["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m964["tags"], null) == null ? [] : local.m964["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m964["version_context"], null) == null ? [] : local.m964["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
