# Sample resource intersight_appliance_data_export_policy — reads ../models/intersight_appliance_data_export_policy.yml
locals { m025 = yamldecode(file("${path.module}/../models/intersight_appliance_data_export_policy.yml"))["intersight_appliance_data_export_policy"] }

resource "intersight_appliance_data_export_policy" "n025" {
  account = try(local.m025["account"], null)
  account_moid = try(local.m025["account_moid"], null)
  additional_properties = try(local.m025["additional_properties"], null)
  ancestors = try(local.m025["ancestors"], null)
  class_id = try(local.m025["class_id"], null)
  create_time = try(local.m025["create_time"], null)
  domain_group_moid = try(local.m025["domain_group_moid"], null)
  enable = try(local.m025["enable"], null)
  id = try(local.m025["id"], null)
  mod_time = try(local.m025["mod_time"], null)
  moid = try(local.m025["moid"], null)
  name = try(local.m025["name"], null)
  object_type = try(local.m025["object_type"], null)
  owners = try(local.m025["owners"], null)
  parent = try(local.m025["parent"], null)
  parent_config = try(local.m025["parent_config"], null)
  permission_resources = try(local.m025["permission_resources"], null)
  shared_scope = try(local.m025["shared_scope"], null)
  sub_configs = try(local.m025["sub_configs"], null)
  tags = try(local.m025["tags"], null)
  version_context = try(local.m025["version_context"], null)
}
