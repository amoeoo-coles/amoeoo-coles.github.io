# Sample resource intersight_storage_drive_security_policy — reads ../models/intersight_storage_drive_security_policy.yml
locals { m1216 = yamldecode(file("${path.module}/../models/intersight_storage_drive_security_policy.yml"))["intersight_storage_drive_security_policy"] }

resource "intersight_storage_drive_security_policy" "n1216" {
  account_moid = try(local.m1216["account_moid"], null)
  additional_properties = try(local.m1216["additional_properties"], null)
  ancestors = try(local.m1216["ancestors"], null)
  class_id = try(local.m1216["class_id"], null)
  create_time = try(local.m1216["create_time"], null)
  description = try(local.m1216["description"], null)
  domain_group_moid = try(local.m1216["domain_group_moid"], null)
  id = try(local.m1216["id"], null)
  key_setting = try(local.m1216["key_setting"], null)
  mod_time = try(local.m1216["mod_time"], null)
  moid = try(local.m1216["moid"], null)
  name = try(local.m1216["name"], null)
  object_type = try(local.m1216["object_type"], null)
  organization = try(local.m1216["organization"], null)
  owners = try(local.m1216["owners"], null)
  parent = try(local.m1216["parent"], null)
  permission_resources = try(local.m1216["permission_resources"], null)
  profiles = try(local.m1216["profiles"], null)
  shared_scope = try(local.m1216["shared_scope"], null)
  tags = try(local.m1216["tags"], null)
  version_context = try(local.m1216["version_context"], null)
}
