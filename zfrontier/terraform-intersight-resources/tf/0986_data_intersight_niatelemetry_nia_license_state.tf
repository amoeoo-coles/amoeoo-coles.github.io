# Sample data source intersight_niatelemetry_nia_license_state — reads ../models/data_intersight_niatelemetry_nia_license_state.yml
locals { m986 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nia_license_state.yml"))["data_intersight_niatelemetry_nia_license_state"] }

data "intersight_niatelemetry_nia_license_state" "n986" {
  account_moid = try(local.m986["account_moid"], null)
  additional_properties = try(local.m986["additional_properties"], null)
  class_id = try(local.m986["class_id"], null)
  create_time = try(local.m986["create_time"], null)
  domain_group_moid = try(local.m986["domain_group_moid"], null)
  feature_activated = try(local.m986["feature_activated"], null)
  id = try(local.m986["id"], null)
  license_activated = try(local.m986["license_activated"], null)
  mod_time = try(local.m986["mod_time"], null)
  moid = try(local.m986["moid"], null)
  object_type = try(local.m986["object_type"], null)
  owners = try(local.m986["owners"], null)
  pid_type = try(local.m986["pid_type"], null)
  record_type = try(local.m986["record_type"], null)
  record_version = try(local.m986["record_version"], null)
  results = try(local.m986["results"], null)
  serial = try(local.m986["serial"], null)
  shared_scope = try(local.m986["shared_scope"], null)
  site_name = try(local.m986["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m986["ancestors"], null) == null ? [] : local.m986["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m986["device"], null) == null ? [] : local.m986["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m986["parent"], null) == null ? [] : local.m986["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m986["permission_resources"], null) == null ? [] : local.m986["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m986["tags"], null) == null ? [] : local.m986["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m986["version_context"], null) == null ? [] : local.m986["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
