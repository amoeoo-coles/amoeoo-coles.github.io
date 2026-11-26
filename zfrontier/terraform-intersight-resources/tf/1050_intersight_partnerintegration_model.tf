# Sample resource intersight_partnerintegration_model — reads ../models/intersight_partnerintegration_model.yml
locals { m1050 = yamldecode(file("${path.module}/../models/intersight_partnerintegration_model.yml"))["intersight_partnerintegration_model"] }

resource "intersight_partnerintegration_model" "n1050" {
  account_moid = try(local.m1050["account_moid"], null)
  additional_properties = try(local.m1050["additional_properties"], null)
  ancestors = try(local.m1050["ancestors"], null)
  class_id = try(local.m1050["class_id"], null)
  create_time = try(local.m1050["create_time"], null)
  data = try(local.m1050["data"], null)
  domain_group_moid = try(local.m1050["domain_group_moid"], null)
  id = try(local.m1050["id"], null)
  inventory = try(local.m1050["inventory"], null)
  mod_time = try(local.m1050["mod_time"], null)
  moid = try(local.m1050["moid"], null)
  name = try(local.m1050["name"], null)
  object_type = try(local.m1050["object_type"], null)
  owners = try(local.m1050["owners"], null)
  parent = try(local.m1050["parent"], null)
  permission_resources = try(local.m1050["permission_resources"], null)
  shared_scope = try(local.m1050["shared_scope"], null)
  tags = try(local.m1050["tags"], null)
  version_context = try(local.m1050["version_context"], null)
}
