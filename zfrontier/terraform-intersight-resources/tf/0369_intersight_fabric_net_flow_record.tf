# Sample resource intersight_fabric_net_flow_record — reads ../models/intersight_fabric_net_flow_record.yml
locals { m369 = yamldecode(file("${path.module}/../models/intersight_fabric_net_flow_record.yml"))["intersight_fabric_net_flow_record"] }

resource "intersight_fabric_net_flow_record" "n369" {
  account_moid = try(local.m369["account_moid"], null)
  additional_properties = try(local.m369["additional_properties"], null)
  ancestors = try(local.m369["ancestors"], null)
  class_id = try(local.m369["class_id"], null)
  create_time = try(local.m369["create_time"], null)
  domain_group_moid = try(local.m369["domain_group_moid"], null)
  flow_non_key = try(var.secrets["intersight_fabric_net_flow_record.flow_non_key"], local.m369["flow_non_key"])
  id = try(local.m369["id"], null)
  ipv4_flow_key = try(var.secrets["intersight_fabric_net_flow_record.ipv4_flow_key"], local.m369["ipv4_flow_key"])
  ipv6_flow_key = try(var.secrets["intersight_fabric_net_flow_record.ipv6_flow_key"], local.m369["ipv6_flow_key"])
  l2_flow_key = try(var.secrets["intersight_fabric_net_flow_record.l2_flow_key"], local.m369["l2_flow_key"])
  mod_time = try(local.m369["mod_time"], null)
  moid = try(local.m369["moid"], null)
  name = try(local.m369["name"], null)
  net_flow_policy = try(local.m369["net_flow_policy"], null)
  netflow_monitors = try(local.m369["netflow_monitors"], null)
  object_type = try(local.m369["object_type"], null)
  owners = try(local.m369["owners"], null)
  parent = try(local.m369["parent"], null)
  permission_resources = try(local.m369["permission_resources"], null)
  record_type = try(local.m369["record_type"], null)
  shared_scope = try(local.m369["shared_scope"], null)
  tags = try(local.m369["tags"], null)
  version_context = try(local.m369["version_context"], null)
}
