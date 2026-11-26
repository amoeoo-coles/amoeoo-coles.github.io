# Sample resource intersight_fabric_system_qos_policy — reads ../models/intersight_fabric_system_qos_policy.yml
locals { m390 = yamldecode(file("${path.module}/../models/intersight_fabric_system_qos_policy.yml"))["intersight_fabric_system_qos_policy"] }

resource "intersight_fabric_system_qos_policy" "n390" {
  account_moid = try(local.m390["account_moid"], null)
  additional_properties = try(local.m390["additional_properties"], null)
  ancestors = try(local.m390["ancestors"], null)
  class_id = try(local.m390["class_id"], null)
  classes = try(local.m390["classes"], null)
  create_time = try(local.m390["create_time"], null)
  description = try(local.m390["description"], null)
  domain_group_moid = try(local.m390["domain_group_moid"], null)
  id = try(local.m390["id"], null)
  mod_time = try(local.m390["mod_time"], null)
  moid = try(local.m390["moid"], null)
  name = try(local.m390["name"], null)
  object_type = try(local.m390["object_type"], null)
  organization = try(local.m390["organization"], null)
  owners = try(local.m390["owners"], null)
  parent = try(local.m390["parent"], null)
  permission_resources = try(local.m390["permission_resources"], null)
  pfc_watchdog = try(local.m390["pfc_watchdog"], null)
  profiles = try(local.m390["profiles"], null)
  shared_scope = try(local.m390["shared_scope"], null)
  tags = try(local.m390["tags"], null)
  target_platform = try(local.m390["target_platform"], null)
  version_context = try(local.m390["version_context"], null)
}
