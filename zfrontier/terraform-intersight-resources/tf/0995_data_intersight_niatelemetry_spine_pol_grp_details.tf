# Sample data source intersight_niatelemetry_spine_pol_grp_details — reads ../models/data_intersight_niatelemetry_spine_pol_grp_details.yml
locals { m995 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_spine_pol_grp_details.yml"))["data_intersight_niatelemetry_spine_pol_grp_details"] }

data "intersight_niatelemetry_spine_pol_grp_details" "n995" {
  account_moid = try(local.m995["account_moid"], null)
  additional_properties = try(local.m995["additional_properties"], null)
  class_id = try(local.m995["class_id"], null)
  create_time = try(local.m995["create_time"], null)
  dn = try(local.m995["dn"], null)
  domain_group_moid = try(local.m995["domain_group_moid"], null)
  fabric_node_control_dn = try(local.m995["fabric_node_control_dn"], null)
  fabric_node_control_pol_name = try(local.m995["fabric_node_control_pol_name"], null)
  id = try(local.m995["id"], null)
  mod_time = try(local.m995["mod_time"], null)
  moid = try(local.m995["moid"], null)
  object_type = try(local.m995["object_type"], null)
  owners = try(local.m995["owners"], null)
  record_type = try(local.m995["record_type"], null)
  record_version = try(local.m995["record_version"], null)
  results = try(local.m995["results"], null)
  shared_scope = try(local.m995["shared_scope"], null)
  site_name = try(local.m995["site_name"], null)
  spine_pol_group_name = try(local.m995["spine_pol_group_name"], null)
  spine_profile_name = try(local.m995["spine_profile_name"], null)
  state = try(local.m995["state"], null)
  dynamic "ancestors" {
    for_each = try(local.m995["ancestors"], null) == null ? [] : local.m995["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m995["parent"], null) == null ? [] : local.m995["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m995["permission_resources"], null) == null ? [] : local.m995["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m995["registered_device"], null) == null ? [] : local.m995["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m995["tags"], null) == null ? [] : local.m995["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m995["version_context"], null) == null ? [] : local.m995["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
