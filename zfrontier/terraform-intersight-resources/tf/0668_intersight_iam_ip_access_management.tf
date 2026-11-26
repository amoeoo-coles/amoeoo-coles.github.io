# Sample resource intersight_iam_ip_access_management — reads ../models/intersight_iam_ip_access_management.yml
locals { m668 = yamldecode(file("${path.module}/../models/intersight_iam_ip_access_management.yml"))["intersight_iam_ip_access_management"] }

resource "intersight_iam_ip_access_management" "n668" {
  account_moid = try(local.m668["account_moid"], null)
  additional_properties = try(local.m668["additional_properties"], null)
  ancestors = try(local.m668["ancestors"], null)
  class_id = try(local.m668["class_id"], null)
  create_time = try(local.m668["create_time"], null)
  domain_group_moid = try(local.m668["domain_group_moid"], null)
  enable = try(local.m668["enable"], null)
  holder = try(local.m668["holder"], null)
  id = try(local.m668["id"], null)
  ip_addresses = try(local.m668["ip_addresses"], null)
  last_recovery_time = try(local.m668["last_recovery_time"], null)
  mod_time = try(local.m668["mod_time"], null)
  moid = try(local.m668["moid"], null)
  object_type = try(local.m668["object_type"], null)
  owners = try(local.m668["owners"], null)
  parent = try(local.m668["parent"], null)
  permission_resources = try(local.m668["permission_resources"], null)
  shared_scope = try(local.m668["shared_scope"], null)
  tags = try(local.m668["tags"], null)
  version_context = try(local.m668["version_context"], null)
}
