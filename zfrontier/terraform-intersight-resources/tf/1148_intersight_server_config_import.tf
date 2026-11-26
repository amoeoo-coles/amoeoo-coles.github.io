# Sample resource intersight_server_config_import — reads ../models/intersight_server_config_import.yml
locals { m1148 = yamldecode(file("${path.module}/../models/intersight_server_config_import.yml"))["intersight_server_config_import"] }

resource "intersight_server_config_import" "n1148" {
  account_moid = try(local.m1148["account_moid"], null)
  additional_properties = try(local.m1148["additional_properties"], null)
  ancestors = try(local.m1148["ancestors"], null)
  class_id = try(local.m1148["class_id"], null)
  create_time = try(local.m1148["create_time"], null)
  description = try(local.m1148["description"], null)
  domain_group_moid = try(local.m1148["domain_group_moid"], null)
  id = try(local.m1148["id"], null)
  mod_time = try(local.m1148["mod_time"], null)
  moid = try(local.m1148["moid"], null)
  object_type = try(local.m1148["object_type"], null)
  organization = try(local.m1148["organization"], null)
  owners = try(local.m1148["owners"], null)
  parent = try(local.m1148["parent"], null)
  permission_resources = try(local.m1148["permission_resources"], null)
  policy_prefix = try(local.m1148["policy_prefix"], null)
  policy_types = try(local.m1148["policy_types"], null)
  profile_name = try(local.m1148["profile_name"], null)
  server = try(local.m1148["server"], null)
  server_profile = try(local.m1148["server_profile"], null)
  shared_scope = try(local.m1148["shared_scope"], null)
  tags = try(local.m1148["tags"], null)
  version_context = try(local.m1148["version_context"], null)
}
