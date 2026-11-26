# Sample resource intersight_hcl_compatibility_status — reads ../models/intersight_hcl_compatibility_status.yml
locals { m541 = yamldecode(file("${path.module}/../models/intersight_hcl_compatibility_status.yml"))["intersight_hcl_compatibility_status"] }

resource "intersight_hcl_compatibility_status" "n541" {
  account_moid = try(local.m541["account_moid"], null)
  additional_properties = try(local.m541["additional_properties"], null)
  ancestors = try(local.m541["ancestors"], null)
  class_id = try(local.m541["class_id"], null)
  create_time = try(local.m541["create_time"], null)
  domain_group_moid = try(local.m541["domain_group_moid"], null)
  id = try(local.m541["id"], null)
  mod_time = try(local.m541["mod_time"], null)
  moid = try(local.m541["moid"], null)
  object_type = try(local.m541["object_type"], null)
  owners = try(local.m541["owners"], null)
  parent = try(local.m541["parent"], null)
  permission_resources = try(local.m541["permission_resources"], null)
  profile_list = try(local.m541["profile_list"], null)
  request_type = try(local.m541["request_type"], null)
  shared_scope = try(local.m541["shared_scope"], null)
  tags = try(local.m541["tags"], null)
  version_context = try(local.m541["version_context"], null)
}
