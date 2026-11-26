# Sample data source intersight_niatelemetry_health_insights_data — reads ../models/data_intersight_niatelemetry_health_insights_data.yml
locals { m958 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_health_insights_data.yml"))["data_intersight_niatelemetry_health_insights_data"] }

data "intersight_niatelemetry_health_insights_data" "n958" {
  account_moid = try(local.m958["account_moid"], null)
  additional_properties = try(local.m958["additional_properties"], null)
  class_id = try(local.m958["class_id"], null)
  create_time = try(local.m958["create_time"], null)
  domain_group_moid = try(local.m958["domain_group_moid"], null)
  flt_eqpt_flash_minor_alarm_fault_count = try(local.m958["flt_eqpt_flash_minor_alarm_fault_count"], null)
  flt_eqpt_flash_worn_out_fault_count = try(local.m958["flt_eqpt_flash_worn_out_fault_count"], null)
  id = try(local.m958["id"], null)
  mod_time = try(local.m958["mod_time"], null)
  moid = try(local.m958["moid"], null)
  object_type = try(local.m958["object_type"], null)
  owners = try(local.m958["owners"], null)
  record_type = try(local.m958["record_type"], null)
  record_version = try(local.m958["record_version"], null)
  results = try(local.m958["results"], null)
  shared_scope = try(local.m958["shared_scope"], null)
  site_name = try(local.m958["site_name"], null)
  ssd_monitoring_fault_count = try(local.m958["ssd_monitoring_fault_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m958["ancestors"], null) == null ? [] : local.m958["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m958["parent"], null) == null ? [] : local.m958["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m958["permission_resources"], null) == null ? [] : local.m958["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m958["registered_device"], null) == null ? [] : local.m958["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m958["tags"], null) == null ? [] : local.m958["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m958["version_context"], null) == null ? [] : local.m958["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
