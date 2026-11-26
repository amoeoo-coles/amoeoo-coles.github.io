# Sample resource intersight_hyperflex_auto_support_policy — reads ../models/intersight_hyperflex_auto_support_policy.yml
locals { m552 = yamldecode(file("${path.module}/../models/intersight_hyperflex_auto_support_policy.yml"))["intersight_hyperflex_auto_support_policy"] }

resource "intersight_hyperflex_auto_support_policy" "n552" {
  account_moid = try(local.m552["account_moid"], null)
  additional_properties = try(local.m552["additional_properties"], null)
  admin_state = try(local.m552["admin_state"], null)
  ancestors = try(local.m552["ancestors"], null)
  class_id = try(local.m552["class_id"], null)
  cluster_profiles = try(local.m552["cluster_profiles"], null)
  create_time = try(local.m552["create_time"], null)
  description = try(local.m552["description"], null)
  domain_group_moid = try(local.m552["domain_group_moid"], null)
  id = try(local.m552["id"], null)
  mod_time = try(local.m552["mod_time"], null)
  moid = try(local.m552["moid"], null)
  name = try(local.m552["name"], null)
  object_type = try(local.m552["object_type"], null)
  organization = try(local.m552["organization"], null)
  owners = try(local.m552["owners"], null)
  parent = try(local.m552["parent"], null)
  permission_resources = try(local.m552["permission_resources"], null)
  service_ticket_receipient = try(local.m552["service_ticket_receipient"], null)
  shared_scope = try(local.m552["shared_scope"], null)
  tags = try(local.m552["tags"], null)
  version_context = try(local.m552["version_context"], null)
}
