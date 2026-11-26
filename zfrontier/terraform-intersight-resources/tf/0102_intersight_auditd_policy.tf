# Sample resource intersight_auditd_policy — reads ../models/intersight_auditd_policy.yml
locals { m102 = yamldecode(file("${path.module}/../models/intersight_auditd_policy.yml"))["intersight_auditd_policy"] }

resource "intersight_auditd_policy" "n102" {
  account_moid = try(local.m102["account_moid"], null)
  additional_properties = try(local.m102["additional_properties"], null)
  admin_state = try(local.m102["admin_state"], null)
  ancestors = try(local.m102["ancestors"], null)
  auditd_log_level = try(local.m102["auditd_log_level"], null)
  class_id = try(local.m102["class_id"], null)
  create_time = try(local.m102["create_time"], null)
  description = try(local.m102["description"], null)
  domain_group_moid = try(local.m102["domain_group_moid"], null)
  id = try(local.m102["id"], null)
  log_monitor = try(local.m102["log_monitor"], null)
  mod_time = try(local.m102["mod_time"], null)
  moid = try(local.m102["moid"], null)
  name = try(local.m102["name"], null)
  object_type = try(local.m102["object_type"], null)
  organization = try(local.m102["organization"], null)
  owners = try(local.m102["owners"], null)
  parent = try(local.m102["parent"], null)
  permission_resources = try(local.m102["permission_resources"], null)
  profiles = try(local.m102["profiles"], null)
  shared_scope = try(local.m102["shared_scope"], null)
  tags = try(local.m102["tags"], null)
  version_context = try(local.m102["version_context"], null)
}
