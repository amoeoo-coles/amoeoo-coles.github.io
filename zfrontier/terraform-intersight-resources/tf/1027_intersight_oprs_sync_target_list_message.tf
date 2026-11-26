# Sample resource intersight_oprs_sync_target_list_message — reads ../models/intersight_oprs_sync_target_list_message.yml
locals { m1027 = yamldecode(file("${path.module}/../models/intersight_oprs_sync_target_list_message.yml"))["intersight_oprs_sync_target_list_message"] }

resource "intersight_oprs_sync_target_list_message" "n1027" {
  account_moid = try(local.m1027["account_moid"], null)
  additional_properties = try(local.m1027["additional_properties"], null)
  ancestors = try(local.m1027["ancestors"], null)
  assist = try(local.m1027["assist"], null)
  assist_id = try(local.m1027["assist_id"], null)
  class_id = try(local.m1027["class_id"], null)
  create_time = try(local.m1027["create_time"], null)
  domain_group_moid = try(local.m1027["domain_group_moid"], null)
  id = try(local.m1027["id"], null)
  mod_time = try(local.m1027["mod_time"], null)
  moid = try(local.m1027["moid"], null)
  object_type = try(local.m1027["object_type"], null)
  owners = try(local.m1027["owners"], null)
  parent = try(local.m1027["parent"], null)
  permission_resources = try(local.m1027["permission_resources"], null)
  shared_scope = try(local.m1027["shared_scope"], null)
  tags = try(local.m1027["tags"], null)
  target_type = try(local.m1027["target_type"], null)
  targets = try(local.m1027["targets"], null)
  time_stamp = try(local.m1027["time_stamp"], null)
  version_context = try(local.m1027["version_context"], null)
}
