# Sample data source intersight_niatelemetry_mso_epg_details — reads ../models/data_intersight_niatelemetry_mso_epg_details.yml
locals { m970 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_mso_epg_details.yml"))["data_intersight_niatelemetry_mso_epg_details"] }

data "intersight_niatelemetry_mso_epg_details" "n970" {
  account_moid = try(local.m970["account_moid"], null)
  additional_properties = try(local.m970["additional_properties"], null)
  class_id = try(local.m970["class_id"], null)
  create_time = try(local.m970["create_time"], null)
  deployed_sites = try(local.m970["deployed_sites"], null)
  domain_group_moid = try(local.m970["domain_group_moid"], null)
  epg_name = try(local.m970["epg_name"], null)
  id = try(local.m970["id"], null)
  is_local = try(local.m970["is_local"], null)
  mod_time = try(local.m970["mod_time"], null)
  moid = try(local.m970["moid"], null)
  object_type = try(local.m970["object_type"], null)
  owners = try(local.m970["owners"], null)
  reference = try(local.m970["reference"], null)
  results = try(local.m970["results"], null)
  schema_id = try(local.m970["schema_id"], null)
  schema_name = try(local.m970["schema_name"], null)
  shared_scope = try(local.m970["shared_scope"], null)
  template_name = try(local.m970["template_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m970["ancestors"], null) == null ? [] : local.m970["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m970["parent"], null) == null ? [] : local.m970["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m970["permission_resources"], null) == null ? [] : local.m970["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m970["registered_device"], null) == null ? [] : local.m970["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m970["tags"], null) == null ? [] : local.m970["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m970["version_context"], null) == null ? [] : local.m970["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
