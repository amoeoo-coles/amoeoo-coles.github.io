# Sample resource intersight_boot_precision_policy — reads ../models/intersight_boot_precision_policy.yml
locals { m112 = yamldecode(file("${path.module}/../models/intersight_boot_precision_policy.yml"))["intersight_boot_precision_policy"] }

resource "intersight_boot_precision_policy" "n112" {
  account_moid = try(local.m112["account_moid"], null)
  additional_properties = try(local.m112["additional_properties"], null)
  ancestors = try(local.m112["ancestors"], null)
  boot_devices = try(local.m112["boot_devices"], null)
  class_id = try(local.m112["class_id"], null)
  configured_boot_mode = try(local.m112["configured_boot_mode"], null)
  create_time = try(local.m112["create_time"], null)
  description = try(local.m112["description"], null)
  domain_group_moid = try(local.m112["domain_group_moid"], null)
  enable_boot_migration_support = try(local.m112["enable_boot_migration_support"], null)
  enforce_uefi_secure_boot = try(local.m112["enforce_uefi_secure_boot"], null)
  id = try(local.m112["id"], null)
  mod_time = try(local.m112["mod_time"], null)
  moid = try(local.m112["moid"], null)
  name = try(local.m112["name"], null)
  object_type = try(local.m112["object_type"], null)
  organization = try(local.m112["organization"], null)
  owners = try(local.m112["owners"], null)
  parent = try(local.m112["parent"], null)
  permission_resources = try(local.m112["permission_resources"], null)
  profiles = try(local.m112["profiles"], null)
  shared_scope = try(local.m112["shared_scope"], null)
  tags = try(local.m112["tags"], null)
  version_context = try(local.m112["version_context"], null)
}
