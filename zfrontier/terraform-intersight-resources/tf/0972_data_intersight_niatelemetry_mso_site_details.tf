# Sample data source intersight_niatelemetry_mso_site_details — reads ../models/data_intersight_niatelemetry_mso_site_details.yml
locals { m972 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_mso_site_details.yml"))["data_intersight_niatelemetry_mso_site_details"] }

data "intersight_niatelemetry_mso_site_details" "n972" {
  account_moid = try(local.m972["account_moid"], null)
  additional_properties = try(local.m972["additional_properties"], null)
  class_id = try(local.m972["class_id"], null)
  create_time = try(local.m972["create_time"], null)
  domain_group_moid = try(local.m972["domain_group_moid"], null)
  id = try(local.m972["id"], null)
  is_cloud_sec_enabled = try(local.m972["is_cloud_sec_enabled"], null)
  mod_time = try(local.m972["mod_time"], null)
  moid = try(local.m972["moid"], null)
  number_of_leafs_per_site_in_mso = try(local.m972["number_of_leafs_per_site_in_mso"], null)
  number_of_pods_per_site_in_mso = try(local.m972["number_of_pods_per_site_in_mso"], null)
  number_of_spines_per_site_in_mso = try(local.m972["number_of_spines_per_site_in_mso"], null)
  object_type = try(local.m972["object_type"], null)
  owners = try(local.m972["owners"], null)
  record_type = try(local.m972["record_type"], null)
  results = try(local.m972["results"], null)
  shared_scope = try(local.m972["shared_scope"], null)
  site_id = try(local.m972["site_id"], null)
  site_name = try(local.m972["site_name"], null)
  site_version = try(local.m972["site_version"], null)
  dynamic "ancestors" {
    for_each = try(local.m972["ancestors"], null) == null ? [] : local.m972["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m972["parent"], null) == null ? [] : local.m972["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m972["permission_resources"], null) == null ? [] : local.m972["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m972["registered_device"], null) == null ? [] : local.m972["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m972["tags"], null) == null ? [] : local.m972["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m972["version_context"], null) == null ? [] : local.m972["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
