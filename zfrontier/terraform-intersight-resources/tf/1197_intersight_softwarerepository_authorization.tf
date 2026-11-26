# Sample resource intersight_softwarerepository_authorization — reads ../models/intersight_softwarerepository_authorization.yml
locals { m1197 = yamldecode(file("${path.module}/../models/intersight_softwarerepository_authorization.yml"))["intersight_softwarerepository_authorization"] }

resource "intersight_softwarerepository_authorization" "n1197" {
  account = try(local.m1197["account"], null)
  account_moid = try(local.m1197["account_moid"], null)
  additional_properties = try(local.m1197["additional_properties"], null)
  ancestors = try(local.m1197["ancestors"], null)
  class_id = try(local.m1197["class_id"], null)
  create_time = try(local.m1197["create_time"], null)
  domain_group_moid = try(local.m1197["domain_group_moid"], null)
  id = try(local.m1197["id"], null)
  is_asdv4_alarm_dismissed = try(local.m1197["is_asdv4_alarm_dismissed"], null)
  is_password_set = try(var.secrets["intersight_softwarerepository_authorization.is_password_set"], local.m1197["is_password_set"])
  mod_time = try(local.m1197["mod_time"], null)
  moid = try(local.m1197["moid"], null)
  nr_version = try(local.m1197["nr_version"], null)
  object_type = try(local.m1197["object_type"], null)
  owners = try(local.m1197["owners"], null)
  parent = try(local.m1197["parent"], null)
  password = try(var.secrets["intersight_softwarerepository_authorization.password"], local.m1197["password"])
  permission_resources = try(local.m1197["permission_resources"], null)
  repository_type = try(local.m1197["repository_type"], null)
  shared_scope = try(local.m1197["shared_scope"], null)
  tags = try(local.m1197["tags"], null)
  user_id = try(local.m1197["user_id"], null)
  version_context = try(local.m1197["version_context"], null)
}
