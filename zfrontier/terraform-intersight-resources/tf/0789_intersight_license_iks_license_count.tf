# Sample resource intersight_license_iks_license_count — reads ../models/intersight_license_iks_license_count.yml
locals { m789 = yamldecode(file("${path.module}/../models/intersight_license_iks_license_count.yml"))["intersight_license_iks_license_count"] }

resource "intersight_license_iks_license_count" "n789" {
  account_license_data = try(local.m789["account_license_data"], null)
  account_moid = try(local.m789["account_moid"], null)
  additional_properties = try(local.m789["additional_properties"], null)
  advantage_count = try(local.m789["advantage_count"], null)
  ancestors = try(local.m789["ancestors"], null)
  class_id = try(local.m789["class_id"], null)
  create_time = try(local.m789["create_time"], null)
  domain_group_moid = try(local.m789["domain_group_moid"], null)
  id = try(local.m789["id"], null)
  mod_time = try(local.m789["mod_time"], null)
  moid = try(local.m789["moid"], null)
  object_type = try(local.m789["object_type"], null)
  owners = try(local.m789["owners"], null)
  parent = try(local.m789["parent"], null)
  permission_resources = try(local.m789["permission_resources"], null)
  shared_scope = try(local.m789["shared_scope"], null)
  tags = try(local.m789["tags"], null)
  version_context = try(local.m789["version_context"], null)
}
