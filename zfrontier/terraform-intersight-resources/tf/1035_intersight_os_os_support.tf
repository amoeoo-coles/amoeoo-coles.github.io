# Sample resource intersight_os_os_support — reads ../models/intersight_os_os_support.yml
locals { m1035 = yamldecode(file("${path.module}/../models/intersight_os_os_support.yml"))["intersight_os_os_support"] }

resource "intersight_os_os_support" "n1035" {
  account_moid = try(local.m1035["account_moid"], null)
  additional_properties = try(local.m1035["additional_properties"], null)
  ancestors = try(local.m1035["ancestors"], null)
  class_id = try(local.m1035["class_id"], null)
  create_time = try(local.m1035["create_time"], null)
  domain_group_moid = try(local.m1035["domain_group_moid"], null)
  id = try(local.m1035["id"], null)
  mod_time = try(local.m1035["mod_time"], null)
  moid = try(local.m1035["moid"], null)
  object_type = try(local.m1035["object_type"], null)
  os_version = try(local.m1035["os_version"], null)
  owners = try(local.m1035["owners"], null)
  parent = try(local.m1035["parent"], null)
  permission_resources = try(local.m1035["permission_resources"], null)
  shared_scope = try(local.m1035["shared_scope"], null)
  tags = try(local.m1035["tags"], null)
  version_context = try(local.m1035["version_context"], null)
}
