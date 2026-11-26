# Sample resource intersight_iam_end_point_user — reads ../models/intersight_iam_end_point_user.yml
locals { m663 = yamldecode(file("${path.module}/../models/intersight_iam_end_point_user.yml"))["intersight_iam_end_point_user"] }

resource "intersight_iam_end_point_user" "n663" {
  account_moid = try(local.m663["account_moid"], null)
  additional_properties = try(local.m663["additional_properties"], null)
  ancestors = try(local.m663["ancestors"], null)
  class_id = try(local.m663["class_id"], null)
  create_time = try(local.m663["create_time"], null)
  domain_group_moid = try(local.m663["domain_group_moid"], null)
  end_point_user_role = try(local.m663["end_point_user_role"], null)
  id = try(local.m663["id"], null)
  mod_time = try(local.m663["mod_time"], null)
  moid = try(local.m663["moid"], null)
  name = try(local.m663["name"], null)
  object_type = try(local.m663["object_type"], null)
  organization = try(local.m663["organization"], null)
  owners = try(local.m663["owners"], null)
  parent = try(local.m663["parent"], null)
  permission_resources = try(local.m663["permission_resources"], null)
  shared_scope = try(local.m663["shared_scope"], null)
  tags = try(local.m663["tags"], null)
  version_context = try(local.m663["version_context"], null)
}
