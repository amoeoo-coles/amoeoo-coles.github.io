# Sample resource intersight_license_iwo_license_count — reads ../models/intersight_license_iwo_license_count.yml
locals { m791 = yamldecode(file("${path.module}/../models/intersight_license_iwo_license_count.yml"))["intersight_license_iwo_license_count"] }

resource "intersight_license_iwo_license_count" "n791" {
  account_license_data = try(local.m791["account_license_data"], null)
  account_moid = try(local.m791["account_moid"], null)
  additional_properties = try(local.m791["additional_properties"], null)
  ancestors = try(local.m791["ancestors"], null)
  class_id = try(local.m791["class_id"], null)
  create_time = try(local.m791["create_time"], null)
  domain_group_moid = try(local.m791["domain_group_moid"], null)
  id = try(local.m791["id"], null)
  mod_time = try(local.m791["mod_time"], null)
  moid = try(local.m791["moid"], null)
  object_type = try(local.m791["object_type"], null)
  owners = try(local.m791["owners"], null)
  parent = try(local.m791["parent"], null)
  permission_resources = try(local.m791["permission_resources"], null)
  shared_scope = try(local.m791["shared_scope"], null)
  tags = try(local.m791["tags"], null)
  version_context = try(local.m791["version_context"], null)
  vm_license_count = try(local.m791["vm_license_count"], null)
}
