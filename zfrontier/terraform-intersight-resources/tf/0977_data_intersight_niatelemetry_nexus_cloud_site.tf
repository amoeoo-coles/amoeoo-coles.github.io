# Sample data source intersight_niatelemetry_nexus_cloud_site — reads ../models/data_intersight_niatelemetry_nexus_cloud_site.yml
locals { m977 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nexus_cloud_site.yml"))["data_intersight_niatelemetry_nexus_cloud_site"] }

data "intersight_niatelemetry_nexus_cloud_site" "n977" {
  account_moid = try(local.m977["account_moid"], null)
  additional_properties = try(local.m977["additional_properties"], null)
  advisories = try(local.m977["advisories"], null)
  anomalies = try(local.m977["anomalies"], null)
  capacity_utilization = try(local.m977["capacity_utilization"], null)
  class_id = try(local.m977["class_id"], null)
  create_time = try(local.m977["create_time"], null)
  domain_group_moid = try(local.m977["domain_group_moid"], null)
  id = try(local.m977["id"], null)
  license_type = try(local.m977["license_type"], null)
  mod_time = try(local.m977["mod_time"], null)
  moid = try(local.m977["moid"], null)
  name = try(local.m977["name"], null)
  object_type = try(local.m977["object_type"], null)
  owners = try(local.m977["owners"], null)
  results = try(local.m977["results"], null)
  shared_scope = try(local.m977["shared_scope"], null)
  site_type = try(local.m977["site_type"], null)
  software_management = try(local.m977["software_management"], null)
  uuid = try(local.m977["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m977["ancestors"], null) == null ? [] : local.m977["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nexus_cloud_account" {
    for_each = try(local.m977["nexus_cloud_account"], null) == null ? [] : local.m977["nexus_cloud_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m977["parent"], null) == null ? [] : local.m977["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m977["permission_resources"], null) == null ? [] : local.m977["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m977["tags"], null) == null ? [] : local.m977["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m977["version_context"], null) == null ? [] : local.m977["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
