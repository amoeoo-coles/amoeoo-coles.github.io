# Sample data source intersight_niatelemetry_app_details — reads ../models/data_intersight_niatelemetry_app_details.yml
locals { m937 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_app_details.yml"))["data_intersight_niatelemetry_app_details"] }

data "intersight_niatelemetry_app_details" "n937" {
  account_moid = try(local.m937["account_moid"], null)
  additional_properties = try(local.m937["additional_properties"], null)
  app_name = try(local.m937["app_name"], null)
  app_status = try(local.m937["app_status"], null)
  app_version = try(local.m937["app_version"], null)
  class_id = try(local.m937["class_id"], null)
  create_time = try(local.m937["create_time"], null)
  domain_group_moid = try(local.m937["domain_group_moid"], null)
  id = try(local.m937["id"], null)
  mod_time = try(local.m937["mod_time"], null)
  moid = try(local.m937["moid"], null)
  nexus_dashboard = try(local.m937["nexus_dashboard"], null)
  number_of_sites_onboarded = try(local.m937["number_of_sites_onboarded"], null)
  object_type = try(local.m937["object_type"], null)
  owners = try(local.m937["owners"], null)
  results = try(local.m937["results"], null)
  shared_scope = try(local.m937["shared_scope"], null)
  type = try(local.m937["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m937["ancestors"], null) == null ? [] : local.m937["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m937["parent"], null) == null ? [] : local.m937["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m937["permission_resources"], null) == null ? [] : local.m937["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m937["registered_device"], null) == null ? [] : local.m937["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m937["tags"], null) == null ? [] : local.m937["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m937["version_context"], null) == null ? [] : local.m937["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
