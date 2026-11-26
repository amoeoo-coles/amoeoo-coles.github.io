# Sample resource intersight_fabric_span_source_vlan — reads ../models/intersight_fabric_span_source_vlan.yml
locals { m383 = yamldecode(file("${path.module}/../models/intersight_fabric_span_source_vlan.yml"))["intersight_fabric_span_source_vlan"] }

resource "intersight_fabric_span_source_vlan" "n383" {
  account_moid = try(local.m383["account_moid"], null)
  additional_properties = try(local.m383["additional_properties"], null)
  ancestors = try(local.m383["ancestors"], null)
  class_id = try(local.m383["class_id"], null)
  create_time = try(local.m383["create_time"], null)
  direction = try(local.m383["direction"], null)
  domain_group_moid = try(local.m383["domain_group_moid"], null)
  id = try(local.m383["id"], null)
  mod_time = try(local.m383["mod_time"], null)
  moid = try(local.m383["moid"], null)
  object_type = try(local.m383["object_type"], null)
  owners = try(local.m383["owners"], null)
  parent = try(local.m383["parent"], null)
  permission_resources = try(local.m383["permission_resources"], null)
  shared_scope = try(local.m383["shared_scope"], null)
  span_session = try(local.m383["span_session"], null)
  tags = try(local.m383["tags"], null)
  version_context = try(local.m383["version_context"], null)
  vlan_id = try(local.m383["vlan_id"], null)
}
