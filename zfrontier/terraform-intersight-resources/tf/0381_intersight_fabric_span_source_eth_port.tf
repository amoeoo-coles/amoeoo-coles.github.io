# Sample resource intersight_fabric_span_source_eth_port — reads ../models/intersight_fabric_span_source_eth_port.yml
locals { m381 = yamldecode(file("${path.module}/../models/intersight_fabric_span_source_eth_port.yml"))["intersight_fabric_span_source_eth_port"] }

resource "intersight_fabric_span_source_eth_port" "n381" {
  account_moid = try(local.m381["account_moid"], null)
  additional_properties = try(local.m381["additional_properties"], null)
  aggregate_port_id = try(local.m381["aggregate_port_id"], null)
  ancestors = try(local.m381["ancestors"], null)
  class_id = try(local.m381["class_id"], null)
  create_time = try(local.m381["create_time"], null)
  direction = try(local.m381["direction"], null)
  domain_group_moid = try(local.m381["domain_group_moid"], null)
  id = try(local.m381["id"], null)
  mod_time = try(local.m381["mod_time"], null)
  moid = try(local.m381["moid"], null)
  object_type = try(local.m381["object_type"], null)
  owners = try(local.m381["owners"], null)
  parent = try(local.m381["parent"], null)
  permission_resources = try(local.m381["permission_resources"], null)
  physical_port = try(local.m381["physical_port"], null)
  port_id = try(local.m381["port_id"], null)
  shared_scope = try(local.m381["shared_scope"], null)
  slot_id = try(local.m381["slot_id"], null)
  source_role = try(local.m381["source_role"], null)
  span_session = try(local.m381["span_session"], null)
  tags = try(local.m381["tags"], null)
  version_context = try(local.m381["version_context"], null)
}
