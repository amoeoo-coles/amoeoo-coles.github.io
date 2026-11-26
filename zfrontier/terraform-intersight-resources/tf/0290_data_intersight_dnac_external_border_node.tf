# Sample data source intersight_dnac_external_border_node — reads ../models/data_intersight_dnac_external_border_node.yml
locals { m290 = yamldecode(file("${path.module}/../models/data_intersight_dnac_external_border_node.yml"))["data_intersight_dnac_external_border_node"] }

data "intersight_dnac_external_border_node" "n290" {
  account_moid = try(local.m290["account_moid"], null)
  additional_properties = try(local.m290["additional_properties"], null)
  class_id = try(local.m290["class_id"], null)
  create_time = try(local.m290["create_time"], null)
  domain_group_moid = try(local.m290["domain_group_moid"], null)
  external_border_node_id = try(local.m290["external_border_node_id"], null)
  external_border_node_name = try(local.m290["external_border_node_name"], null)
  fabric_site_id = try(local.m290["fabric_site_id"], null)
  id = try(local.m290["id"], null)
  import_external_routes = try(local.m290["import_external_routes"], null)
  mod_time = try(local.m290["mod_time"], null)
  moid = try(local.m290["moid"], null)
  object_type = try(local.m290["object_type"], null)
  owners = try(local.m290["owners"], null)
  results = try(local.m290["results"], null)
  roles = try(local.m290["roles"], null)
  shared_scope = try(local.m290["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m290["ancestors"], null) == null ? [] : local.m290["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m290["parent"], null) == null ? [] : local.m290["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m290["permission_resources"], null) == null ? [] : local.m290["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m290["registered_device"], null) == null ? [] : local.m290["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m290["tags"], null) == null ? [] : local.m290["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m290["version_context"], null) == null ? [] : local.m290["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
