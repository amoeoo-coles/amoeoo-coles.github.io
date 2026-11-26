# Sample resource intersight_cond_alarm_suppression_dry_run — reads ../models/intersight_cond_alarm_suppression_dry_run.yml
locals { m255 = yamldecode(file("${path.module}/../models/intersight_cond_alarm_suppression_dry_run.yml"))["intersight_cond_alarm_suppression_dry_run"] }

resource "intersight_cond_alarm_suppression_dry_run" "n255" {
  account = try(local.m255["account"], null)
  account_moid = try(local.m255["account_moid"], null)
  additional_properties = try(local.m255["additional_properties"], null)
  alarm_rules = try(local.m255["alarm_rules"], null)
  ancestors = try(local.m255["ancestors"], null)
  class_id = try(local.m255["class_id"], null)
  create_time = try(local.m255["create_time"], null)
  domain_group_moid = try(local.m255["domain_group_moid"], null)
  id = try(local.m255["id"], null)
  mod_time = try(local.m255["mod_time"], null)
  moid = try(local.m255["moid"], null)
  object_type = try(local.m255["object_type"], null)
  organization = try(local.m255["organization"], null)
  owners = try(local.m255["owners"], null)
  parent = try(local.m255["parent"], null)
  permission_resources = try(local.m255["permission_resources"], null)
  rules_operator = try(local.m255["rules_operator"], null)
  shared_scope = try(local.m255["shared_scope"], null)
  summary = try(local.m255["summary"], null)
  tags = try(local.m255["tags"], null)
  version_context = try(local.m255["version_context"], null)
}
