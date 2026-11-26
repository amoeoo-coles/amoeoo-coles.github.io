# Sample resource intersight_syslog_policy — reads ../models/intersight_syslog_policy.yml
locals { m1355 = yamldecode(file("${path.module}/../models/intersight_syslog_policy.yml"))["intersight_syslog_policy"] }

resource "intersight_syslog_policy" "n1355" {
  account_moid = try(local.m1355["account_moid"], null)
  additional_properties = try(local.m1355["additional_properties"], null)
  ancestors = try(local.m1355["ancestors"], null)
  class_id = try(local.m1355["class_id"], null)
  create_time = try(local.m1355["create_time"], null)
  description = try(local.m1355["description"], null)
  domain_group_moid = try(local.m1355["domain_group_moid"], null)
  id = try(local.m1355["id"], null)
  local_clients = try(local.m1355["local_clients"], null)
  mod_time = try(local.m1355["mod_time"], null)
  moid = try(local.m1355["moid"], null)
  name = try(local.m1355["name"], null)
  object_type = try(local.m1355["object_type"], null)
  organization = try(local.m1355["organization"], null)
  owners = try(local.m1355["owners"], null)
  parent = try(local.m1355["parent"], null)
  permission_resources = try(local.m1355["permission_resources"], null)
  profiles = try(local.m1355["profiles"], null)
  remote_clients = try(local.m1355["remote_clients"], null)
  shared_scope = try(local.m1355["shared_scope"], null)
  tags = try(local.m1355["tags"], null)
  version_context = try(local.m1355["version_context"], null)
}
