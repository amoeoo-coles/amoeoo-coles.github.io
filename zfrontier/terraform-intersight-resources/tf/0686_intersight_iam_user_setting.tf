# Sample resource intersight_iam_user_setting — reads ../models/intersight_iam_user_setting.yml
locals { m686 = yamldecode(file("${path.module}/../models/intersight_iam_user_setting.yml"))["intersight_iam_user_setting"] }

resource "intersight_iam_user_setting" "n686" {
  account_moid = try(local.m686["account_moid"], null)
  additional_properties = try(local.m686["additional_properties"], null)
  allow_ui_session_recording = try(local.m686["allow_ui_session_recording"], null)
  ancestors = try(local.m686["ancestors"], null)
  class_id = try(local.m686["class_id"], null)
  create_time = try(local.m686["create_time"], null)
  default_permission = try(local.m686["default_permission"], null)
  domain_group_moid = try(local.m686["domain_group_moid"], null)
  id = try(local.m686["id"], null)
  idp = try(local.m686["idp"], null)
  idp_reference = try(local.m686["idp_reference"], null)
  mod_time = try(local.m686["mod_time"], null)
  moid = try(local.m686["moid"], null)
  object_type = try(local.m686["object_type"], null)
  owners = try(local.m686["owners"], null)
  parent = try(local.m686["parent"], null)
  permission_resources = try(local.m686["permission_resources"], null)
  shared_scope = try(local.m686["shared_scope"], null)
  tags = try(local.m686["tags"], null)
  user_id_or_email = try(local.m686["user_id_or_email"], null)
  user_unique_identifier = try(local.m686["user_unique_identifier"], null)
  version_context = try(local.m686["version_context"], null)
}
