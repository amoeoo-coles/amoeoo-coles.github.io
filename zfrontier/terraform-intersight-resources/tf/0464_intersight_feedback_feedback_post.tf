# Sample resource intersight_feedback_feedback_post — reads ../models/intersight_feedback_feedback_post.yml
locals { m464 = yamldecode(file("${path.module}/../models/intersight_feedback_feedback_post.yml"))["intersight_feedback_feedback_post"] }

resource "intersight_feedback_feedback_post" "n464" {
  account = try(local.m464["account"], null)
  account_moid = try(local.m464["account_moid"], null)
  additional_properties = try(local.m464["additional_properties"], null)
  ancestors = try(local.m464["ancestors"], null)
  class_id = try(local.m464["class_id"], null)
  create_time = try(local.m464["create_time"], null)
  domain_group_moid = try(local.m464["domain_group_moid"], null)
  feedback_data = try(local.m464["feedback_data"], null)
  id = try(local.m464["id"], null)
  mod_time = try(local.m464["mod_time"], null)
  moid = try(local.m464["moid"], null)
  object_type = try(local.m464["object_type"], null)
  owners = try(local.m464["owners"], null)
  parent = try(local.m464["parent"], null)
  permission_resources = try(local.m464["permission_resources"], null)
  shared_scope = try(local.m464["shared_scope"], null)
  tags = try(local.m464["tags"], null)
  version_context = try(local.m464["version_context"], null)
}
