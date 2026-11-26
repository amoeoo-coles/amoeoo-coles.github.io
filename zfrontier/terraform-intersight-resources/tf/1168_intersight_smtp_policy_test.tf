# Sample resource intersight_smtp_policy_test — reads ../models/intersight_smtp_policy_test.yml
locals { m1168 = yamldecode(file("${path.module}/../models/intersight_smtp_policy_test.yml"))["intersight_smtp_policy_test"] }

resource "intersight_smtp_policy_test" "n1168" {
  account = try(local.m1168["account"], null)
  account_moid = try(local.m1168["account_moid"], null)
  additional_properties = try(local.m1168["additional_properties"], null)
  ancestors = try(local.m1168["ancestors"], null)
  class_id = try(local.m1168["class_id"], null)
  create_time = try(local.m1168["create_time"], null)
  domain_group_moid = try(local.m1168["domain_group_moid"], null)
  enabled = try(local.m1168["enabled"], null)
  id = try(local.m1168["id"], null)
  last_status_details = try(local.m1168["last_status_details"], null)
  last_successful_attempt_time = try(local.m1168["last_successful_attempt_time"], null)
  last_successful_policy = try(local.m1168["last_successful_policy"], null)
  last_test_status = try(local.m1168["last_test_status"], null)
  mod_time = try(local.m1168["mod_time"], null)
  moid = try(local.m1168["moid"], null)
  object_type = try(local.m1168["object_type"], null)
  owners = try(local.m1168["owners"], null)
  parent = try(local.m1168["parent"], null)
  permission_resources = try(local.m1168["permission_resources"], null)
  policy = try(local.m1168["policy"], null)
  recipients = try(local.m1168["recipients"], null)
  shared_scope = try(local.m1168["shared_scope"], null)
  tags = try(local.m1168["tags"], null)
  version_context = try(local.m1168["version_context"], null)
}
