# Sample data source intersight_niatelemetry_leaf_pol_grp_details — reads ../models/data_intersight_niatelemetry_leaf_pol_grp_details.yml
locals { m966 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_leaf_pol_grp_details.yml"))["data_intersight_niatelemetry_leaf_pol_grp_details"] }

data "intersight_niatelemetry_leaf_pol_grp_details" "n966" {
  account_moid = try(local.m966["account_moid"], null)
  additional_properties = try(local.m966["additional_properties"], null)
  class_id = try(local.m966["class_id"], null)
  create_time = try(local.m966["create_time"], null)
  dn = try(local.m966["dn"], null)
  domain_group_moid = try(local.m966["domain_group_moid"], null)
  fabric_node_control_dn = try(local.m966["fabric_node_control_dn"], null)
  fabric_node_control_pol_name = try(local.m966["fabric_node_control_pol_name"], null)
  id = try(local.m966["id"], null)
  leaf_pol_group_name = try(local.m966["leaf_pol_group_name"], null)
  leaf_profile_name = try(local.m966["leaf_profile_name"], null)
  mod_time = try(local.m966["mod_time"], null)
  moid = try(local.m966["moid"], null)
  object_type = try(local.m966["object_type"], null)
  owners = try(local.m966["owners"], null)
  record_type = try(local.m966["record_type"], null)
  record_version = try(local.m966["record_version"], null)
  results = try(local.m966["results"], null)
  shared_scope = try(local.m966["shared_scope"], null)
  site_name = try(local.m966["site_name"], null)
  state = try(local.m966["state"], null)
  dynamic "ancestors" {
    for_each = try(local.m966["ancestors"], null) == null ? [] : local.m966["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m966["parent"], null) == null ? [] : local.m966["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m966["permission_resources"], null) == null ? [] : local.m966["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m966["registered_device"], null) == null ? [] : local.m966["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m966["tags"], null) == null ? [] : local.m966["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m966["version_context"], null) == null ? [] : local.m966["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
