# Sample resource intersight_hyperflex_ext_fc_storage_policy — reads ../models/intersight_hyperflex_ext_fc_storage_policy.yml
locals { m561 = yamldecode(file("${path.module}/../models/intersight_hyperflex_ext_fc_storage_policy.yml"))["intersight_hyperflex_ext_fc_storage_policy"] }

resource "intersight_hyperflex_ext_fc_storage_policy" "n561" {
  account_moid = try(local.m561["account_moid"], null)
  additional_properties = try(local.m561["additional_properties"], null)
  admin_state = try(local.m561["admin_state"], null)
  ancestors = try(local.m561["ancestors"], null)
  class_id = try(local.m561["class_id"], null)
  cluster_profiles = try(local.m561["cluster_profiles"], null)
  create_time = try(local.m561["create_time"], null)
  description = try(local.m561["description"], null)
  domain_group_moid = try(local.m561["domain_group_moid"], null)
  exta_traffic = try(local.m561["exta_traffic"], null)
  extb_traffic = try(local.m561["extb_traffic"], null)
  id = try(local.m561["id"], null)
  mod_time = try(local.m561["mod_time"], null)
  moid = try(local.m561["moid"], null)
  name = try(local.m561["name"], null)
  object_type = try(local.m561["object_type"], null)
  organization = try(local.m561["organization"], null)
  owners = try(local.m561["owners"], null)
  parent = try(local.m561["parent"], null)
  permission_resources = try(local.m561["permission_resources"], null)
  shared_scope = try(local.m561["shared_scope"], null)
  tags = try(local.m561["tags"], null)
  version_context = try(local.m561["version_context"], null)
  wwxn_prefix_range = try(local.m561["wwxn_prefix_range"], null)
}
