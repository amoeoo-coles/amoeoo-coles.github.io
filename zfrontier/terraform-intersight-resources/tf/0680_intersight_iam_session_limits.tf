# Sample resource intersight_iam_session_limits — reads ../models/intersight_iam_session_limits.yml
locals { m680 = yamldecode(file("${path.module}/../models/intersight_iam_session_limits.yml"))["intersight_iam_session_limits"] }

resource "intersight_iam_session_limits" "n680" {
  account = try(local.m680["account"], null)
  account_moid = try(local.m680["account_moid"], null)
  additional_properties = try(local.m680["additional_properties"], null)
  ancestors = try(local.m680["ancestors"], null)
  class_id = try(local.m680["class_id"], null)
  create_time = try(local.m680["create_time"], null)
  domain_group_moid = try(local.m680["domain_group_moid"], null)
  id = try(local.m680["id"], null)
  idle_time_out = try(local.m680["idle_time_out"], null)
  maximum_limit = try(local.m680["maximum_limit"], null)
  mod_time = try(local.m680["mod_time"], null)
  moid = try(local.m680["moid"], null)
  object_type = try(local.m680["object_type"], null)
  owners = try(local.m680["owners"], null)
  parent = try(local.m680["parent"], null)
  per_user_limit = try(local.m680["per_user_limit"], null)
  permission = try(local.m680["permission"], null)
  permission_resources = try(local.m680["permission_resources"], null)
  session_time_out = try(local.m680["session_time_out"], null)
  shared_scope = try(local.m680["shared_scope"], null)
  tags = try(local.m680["tags"], null)
  version_context = try(local.m680["version_context"], null)
}
