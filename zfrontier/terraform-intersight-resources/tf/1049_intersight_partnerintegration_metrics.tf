# Sample resource intersight_partnerintegration_metrics — reads ../models/intersight_partnerintegration_metrics.yml
locals { m1049 = yamldecode(file("${path.module}/../models/intersight_partnerintegration_metrics.yml"))["intersight_partnerintegration_metrics"] }

resource "intersight_partnerintegration_metrics" "n1049" {
  account_moid = try(local.m1049["account_moid"], null)
  additional_properties = try(local.m1049["additional_properties"], null)
  ancestors = try(local.m1049["ancestors"], null)
  class_id = try(local.m1049["class_id"], null)
  create_time = try(local.m1049["create_time"], null)
  data = try(local.m1049["data"], null)
  domain_group_moid = try(local.m1049["domain_group_moid"], null)
  id = try(local.m1049["id"], null)
  inventory = try(local.m1049["inventory"], null)
  mod_time = try(local.m1049["mod_time"], null)
  moid = try(local.m1049["moid"], null)
  name = try(local.m1049["name"], null)
  object_type = try(local.m1049["object_type"], null)
  owners = try(local.m1049["owners"], null)
  parent = try(local.m1049["parent"], null)
  permission_resources = try(local.m1049["permission_resources"], null)
  shared_scope = try(local.m1049["shared_scope"], null)
  tags = try(local.m1049["tags"], null)
  version_context = try(local.m1049["version_context"], null)
}
