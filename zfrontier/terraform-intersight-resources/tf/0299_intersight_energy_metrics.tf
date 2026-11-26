# Sample resource intersight_energy_metrics — reads ../models/intersight_energy_metrics.yml
locals { m299 = yamldecode(file("${path.module}/../models/intersight_energy_metrics.yml"))["intersight_energy_metrics"] }

resource "intersight_energy_metrics" "n299" {
  account_moid = try(local.m299["account_moid"], null)
  additional_properties = try(local.m299["additional_properties"], null)
  ancestors = try(local.m299["ancestors"], null)
  class_id = try(local.m299["class_id"], null)
  create_time = try(local.m299["create_time"], null)
  domain_group_moid = try(local.m299["domain_group_moid"], null)
  id = try(local.m299["id"], null)
  mod_time = try(local.m299["mod_time"], null)
  moid = try(local.m299["moid"], null)
  object_type = try(local.m299["object_type"], null)
  owners = try(local.m299["owners"], null)
  parent = try(local.m299["parent"], null)
  permission_resources = try(local.m299["permission_resources"], null)
  shared_scope = try(local.m299["shared_scope"], null)
  tags = try(local.m299["tags"], null)
  version_context = try(local.m299["version_context"], null)
}
