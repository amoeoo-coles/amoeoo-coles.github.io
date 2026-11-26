# Sample resource intersight_tam_advisory_info — reads ../models/intersight_tam_advisory_info.yml
locals { m1358 = yamldecode(file("${path.module}/../models/intersight_tam_advisory_info.yml"))["intersight_tam_advisory_info"] }

resource "intersight_tam_advisory_info" "n1358" {
  account = try(local.m1358["account"], null)
  account_moid = try(local.m1358["account_moid"], null)
  additional_properties = try(local.m1358["additional_properties"], null)
  advisory = try(local.m1358["advisory"], null)
  ancestors = try(local.m1358["ancestors"], null)
  class_id = try(local.m1358["class_id"], null)
  create_time = try(local.m1358["create_time"], null)
  domain_group_moid = try(local.m1358["domain_group_moid"], null)
  id = try(local.m1358["id"], null)
  mod_time = try(local.m1358["mod_time"], null)
  moid = try(local.m1358["moid"], null)
  object_type = try(local.m1358["object_type"], null)
  owners = try(local.m1358["owners"], null)
  parent = try(local.m1358["parent"], null)
  permission_resources = try(local.m1358["permission_resources"], null)
  shared_scope = try(local.m1358["shared_scope"], null)
  state = try(local.m1358["state"], null)
  tags = try(local.m1358["tags"], null)
  version_context = try(local.m1358["version_context"], null)
}
