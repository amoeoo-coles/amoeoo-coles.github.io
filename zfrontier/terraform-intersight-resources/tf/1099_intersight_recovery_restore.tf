# Sample resource intersight_recovery_restore — reads ../models/intersight_recovery_restore.yml
locals { m1099 = yamldecode(file("${path.module}/../models/intersight_recovery_restore.yml"))["intersight_recovery_restore"] }

resource "intersight_recovery_restore" "n1099" {
  account_moid = try(local.m1099["account_moid"], null)
  additional_properties = try(local.m1099["additional_properties"], null)
  ancestors = try(local.m1099["ancestors"], null)
  backup_info = try(local.m1099["backup_info"], null)
  class_id = try(local.m1099["class_id"], null)
  config_params = try(local.m1099["config_params"], null)
  create_time = try(local.m1099["create_time"], null)
  device = try(local.m1099["device"], null)
  domain_group_moid = try(local.m1099["domain_group_moid"], null)
  id = try(local.m1099["id"], null)
  mod_time = try(local.m1099["mod_time"], null)
  moid = try(local.m1099["moid"], null)
  object_type = try(local.m1099["object_type"], null)
  organization = try(local.m1099["organization"], null)
  owners = try(local.m1099["owners"], null)
  parent = try(local.m1099["parent"], null)
  permission_resources = try(local.m1099["permission_resources"], null)
  shared_scope = try(local.m1099["shared_scope"], null)
  tags = try(local.m1099["tags"], null)
  version_context = try(local.m1099["version_context"], null)
  wait_for_completion = try(local.m1099["wait_for_completion"], null)
  workflow = try(local.m1099["workflow"], null)
}
