# Sample resource intersight_sdcard_policy — reads ../models/intersight_sdcard_policy.yml
locals { m1141 = yamldecode(file("${path.module}/../models/intersight_sdcard_policy.yml"))["intersight_sdcard_policy"] }

resource "intersight_sdcard_policy" "n1141" {
  account_moid = try(local.m1141["account_moid"], null)
  additional_properties = try(local.m1141["additional_properties"], null)
  ancestors = try(local.m1141["ancestors"], null)
  class_id = try(local.m1141["class_id"], null)
  create_time = try(local.m1141["create_time"], null)
  description = try(local.m1141["description"], null)
  domain_group_moid = try(local.m1141["domain_group_moid"], null)
  id = try(local.m1141["id"], null)
  mod_time = try(local.m1141["mod_time"], null)
  moid = try(local.m1141["moid"], null)
  name = try(local.m1141["name"], null)
  object_type = try(local.m1141["object_type"], null)
  organization = try(local.m1141["organization"], null)
  owners = try(local.m1141["owners"], null)
  parent = try(local.m1141["parent"], null)
  partitions = try(local.m1141["partitions"], null)
  permission_resources = try(local.m1141["permission_resources"], null)
  profiles = try(local.m1141["profiles"], null)
  shared_scope = try(local.m1141["shared_scope"], null)
  tags = try(local.m1141["tags"], null)
  version_context = try(local.m1141["version_context"], null)
}
