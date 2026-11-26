# Sample data source intersight_fabric_vsan — reads ../models/data_intersight_fabric_vsan.yml
locals { m450 = yamldecode(file("${path.module}/../models/data_intersight_fabric_vsan.yml"))["data_intersight_fabric_vsan"] }

data "intersight_fabric_vsan" "n450" {
  account_moid = try(local.m450["account_moid"], null)
  additional_properties = try(local.m450["additional_properties"], null)
  class_id = try(local.m450["class_id"], null)
  create_time = try(local.m450["create_time"], null)
  default_zoning = try(local.m450["default_zoning"], null)
  domain_group_moid = try(local.m450["domain_group_moid"], null)
  fc_zone_sharing_mode = try(local.m450["fc_zone_sharing_mode"], null)
  fcoe_vlan = try(local.m450["fcoe_vlan"], null)
  id = try(local.m450["id"], null)
  mod_time = try(local.m450["mod_time"], null)
  moid = try(local.m450["moid"], null)
  name = try(local.m450["name"], null)
  object_type = try(local.m450["object_type"], null)
  owners = try(local.m450["owners"], null)
  results = try(local.m450["results"], null)
  shared_scope = try(local.m450["shared_scope"], null)
  vsan_id = try(local.m450["vsan_id"], null)
  vsan_scope = try(local.m450["vsan_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m450["ancestors"], null) == null ? [] : local.m450["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_network_policy" {
    for_each = try(local.m450["fc_network_policy"], null) == null ? [] : local.m450["fc_network_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m450["parent"], null) == null ? [] : local.m450["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m450["permission_resources"], null) == null ? [] : local.m450["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m450["tags"], null) == null ? [] : local.m450["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m450["version_context"], null) == null ? [] : local.m450["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
