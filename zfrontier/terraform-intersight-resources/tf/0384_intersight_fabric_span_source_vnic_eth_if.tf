# Sample resource intersight_fabric_span_source_vnic_eth_if — reads ../models/intersight_fabric_span_source_vnic_eth_if.yml
locals { m384 = yamldecode(file("${path.module}/../models/intersight_fabric_span_source_vnic_eth_if.yml"))["intersight_fabric_span_source_vnic_eth_if"] }

resource "intersight_fabric_span_source_vnic_eth_if" "n384" {
  account_moid = try(local.m384["account_moid"], null)
  additional_properties = try(local.m384["additional_properties"], null)
  ancestors = try(local.m384["ancestors"], null)
  class_id = try(local.m384["class_id"], null)
  create_time = try(local.m384["create_time"], null)
  direction = try(local.m384["direction"], null)
  domain_group_moid = try(local.m384["domain_group_moid"], null)
  id = try(local.m384["id"], null)
  mod_time = try(local.m384["mod_time"], null)
  moid = try(local.m384["moid"], null)
  name = try(local.m384["name"], null)
  object_type = try(local.m384["object_type"], null)
  owners = try(local.m384["owners"], null)
  parent = try(local.m384["parent"], null)
  permission_resources = try(local.m384["permission_resources"], null)
  shared_scope = try(local.m384["shared_scope"], null)
  span_session = try(local.m384["span_session"], null)
  tags = try(local.m384["tags"], null)
  version_context = try(local.m384["version_context"], null)
  vif_id = try(local.m384["vif_id"], null)
  vnic = try(local.m384["vnic"], null)
}
