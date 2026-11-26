# Sample data source intersight_vnic_san_connectivity_policy — reads ../models/data_intersight_vnic_san_connectivity_policy.yml
locals { m1482 = yamldecode(file("${path.module}/../models/data_intersight_vnic_san_connectivity_policy.yml"))["data_intersight_vnic_san_connectivity_policy"] }

data "intersight_vnic_san_connectivity_policy" "n1482" {
  account_moid = try(local.m1482["account_moid"], null)
  additional_properties = try(local.m1482["additional_properties"], null)
  class_id = try(local.m1482["class_id"], null)
  create_time = try(local.m1482["create_time"], null)
  description = try(local.m1482["description"], null)
  domain_group_moid = try(local.m1482["domain_group_moid"], null)
  id = try(local.m1482["id"], null)
  mod_time = try(local.m1482["mod_time"], null)
  moid = try(local.m1482["moid"], null)
  name = try(local.m1482["name"], null)
  object_type = try(local.m1482["object_type"], null)
  owners = try(local.m1482["owners"], null)
  placement_mode = try(local.m1482["placement_mode"], null)
  results = try(local.m1482["results"], null)
  shared_scope = try(local.m1482["shared_scope"], null)
  static_wwnn_address = try(local.m1482["static_wwnn_address"], null)
  target_platform = try(local.m1482["target_platform"], null)
  wwnn_address_type = try(local.m1482["wwnn_address_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1482["ancestors"], null) == null ? [] : local.m1482["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_ifs" {
    for_each = try(local.m1482["fc_ifs"], null) == null ? [] : local.m1482["fc_ifs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1482["organization"], null) == null ? [] : local.m1482["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1482["parent"], null) == null ? [] : local.m1482["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1482["permission_resources"], null) == null ? [] : local.m1482["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1482["profiles"], null) == null ? [] : local.m1482["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1482["tags"], null) == null ? [] : local.m1482["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1482["version_context"], null) == null ? [] : local.m1482["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "wwnn_pool" {
    for_each = try(local.m1482["wwnn_pool"], null) == null ? [] : local.m1482["wwnn_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
