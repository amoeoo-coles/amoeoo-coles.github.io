# Sample resource intersight_license_erp_license_count — reads ../models/intersight_license_erp_license_count.yml
locals { m788 = yamldecode(file("${path.module}/../models/intersight_license_erp_license_count.yml"))["intersight_license_erp_license_count"] }

resource "intersight_license_erp_license_count" "n788" {
  account_license_data = try(local.m788["account_license_data"], null)
  account_moid = try(local.m788["account_moid"], null)
  additional_properties = try(local.m788["additional_properties"], null)
  advantage_count = try(local.m788["advantage_count"], null)
  ancestors = try(local.m788["ancestors"], null)
  class_id = try(local.m788["class_id"], null)
  create_time = try(local.m788["create_time"], null)
  domain_group_moid = try(local.m788["domain_group_moid"], null)
  id = try(local.m788["id"], null)
  mod_time = try(local.m788["mod_time"], null)
  moid = try(local.m788["moid"], null)
  object_type = try(local.m788["object_type"], null)
  owners = try(local.m788["owners"], null)
  parent = try(local.m788["parent"], null)
  permission_resources = try(local.m788["permission_resources"], null)
  shared_scope = try(local.m788["shared_scope"], null)
  tags = try(local.m788["tags"], null)
  version_context = try(local.m788["version_context"], null)
}
