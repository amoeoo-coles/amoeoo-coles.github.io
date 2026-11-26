# Sample resource intersight_iam_user_qualifier — reads ../models/intersight_iam_user_qualifier.yml
locals { m685 = yamldecode(file("${path.module}/../models/intersight_iam_user_qualifier.yml"))["intersight_iam_user_qualifier"] }

resource "intersight_iam_user_qualifier" "n685" {
  account_moid = try(local.m685["account_moid"], null)
  additional_properties = try(local.m685["additional_properties"], null)
  ancestors = try(local.m685["ancestors"], null)
  class_id = try(local.m685["class_id"], null)
  create_time = try(local.m685["create_time"], null)
  domain_group_moid = try(local.m685["domain_group_moid"], null)
  id = try(local.m685["id"], null)
  last_notification_time = try(local.m685["last_notification_time"], null)
  mod_time = try(local.m685["mod_time"], null)
  moid = try(local.m685["moid"], null)
  notification_scope = try(local.m685["notification_scope"], null)
  notify_guest_users = try(local.m685["notify_guest_users"], null)
  object_type = try(local.m685["object_type"], null)
  owners = try(local.m685["owners"], null)
  parent = try(local.m685["parent"], null)
  permission_resources = try(local.m685["permission_resources"], null)
  shared_scope = try(local.m685["shared_scope"], null)
  tags = try(local.m685["tags"], null)
  user_details = try(local.m685["user_details"], null)
  usergroup = try(local.m685["usergroup"], null)
  version_context = try(local.m685["version_context"], null)
}
