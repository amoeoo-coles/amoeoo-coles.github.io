# Sample resource intersight_fabric_span_source_eth_port_channel — reads ../models/intersight_fabric_span_source_eth_port_channel.yml
locals { m382 = yamldecode(file("${path.module}/../models/intersight_fabric_span_source_eth_port_channel.yml"))["intersight_fabric_span_source_eth_port_channel"] }

resource "intersight_fabric_span_source_eth_port_channel" "n382" {
  account_moid = try(local.m382["account_moid"], null)
  additional_properties = try(local.m382["additional_properties"], null)
  ancestors = try(local.m382["ancestors"], null)
  class_id = try(local.m382["class_id"], null)
  create_time = try(local.m382["create_time"], null)
  direction = try(local.m382["direction"], null)
  domain_group_moid = try(local.m382["domain_group_moid"], null)
  id = try(local.m382["id"], null)
  mod_time = try(local.m382["mod_time"], null)
  moid = try(local.m382["moid"], null)
  object_type = try(local.m382["object_type"], null)
  owners = try(local.m382["owners"], null)
  parent = try(local.m382["parent"], null)
  pc_id = try(local.m382["pc_id"], null)
  permission_resources = try(local.m382["permission_resources"], null)
  physical_port_channel = try(local.m382["physical_port_channel"], null)
  shared_scope = try(local.m382["shared_scope"], null)
  source_role = try(local.m382["source_role"], null)
  span_session = try(local.m382["span_session"], null)
  tags = try(local.m382["tags"], null)
  version_context = try(local.m382["version_context"], null)
}
