# Sample resource intersight_vrf_vrf — reads ../models/intersight_vrf_vrf.yml
locals { m1491 = yamldecode(file("${path.module}/../models/intersight_vrf_vrf.yml"))["intersight_vrf_vrf"] }

resource "intersight_vrf_vrf" "n1491" {
  account = try(local.m1491["account"], null)
  account_moid = try(local.m1491["account_moid"], null)
  additional_properties = try(local.m1491["additional_properties"], null)
  ancestors = try(local.m1491["ancestors"], null)
  class_id = try(local.m1491["class_id"], null)
  create_time = try(local.m1491["create_time"], null)
  description = try(local.m1491["description"], null)
  domain_group_moid = try(local.m1491["domain_group_moid"], null)
  id = try(local.m1491["id"], null)
  mod_time = try(local.m1491["mod_time"], null)
  moid = try(local.m1491["moid"], null)
  name = try(local.m1491["name"], null)
  object_type = try(local.m1491["object_type"], null)
  owners = try(local.m1491["owners"], null)
  parent = try(local.m1491["parent"], null)
  permission_resources = try(local.m1491["permission_resources"], null)
  shared_scope = try(local.m1491["shared_scope"], null)
  tags = try(local.m1491["tags"], null)
  version_context = try(local.m1491["version_context"], null)
}
