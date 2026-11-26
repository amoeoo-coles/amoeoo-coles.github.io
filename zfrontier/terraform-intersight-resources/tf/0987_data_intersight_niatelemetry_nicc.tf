# Sample data source intersight_niatelemetry_nicc — reads ../models/data_intersight_niatelemetry_nicc.yml
locals { m987 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nicc.yml"))["data_intersight_niatelemetry_nicc"] }

data "intersight_niatelemetry_nicc" "n987" {
  account_moid = try(local.m987["account_moid"], null)
  additional_properties = try(local.m987["additional_properties"], null)
  class_id = try(local.m987["class_id"], null)
  config_issues = try(local.m987["config_issues"], null)
  create_time = try(local.m987["create_time"], null)
  domain_group_moid = try(local.m987["domain_group_moid"], null)
  id = try(local.m987["id"], null)
  mod_time = try(local.m987["mod_time"], null)
  moid = try(local.m987["moid"], null)
  nicc_state = try(local.m987["nicc_state"], null)
  nicc_state_last_update_ts = try(local.m987["nicc_state_last_update_ts"], null)
  nicc_version = try(local.m987["nicc_version"], null)
  object_type = try(local.m987["object_type"], null)
  owners = try(local.m987["owners"], null)
  results = try(local.m987["results"], null)
  shared_scope = try(local.m987["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m987["ancestors"], null) == null ? [] : local.m987["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m987["parent"], null) == null ? [] : local.m987["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m987["permission_resources"], null) == null ? [] : local.m987["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m987["registered_device"], null) == null ? [] : local.m987["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m987["tags"], null) == null ? [] : local.m987["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m987["version_context"], null) == null ? [] : local.m987["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
