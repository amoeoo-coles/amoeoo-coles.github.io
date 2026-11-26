# Sample resource intersight_topology_timeline_event — reads ../models/intersight_topology_timeline_event.yml
locals { m1393 = yamldecode(file("${path.module}/../models/intersight_topology_timeline_event.yml"))["intersight_topology_timeline_event"] }

resource "intersight_topology_timeline_event" "n1393" {
  account_moid = try(local.m1393["account_moid"], null)
  additional_properties = try(local.m1393["additional_properties"], null)
  ancestors = try(local.m1393["ancestors"], null)
  class_id = try(local.m1393["class_id"], null)
  create_time = try(local.m1393["create_time"], null)
  domain_group_moid = try(local.m1393["domain_group_moid"], null)
  end_time = try(local.m1393["end_time"], null)
  event_counts = try(local.m1393["event_counts"], null)
  granularity = try(local.m1393["granularity"], null)
  id = try(local.m1393["id"], null)
  mod_time = try(local.m1393["mod_time"], null)
  moid = try(local.m1393["moid"], null)
  object_type = try(local.m1393["object_type"], null)
  owners = try(local.m1393["owners"], null)
  parent = try(local.m1393["parent"], null)
  permission_resources = try(local.m1393["permission_resources"], null)
  shared_scope = try(local.m1393["shared_scope"], null)
  start_time = try(local.m1393["start_time"], null)
  tags = try(local.m1393["tags"], null)
  topology_moid = try(local.m1393["topology_moid"], null)
  topology_object_type = try(local.m1393["topology_object_type"], null)
  version_context = try(local.m1393["version_context"], null)
  view_type = try(local.m1393["view_type"], null)
}
