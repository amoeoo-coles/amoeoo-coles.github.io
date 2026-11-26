# Sample resource intersight_cond_alarm_rule — reads ../models/intersight_cond_alarm_rule.yml
locals { m253 = yamldecode(file("${path.module}/../models/intersight_cond_alarm_rule.yml"))["intersight_cond_alarm_rule"] }

resource "intersight_cond_alarm_rule" "n253" {
  account = try(local.m253["account"], null)
  account_moid = try(local.m253["account_moid"], null)
  additional_properties = try(local.m253["additional_properties"], null)
  ancestors = try(local.m253["ancestors"], null)
  class_id = try(local.m253["class_id"], null)
  create_time = try(local.m253["create_time"], null)
  description = try(local.m253["description"], null)
  devices = try(local.m253["devices"], null)
  domain_group_moid = try(local.m253["domain_group_moid"], null)
  id = try(local.m253["id"], null)
  mod_time = try(local.m253["mod_time"], null)
  moid = try(local.m253["moid"], null)
  name = try(local.m253["name"], null)
  object_type = try(local.m253["object_type"], null)
  owners = try(local.m253["owners"], null)
  parent = try(local.m253["parent"], null)
  permission_resources = try(local.m253["permission_resources"], null)
  shared_scope = try(local.m253["shared_scope"], null)
  state = try(local.m253["state"], null)
  system_disabled_time = try(local.m253["system_disabled_time"], null)
  tags = try(local.m253["tags"], null)
  threshold_definition_states = try(local.m253["threshold_definition_states"], null)
  threshold_definitions = try(local.m253["threshold_definitions"], null)
  version_context = try(local.m253["version_context"], null)
}
