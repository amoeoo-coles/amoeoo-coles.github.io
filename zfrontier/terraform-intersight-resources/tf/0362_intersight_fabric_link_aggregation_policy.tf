# Sample resource intersight_fabric_link_aggregation_policy — reads ../models/intersight_fabric_link_aggregation_policy.yml
locals { m362 = yamldecode(file("${path.module}/../models/intersight_fabric_link_aggregation_policy.yml"))["intersight_fabric_link_aggregation_policy"] }

resource "intersight_fabric_link_aggregation_policy" "n362" {
  account_moid = try(local.m362["account_moid"], null)
  additional_properties = try(local.m362["additional_properties"], null)
  ancestors = try(local.m362["ancestors"], null)
  class_id = try(local.m362["class_id"], null)
  create_time = try(local.m362["create_time"], null)
  description = try(local.m362["description"], null)
  domain_group_moid = try(local.m362["domain_group_moid"], null)
  id = try(local.m362["id"], null)
  lacp_rate = try(local.m362["lacp_rate"], null)
  mod_time = try(local.m362["mod_time"], null)
  moid = try(local.m362["moid"], null)
  name = try(local.m362["name"], null)
  object_type = try(local.m362["object_type"], null)
  organization = try(local.m362["organization"], null)
  owners = try(local.m362["owners"], null)
  parent = try(local.m362["parent"], null)
  permission_resources = try(local.m362["permission_resources"], null)
  shared_scope = try(local.m362["shared_scope"], null)
  suspend_individual = try(local.m362["suspend_individual"], null)
  tags = try(local.m362["tags"], null)
  version_context = try(local.m362["version_context"], null)
}
