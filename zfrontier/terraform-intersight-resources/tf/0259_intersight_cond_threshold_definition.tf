# Sample resource intersight_cond_threshold_definition — reads ../models/intersight_cond_threshold_definition.yml
locals { m259 = yamldecode(file("${path.module}/../models/intersight_cond_threshold_definition.yml"))["intersight_cond_threshold_definition"] }

resource "intersight_cond_threshold_definition" "n259" {
  account = try(local.m259["account"], null)
  account_moid = try(local.m259["account_moid"], null)
  additional_properties = try(local.m259["additional_properties"], null)
  ancestors = try(local.m259["ancestors"], null)
  class_id = try(local.m259["class_id"], null)
  condition = try(local.m259["condition"], null)
  create_time = try(local.m259["create_time"], null)
  description = try(local.m259["description"], null)
  domain_group_moid = try(local.m259["domain_group_moid"], null)
  id = try(local.m259["id"], null)
  mod_time = try(local.m259["mod_time"], null)
  moid = try(local.m259["moid"], null)
  name = try(local.m259["name"], null)
  object_type = try(local.m259["object_type"], null)
  owners = try(local.m259["owners"], null)
  parent = try(local.m259["parent"], null)
  permission_resources = try(local.m259["permission_resources"], null)
  probable_cause = try(local.m259["probable_cause"], null)
  remediation = try(local.m259["remediation"], null)
  shared_scope = try(local.m259["shared_scope"], null)
  system_classifications = try(local.m259["system_classifications"], null)
  tags = try(local.m259["tags"], null)
  version_context = try(local.m259["version_context"], null)
}
