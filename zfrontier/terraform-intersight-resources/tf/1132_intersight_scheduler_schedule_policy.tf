# Sample resource intersight_scheduler_schedule_policy — reads ../models/intersight_scheduler_schedule_policy.yml
locals { m1132 = yamldecode(file("${path.module}/../models/intersight_scheduler_schedule_policy.yml"))["intersight_scheduler_schedule_policy"] }

resource "intersight_scheduler_schedule_policy" "n1132" {
  account_moid = try(local.m1132["account_moid"], null)
  additional_properties = try(local.m1132["additional_properties"], null)
  ancestors = try(local.m1132["ancestors"], null)
  associated_objects = try(local.m1132["associated_objects"], null)
  block_dates = try(local.m1132["block_dates"], null)
  class_id = try(local.m1132["class_id"], null)
  create_time = try(local.m1132["create_time"], null)
  description = try(local.m1132["description"], null)
  domain_group_moid = try(local.m1132["domain_group_moid"], null)
  enable_block_dates = try(local.m1132["enable_block_dates"], null)
  id = try(local.m1132["id"], null)
  mod_time = try(local.m1132["mod_time"], null)
  moid = try(local.m1132["moid"], null)
  name = try(local.m1132["name"], null)
  object_type = try(local.m1132["object_type"], null)
  organization = try(local.m1132["organization"], null)
  owners = try(local.m1132["owners"], null)
  parent = try(local.m1132["parent"], null)
  permission_resources = try(local.m1132["permission_resources"], null)
  schedule_params = try(local.m1132["schedule_params"], null)
  shared_scope = try(local.m1132["shared_scope"], null)
  tags = try(local.m1132["tags"], null)
  usage_count = try(local.m1132["usage_count"], null)
  version_context = try(local.m1132["version_context"], null)
}
