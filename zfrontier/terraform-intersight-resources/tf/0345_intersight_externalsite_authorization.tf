# Sample resource intersight_externalsite_authorization — reads ../models/intersight_externalsite_authorization.yml
locals { m345 = yamldecode(file("${path.module}/../models/intersight_externalsite_authorization.yml"))["intersight_externalsite_authorization"] }

resource "intersight_externalsite_authorization" "n345" {
  account = try(local.m345["account"], null)
  account_moid = try(local.m345["account_moid"], null)
  additional_properties = try(local.m345["additional_properties"], null)
  ancestors = try(local.m345["ancestors"], null)
  class_id = try(local.m345["class_id"], null)
  create_time = try(local.m345["create_time"], null)
  domain_group_moid = try(local.m345["domain_group_moid"], null)
  id = try(local.m345["id"], null)
  is_password_set = try(var.secrets["intersight_externalsite_authorization.is_password_set"], local.m345["is_password_set"])
  is_user_id_set = try(local.m345["is_user_id_set"], null)
  mod_time = try(local.m345["mod_time"], null)
  moid = try(local.m345["moid"], null)
  object_type = try(local.m345["object_type"], null)
  owners = try(local.m345["owners"], null)
  parent = try(local.m345["parent"], null)
  password = try(var.secrets["intersight_externalsite_authorization.password"], local.m345["password"])
  permission_resources = try(local.m345["permission_resources"], null)
  repository_type = try(local.m345["repository_type"], null)
  shared_scope = try(local.m345["shared_scope"], null)
  tags = try(local.m345["tags"], null)
  user_id = try(local.m345["user_id"], null)
  version_context = try(local.m345["version_context"], null)
}
