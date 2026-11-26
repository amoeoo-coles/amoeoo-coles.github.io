# Sample resource intersight_energy_daily_metrics — reads ../models/intersight_energy_daily_metrics.yml
locals { m298 = yamldecode(file("${path.module}/../models/intersight_energy_daily_metrics.yml"))["intersight_energy_daily_metrics"] }

resource "intersight_energy_daily_metrics" "n298" {
  account_moid = try(local.m298["account_moid"], null)
  additional_properties = try(local.m298["additional_properties"], null)
  ancestors = try(local.m298["ancestors"], null)
  class_id = try(local.m298["class_id"], null)
  create_time = try(local.m298["create_time"], null)
  domain_group_moid = try(local.m298["domain_group_moid"], null)
  id = try(local.m298["id"], null)
  mod_time = try(local.m298["mod_time"], null)
  moid = try(local.m298["moid"], null)
  object_type = try(local.m298["object_type"], null)
  owners = try(local.m298["owners"], null)
  parent = try(local.m298["parent"], null)
  permission_resources = try(local.m298["permission_resources"], null)
  shared_scope = try(local.m298["shared_scope"], null)
  tags = try(local.m298["tags"], null)
  version_context = try(local.m298["version_context"], null)
}
