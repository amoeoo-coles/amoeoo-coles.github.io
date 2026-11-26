# Sample resource intersight_fabric_span_dest_eth_port — reads ../models/intersight_fabric_span_dest_eth_port.yml
locals { m378 = yamldecode(file("${path.module}/../models/intersight_fabric_span_dest_eth_port.yml"))["intersight_fabric_span_dest_eth_port"] }

resource "intersight_fabric_span_dest_eth_port" "n378" {
  account_moid = try(local.m378["account_moid"], null)
  additional_properties = try(local.m378["additional_properties"], null)
  admin_speed = try(local.m378["admin_speed"], null)
  aggregate_port_id = try(local.m378["aggregate_port_id"], null)
  ancestors = try(local.m378["ancestors"], null)
  class_id = try(local.m378["class_id"], null)
  create_time = try(local.m378["create_time"], null)
  domain_group_moid = try(local.m378["domain_group_moid"], null)
  fec = try(local.m378["fec"], null)
  id = try(local.m378["id"], null)
  mod_time = try(local.m378["mod_time"], null)
  moid = try(local.m378["moid"], null)
  object_type = try(local.m378["object_type"], null)
  owners = try(local.m378["owners"], null)
  parent = try(local.m378["parent"], null)
  permission_resources = try(local.m378["permission_resources"], null)
  physical_port = try(local.m378["physical_port"], null)
  port_id = try(local.m378["port_id"], null)
  shared_scope = try(local.m378["shared_scope"], null)
  slot_id = try(local.m378["slot_id"], null)
  span_session = try(local.m378["span_session"], null)
  tags = try(local.m378["tags"], null)
  version_context = try(local.m378["version_context"], null)
}
