# Sample resource intersight_fabric_net_flow_monitor — reads ../models/intersight_fabric_net_flow_monitor.yml
locals { m367 = yamldecode(file("${path.module}/../models/intersight_fabric_net_flow_monitor.yml"))["intersight_fabric_net_flow_monitor"] }

resource "intersight_fabric_net_flow_monitor" "n367" {
  account_moid = try(local.m367["account_moid"], null)
  additional_properties = try(local.m367["additional_properties"], null)
  ancestors = try(local.m367["ancestors"], null)
  class_id = try(local.m367["class_id"], null)
  create_time = try(local.m367["create_time"], null)
  domain_group_moid = try(local.m367["domain_group_moid"], null)
  flow_exporters = try(local.m367["flow_exporters"], null)
  flow_record = try(local.m367["flow_record"], null)
  id = try(local.m367["id"], null)
  mod_time = try(local.m367["mod_time"], null)
  moid = try(local.m367["moid"], null)
  name = try(local.m367["name"], null)
  net_flow_policy = try(local.m367["net_flow_policy"], null)
  object_type = try(local.m367["object_type"], null)
  owners = try(local.m367["owners"], null)
  parent = try(local.m367["parent"], null)
  permission_resources = try(local.m367["permission_resources"], null)
  shared_scope = try(local.m367["shared_scope"], null)
  tags = try(local.m367["tags"], null)
  version_context = try(local.m367["version_context"], null)
  vnic_usage_count = try(local.m367["vnic_usage_count"], null)
}
