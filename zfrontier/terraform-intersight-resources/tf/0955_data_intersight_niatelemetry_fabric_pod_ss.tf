# Sample data source intersight_niatelemetry_fabric_pod_ss — reads ../models/data_intersight_niatelemetry_fabric_pod_ss.yml
locals { m955 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_fabric_pod_ss.yml"))["data_intersight_niatelemetry_fabric_pod_ss"] }

data "intersight_niatelemetry_fabric_pod_ss" "n955" {
  account_moid = try(local.m955["account_moid"], null)
  additional_properties = try(local.m955["additional_properties"], null)
  class_id = try(local.m955["class_id"], null)
  create_time = try(local.m955["create_time"], null)
  dn = try(local.m955["dn"], null)
  domain_group_moid = try(local.m955["domain_group_moid"], null)
  fabric_pod_prof = try(local.m955["fabric_pod_prof"], null)
  id = try(local.m955["id"], null)
  mod_time = try(local.m955["mod_time"], null)
  moid = try(local.m955["moid"], null)
  object_type = try(local.m955["object_type"], null)
  owners = try(local.m955["owners"], null)
  pod_blk = try(local.m955["pod_blk"], null)
  pod_pol_grp = try(local.m955["pod_pol_grp"], null)
  pol_list = try(local.m955["pol_list"], null)
  record_type = try(local.m955["record_type"], null)
  record_version = try(local.m955["record_version"], null)
  results = try(local.m955["results"], null)
  shared_scope = try(local.m955["shared_scope"], null)
  site_name = try(local.m955["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m955["ancestors"], null) == null ? [] : local.m955["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m955["parent"], null) == null ? [] : local.m955["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m955["permission_resources"], null) == null ? [] : local.m955["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m955["registered_device"], null) == null ? [] : local.m955["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m955["tags"], null) == null ? [] : local.m955["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m955["version_context"], null) == null ? [] : local.m955["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
