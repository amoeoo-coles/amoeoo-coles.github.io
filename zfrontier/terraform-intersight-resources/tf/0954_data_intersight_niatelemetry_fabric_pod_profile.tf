# Sample data source intersight_niatelemetry_fabric_pod_profile — reads ../models/data_intersight_niatelemetry_fabric_pod_profile.yml
locals { m954 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_fabric_pod_profile.yml"))["data_intersight_niatelemetry_fabric_pod_profile"] }

data "intersight_niatelemetry_fabric_pod_profile" "n954" {
  account_moid = try(local.m954["account_moid"], null)
  additional_properties = try(local.m954["additional_properties"], null)
  class_id = try(local.m954["class_id"], null)
  create_time = try(local.m954["create_time"], null)
  dn = try(local.m954["dn"], null)
  domain_group_moid = try(local.m954["domain_group_moid"], null)
  fabric_pods_list = try(local.m954["fabric_pods_list"], null)
  id = try(local.m954["id"], null)
  mod_time = try(local.m954["mod_time"], null)
  moid = try(local.m954["moid"], null)
  name = try(local.m954["name"], null)
  object_type = try(local.m954["object_type"], null)
  owners = try(local.m954["owners"], null)
  record_type = try(local.m954["record_type"], null)
  record_version = try(local.m954["record_version"], null)
  results = try(local.m954["results"], null)
  shared_scope = try(local.m954["shared_scope"], null)
  site_name = try(local.m954["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m954["ancestors"], null) == null ? [] : local.m954["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m954["parent"], null) == null ? [] : local.m954["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m954["permission_resources"], null) == null ? [] : local.m954["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m954["registered_device"], null) == null ? [] : local.m954["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m954["tags"], null) == null ? [] : local.m954["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m954["version_context"], null) == null ? [] : local.m954["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
