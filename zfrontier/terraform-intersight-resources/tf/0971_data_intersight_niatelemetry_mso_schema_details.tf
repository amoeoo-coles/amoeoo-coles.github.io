# Sample data source intersight_niatelemetry_mso_schema_details — reads ../models/data_intersight_niatelemetry_mso_schema_details.yml
locals { m971 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_mso_schema_details.yml"))["data_intersight_niatelemetry_mso_schema_details"] }

data "intersight_niatelemetry_mso_schema_details" "n971" {
  account_moid = try(local.m971["account_moid"], null)
  additional_properties = try(local.m971["additional_properties"], null)
  class_id = try(local.m971["class_id"], null)
  create_time = try(local.m971["create_time"], null)
  deployed_sites = try(local.m971["deployed_sites"], null)
  domain_group_moid = try(local.m971["domain_group_moid"], null)
  id = try(local.m971["id"], null)
  mod_time = try(local.m971["mod_time"], null)
  moid = try(local.m971["moid"], null)
  number_of_policy_objects_per_schema = try(local.m971["number_of_policy_objects_per_schema"], null)
  number_of_templates_per_schema = try(local.m971["number_of_templates_per_schema"], null)
  object_type = try(local.m971["object_type"], null)
  owners = try(local.m971["owners"], null)
  record_type = try(local.m971["record_type"], null)
  results = try(local.m971["results"], null)
  schema_id = try(local.m971["schema_id"], null)
  schema_name = try(local.m971["schema_name"], null)
  shared_scope = try(local.m971["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m971["ancestors"], null) == null ? [] : local.m971["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m971["parent"], null) == null ? [] : local.m971["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m971["permission_resources"], null) == null ? [] : local.m971["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m971["registered_device"], null) == null ? [] : local.m971["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m971["tags"], null) == null ? [] : local.m971["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m971["version_context"], null) == null ? [] : local.m971["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
