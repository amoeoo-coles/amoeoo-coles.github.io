# Sample data source intersight_niatelemetry_apic_vision — reads ../models/data_intersight_niatelemetry_apic_vision.yml
locals { m936 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_apic_vision.yml"))["data_intersight_niatelemetry_apic_vision"] }

data "intersight_niatelemetry_apic_vision" "n936" {
  account_moid = try(local.m936["account_moid"], null)
  additional_properties = try(local.m936["additional_properties"], null)
  apic_vision_state = try(local.m936["apic_vision_state"], null)
  apic_vision_state_last_update_ts = try(local.m936["apic_vision_state_last_update_ts"], null)
  apic_vision_version = try(local.m936["apic_vision_version"], null)
  class_id = try(local.m936["class_id"], null)
  config_issues = try(local.m936["config_issues"], null)
  create_time = try(local.m936["create_time"], null)
  domain_group_moid = try(local.m936["domain_group_moid"], null)
  id = try(local.m936["id"], null)
  mod_time = try(local.m936["mod_time"], null)
  moid = try(local.m936["moid"], null)
  object_type = try(local.m936["object_type"], null)
  owners = try(local.m936["owners"], null)
  results = try(local.m936["results"], null)
  shared_scope = try(local.m936["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m936["ancestors"], null) == null ? [] : local.m936["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m936["parent"], null) == null ? [] : local.m936["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m936["permission_resources"], null) == null ? [] : local.m936["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m936["registered_device"], null) == null ? [] : local.m936["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m936["tags"], null) == null ? [] : local.m936["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m936["version_context"], null) == null ? [] : local.m936["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
