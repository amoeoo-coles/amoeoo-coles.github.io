# Sample resource intersight_chassis_config_import — reads ../models/intersight_chassis_config_import.yml
locals { m212 = yamldecode(file("${path.module}/../models/intersight_chassis_config_import.yml"))["intersight_chassis_config_import"] }

resource "intersight_chassis_config_import" "n212" {
  account_moid = try(local.m212["account_moid"], null)
  additional_properties = try(local.m212["additional_properties"], null)
  ancestors = try(local.m212["ancestors"], null)
  chassis = try(local.m212["chassis"], null)
  chassis_profile = try(local.m212["chassis_profile"], null)
  class_id = try(local.m212["class_id"], null)
  create_time = try(local.m212["create_time"], null)
  description = try(local.m212["description"], null)
  domain_group_moid = try(local.m212["domain_group_moid"], null)
  id = try(local.m212["id"], null)
  mod_time = try(local.m212["mod_time"], null)
  moid = try(local.m212["moid"], null)
  object_type = try(local.m212["object_type"], null)
  organization = try(local.m212["organization"], null)
  owners = try(local.m212["owners"], null)
  parent = try(local.m212["parent"], null)
  permission_resources = try(local.m212["permission_resources"], null)
  policy_prefix = try(local.m212["policy_prefix"], null)
  policy_types = try(local.m212["policy_types"], null)
  profile_name = try(local.m212["profile_name"], null)
  shared_scope = try(local.m212["shared_scope"], null)
  tags = try(local.m212["tags"], null)
  version_context = try(local.m212["version_context"], null)
}
