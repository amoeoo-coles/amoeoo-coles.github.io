# Sample resource intersight_fabric_estimate_impact — reads ../models/intersight_fabric_estimate_impact.yml
locals { m349 = yamldecode(file("${path.module}/../models/intersight_fabric_estimate_impact.yml"))["intersight_fabric_estimate_impact"] }

resource "intersight_fabric_estimate_impact" "n349" {
  account_moid = try(local.m349["account_moid"], null)
  additional_properties = try(local.m349["additional_properties"], null)
  ancestors = try(local.m349["ancestors"], null)
  class_id = try(local.m349["class_id"], null)
  create_time = try(local.m349["create_time"], null)
  domain_group_moid = try(local.m349["domain_group_moid"], null)
  id = try(local.m349["id"], null)
  mod_time = try(local.m349["mod_time"], null)
  moid = try(local.m349["moid"], null)
  object_type = try(local.m349["object_type"], null)
  owners = try(local.m349["owners"], null)
  parent = try(local.m349["parent"], null)
  permission_resources = try(local.m349["permission_resources"], null)
  profile = try(local.m349["profile"], null)
  shared_scope = try(local.m349["shared_scope"], null)
  tags = try(local.m349["tags"], null)
  version_context = try(local.m349["version_context"], null)
}
