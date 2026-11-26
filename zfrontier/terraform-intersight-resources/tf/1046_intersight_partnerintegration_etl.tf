# Sample resource intersight_partnerintegration_etl — reads ../models/intersight_partnerintegration_etl.yml
locals { m1046 = yamldecode(file("${path.module}/../models/intersight_partnerintegration_etl.yml"))["intersight_partnerintegration_etl"] }

resource "intersight_partnerintegration_etl" "n1046" {
  account_moid = try(local.m1046["account_moid"], null)
  additional_properties = try(local.m1046["additional_properties"], null)
  ancestors = try(local.m1046["ancestors"], null)
  class_id = try(local.m1046["class_id"], null)
  create_time = try(local.m1046["create_time"], null)
  data = try(local.m1046["data"], null)
  domain_group_moid = try(local.m1046["domain_group_moid"], null)
  id = try(local.m1046["id"], null)
  inventory = try(local.m1046["inventory"], null)
  mod_time = try(local.m1046["mod_time"], null)
  moid = try(local.m1046["moid"], null)
  name = try(local.m1046["name"], null)
  object_type = try(local.m1046["object_type"], null)
  owners = try(local.m1046["owners"], null)
  parent = try(local.m1046["parent"], null)
  permission_resources = try(local.m1046["permission_resources"], null)
  shared_scope = try(local.m1046["shared_scope"], null)
  tags = try(local.m1046["tags"], null)
  version_context = try(local.m1046["version_context"], null)
}
