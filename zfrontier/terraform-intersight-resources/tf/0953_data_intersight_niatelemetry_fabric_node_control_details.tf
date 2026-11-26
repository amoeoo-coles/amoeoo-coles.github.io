# Sample data source intersight_niatelemetry_fabric_node_control_details — reads ../models/data_intersight_niatelemetry_fabric_node_control_details.yml
locals { m953 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_fabric_node_control_details.yml"))["data_intersight_niatelemetry_fabric_node_control_details"] }

data "intersight_niatelemetry_fabric_node_control_details" "n953" {
  account_moid = try(local.m953["account_moid"], null)
  additional_properties = try(local.m953["additional_properties"], null)
  class_id = try(local.m953["class_id"], null)
  create_time = try(local.m953["create_time"], null)
  dn = try(local.m953["dn"], null)
  domain_group_moid = try(local.m953["domain_group_moid"], null)
  feature_sel = try(local.m953["feature_sel"], null)
  id = try(local.m953["id"], null)
  mod_time = try(local.m953["mod_time"], null)
  moid = try(local.m953["moid"], null)
  object_type = try(local.m953["object_type"], null)
  owners = try(local.m953["owners"], null)
  record_type = try(local.m953["record_type"], null)
  record_version = try(local.m953["record_version"], null)
  results = try(local.m953["results"], null)
  shared_scope = try(local.m953["shared_scope"], null)
  site_name = try(local.m953["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m953["ancestors"], null) == null ? [] : local.m953["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m953["parent"], null) == null ? [] : local.m953["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m953["permission_resources"], null) == null ? [] : local.m953["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m953["registered_device"], null) == null ? [] : local.m953["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m953["tags"], null) == null ? [] : local.m953["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m953["version_context"], null) == null ? [] : local.m953["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
