# Sample resource intersight_recovery_schedule_config_policy — reads ../models/intersight_recovery_schedule_config_policy.yml
locals { m1100 = yamldecode(file("${path.module}/../models/intersight_recovery_schedule_config_policy.yml"))["intersight_recovery_schedule_config_policy"] }

resource "intersight_recovery_schedule_config_policy" "n1100" {
  account_moid = try(local.m1100["account_moid"], null)
  additional_properties = try(local.m1100["additional_properties"], null)
  ancestors = try(local.m1100["ancestors"], null)
  backup_profiles = try(local.m1100["backup_profiles"], null)
  class_id = try(local.m1100["class_id"], null)
  create_time = try(local.m1100["create_time"], null)
  description = try(local.m1100["description"], null)
  domain_group_moid = try(local.m1100["domain_group_moid"], null)
  id = try(local.m1100["id"], null)
  mod_time = try(local.m1100["mod_time"], null)
  moid = try(local.m1100["moid"], null)
  name = try(local.m1100["name"], null)
  object_type = try(local.m1100["object_type"], null)
  organization = try(local.m1100["organization"], null)
  owners = try(local.m1100["owners"], null)
  parent = try(local.m1100["parent"], null)
  permission_resources = try(local.m1100["permission_resources"], null)
  schedule = try(local.m1100["schedule"], null)
  shared_scope = try(local.m1100["shared_scope"], null)
  tags = try(local.m1100["tags"], null)
  version_context = try(local.m1100["version_context"], null)
}
