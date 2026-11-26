# Sample resource intersight_hyperflex_ext_iscsi_storage_policy — reads ../models/intersight_hyperflex_ext_iscsi_storage_policy.yml
locals { m562 = yamldecode(file("${path.module}/../models/intersight_hyperflex_ext_iscsi_storage_policy.yml"))["intersight_hyperflex_ext_iscsi_storage_policy"] }

resource "intersight_hyperflex_ext_iscsi_storage_policy" "n562" {
  account_moid = try(local.m562["account_moid"], null)
  additional_properties = try(local.m562["additional_properties"], null)
  admin_state = try(local.m562["admin_state"], null)
  ancestors = try(local.m562["ancestors"], null)
  class_id = try(local.m562["class_id"], null)
  cluster_profiles = try(local.m562["cluster_profiles"], null)
  create_time = try(local.m562["create_time"], null)
  description = try(local.m562["description"], null)
  domain_group_moid = try(local.m562["domain_group_moid"], null)
  exta_traffic = try(local.m562["exta_traffic"], null)
  extb_traffic = try(local.m562["extb_traffic"], null)
  id = try(local.m562["id"], null)
  mod_time = try(local.m562["mod_time"], null)
  moid = try(local.m562["moid"], null)
  name = try(local.m562["name"], null)
  object_type = try(local.m562["object_type"], null)
  organization = try(local.m562["organization"], null)
  owners = try(local.m562["owners"], null)
  parent = try(local.m562["parent"], null)
  permission_resources = try(local.m562["permission_resources"], null)
  shared_scope = try(local.m562["shared_scope"], null)
  tags = try(local.m562["tags"], null)
  version_context = try(local.m562["version_context"], null)
}
