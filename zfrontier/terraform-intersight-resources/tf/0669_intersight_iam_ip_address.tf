# Sample resource intersight_iam_ip_address — reads ../models/intersight_iam_ip_address.yml
locals { m669 = yamldecode(file("${path.module}/../models/intersight_iam_ip_address.yml"))["intersight_iam_ip_address"] }

resource "intersight_iam_ip_address" "n669" {
  account_moid = try(local.m669["account_moid"], null)
  additional_properties = try(local.m669["additional_properties"], null)
  address = try(local.m669["address"], null)
  ancestors = try(local.m669["ancestors"], null)
  class_id = try(local.m669["class_id"], null)
  create_time = try(local.m669["create_time"], null)
  description = try(local.m669["description"], null)
  domain_group_moid = try(local.m669["domain_group_moid"], null)
  id = try(local.m669["id"], null)
  ip_access_management = try(local.m669["ip_access_management"], null)
  mod_time = try(local.m669["mod_time"], null)
  moid = try(local.m669["moid"], null)
  object_type = try(local.m669["object_type"], null)
  owners = try(local.m669["owners"], null)
  parent = try(local.m669["parent"], null)
  permission_resources = try(local.m669["permission_resources"], null)
  shared_scope = try(local.m669["shared_scope"], null)
  tags = try(local.m669["tags"], null)
  version_context = try(local.m669["version_context"], null)
}
