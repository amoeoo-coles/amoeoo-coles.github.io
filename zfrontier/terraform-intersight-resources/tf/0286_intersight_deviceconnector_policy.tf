# Sample resource intersight_deviceconnector_policy — reads ../models/intersight_deviceconnector_policy.yml
locals { m286 = yamldecode(file("${path.module}/../models/intersight_deviceconnector_policy.yml"))["intersight_deviceconnector_policy"] }

resource "intersight_deviceconnector_policy" "n286" {
  account_moid = try(local.m286["account_moid"], null)
  additional_properties = try(local.m286["additional_properties"], null)
  ancestors = try(local.m286["ancestors"], null)
  class_id = try(local.m286["class_id"], null)
  create_time = try(local.m286["create_time"], null)
  description = try(local.m286["description"], null)
  domain_group_moid = try(local.m286["domain_group_moid"], null)
  id = try(local.m286["id"], null)
  lockout_enabled = try(local.m286["lockout_enabled"], null)
  mod_time = try(local.m286["mod_time"], null)
  moid = try(local.m286["moid"], null)
  name = try(local.m286["name"], null)
  object_type = try(local.m286["object_type"], null)
  organization = try(local.m286["organization"], null)
  owners = try(local.m286["owners"], null)
  parent = try(local.m286["parent"], null)
  permission_resources = try(local.m286["permission_resources"], null)
  profiles = try(local.m286["profiles"], null)
  shared_scope = try(local.m286["shared_scope"], null)
  tags = try(local.m286["tags"], null)
  version_context = try(local.m286["version_context"], null)
}
