# Sample resource intersight_hyperflex_sys_config_policy — reads ../models/intersight_hyperflex_sys_config_policy.yml
locals { m572 = yamldecode(file("${path.module}/../models/intersight_hyperflex_sys_config_policy.yml"))["intersight_hyperflex_sys_config_policy"] }

resource "intersight_hyperflex_sys_config_policy" "n572" {
  account_moid = try(local.m572["account_moid"], null)
  additional_properties = try(local.m572["additional_properties"], null)
  ancestors = try(local.m572["ancestors"], null)
  class_id = try(local.m572["class_id"], null)
  cluster_profiles = try(local.m572["cluster_profiles"], null)
  create_time = try(local.m572["create_time"], null)
  description = try(local.m572["description"], null)
  dns_domain_name = try(local.m572["dns_domain_name"], null)
  dns_servers = try(local.m572["dns_servers"], null)
  domain_group_moid = try(local.m572["domain_group_moid"], null)
  id = try(local.m572["id"], null)
  mod_time = try(local.m572["mod_time"], null)
  moid = try(local.m572["moid"], null)
  name = try(local.m572["name"], null)
  ntp_servers = try(local.m572["ntp_servers"], null)
  object_type = try(local.m572["object_type"], null)
  organization = try(local.m572["organization"], null)
  owners = try(local.m572["owners"], null)
  parent = try(local.m572["parent"], null)
  permission_resources = try(local.m572["permission_resources"], null)
  shared_scope = try(local.m572["shared_scope"], null)
  tags = try(local.m572["tags"], null)
  timezone = try(local.m572["timezone"], null)
  version_context = try(local.m572["version_context"], null)
}
