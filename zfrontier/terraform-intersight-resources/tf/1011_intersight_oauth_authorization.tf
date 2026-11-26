# Sample resource intersight_oauth_authorization — reads ../models/intersight_oauth_authorization.yml
locals { m1011 = yamldecode(file("${path.module}/../models/intersight_oauth_authorization.yml"))["intersight_oauth_authorization"] }

resource "intersight_oauth_authorization" "n1011" {
  access_token = try(var.secrets["intersight_oauth_authorization.access_token"], local.m1011["access_token"])
  account = try(local.m1011["account"], null)
  account_moid = try(local.m1011["account_moid"], null)
  additional_properties = try(local.m1011["additional_properties"], null)
  ancestors = try(local.m1011["ancestors"], null)
  api_type = try(local.m1011["api_type"], null)
  class_id = try(local.m1011["class_id"], null)
  create_time = try(local.m1011["create_time"], null)
  domain_group_moid = try(local.m1011["domain_group_moid"], null)
  id = try(local.m1011["id"], null)
  is_password_set = try(var.secrets["intersight_oauth_authorization.is_password_set"], local.m1011["is_password_set"])
  is_user_id_set = try(local.m1011["is_user_id_set"], null)
  mod_time = try(local.m1011["mod_time"], null)
  moid = try(local.m1011["moid"], null)
  object_type = try(local.m1011["object_type"], null)
  owners = try(local.m1011["owners"], null)
  parent = try(local.m1011["parent"], null)
  password = try(var.secrets["intersight_oauth_authorization.password"], local.m1011["password"])
  permission_resources = try(local.m1011["permission_resources"], null)
  shared_scope = try(local.m1011["shared_scope"], null)
  tags = try(local.m1011["tags"], null)
  user_id = try(local.m1011["user_id"], null)
  version_context = try(local.m1011["version_context"], null)
}
