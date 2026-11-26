# Sample resource intersight_mgmt_config_operation_setting — reads ../models/intersight_mgmt_config_operation_setting.yml
locals { m847 = yamldecode(file("${path.module}/../models/intersight_mgmt_config_operation_setting.yml"))["intersight_mgmt_config_operation_setting"] }

resource "intersight_mgmt_config_operation_setting" "n847" {
  account = try(local.m847["account"], null)
  account_moid = try(local.m847["account_moid"], null)
  additional_properties = try(local.m847["additional_properties"], null)
  ancestors = try(local.m847["ancestors"], null)
  class_id = try(local.m847["class_id"], null)
  create_time = try(local.m847["create_time"], null)
  domain_group_moid = try(local.m847["domain_group_moid"], null)
  id = try(local.m847["id"], null)
  is_account_key_set = try(local.m847["is_account_key_set"], null)
  mod_time = try(local.m847["mod_time"], null)
  moid = try(local.m847["moid"], null)
  object_type = try(local.m847["object_type"], null)
  owners = try(local.m847["owners"], null)
  parent = try(local.m847["parent"], null)
  permission_resources = try(local.m847["permission_resources"], null)
  shared_scope = try(local.m847["shared_scope"], null)
  tags = try(local.m847["tags"], null)
  version_context = try(local.m847["version_context"], null)
}
