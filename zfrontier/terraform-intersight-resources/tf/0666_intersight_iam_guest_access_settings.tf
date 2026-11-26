# Sample resource intersight_iam_guest_access_settings — reads ../models/intersight_iam_guest_access_settings.yml
locals { m666 = yamldecode(file("${path.module}/../models/intersight_iam_guest_access_settings.yml"))["intersight_iam_guest_access_settings"] }

resource "intersight_iam_guest_access_settings" "n666" {
  account_moid = try(local.m666["account_moid"], null)
  additional_properties = try(local.m666["additional_properties"], null)
  allowed_domain_names = try(local.m666["allowed_domain_names"], null)
  ancestors = try(local.m666["ancestors"], null)
  class_id = try(local.m666["class_id"], null)
  create_time = try(local.m666["create_time"], null)
  domain_group_moid = try(local.m666["domain_group_moid"], null)
  id = try(local.m666["id"], null)
  max_guest_access_link_shelf_life = try(local.m666["max_guest_access_link_shelf_life"], null)
  mod_time = try(local.m666["mod_time"], null)
  moid = try(local.m666["moid"], null)
  object_type = try(local.m666["object_type"], null)
  override_ip_access_restriction = try(local.m666["override_ip_access_restriction"], null)
  owners = try(local.m666["owners"], null)
  parent = try(local.m666["parent"], null)
  permission_resources = try(local.m666["permission_resources"], null)
  resource_limits = try(local.m666["resource_limits"], null)
  shared_scope = try(local.m666["shared_scope"], null)
  tags = try(local.m666["tags"], null)
  version_context = try(local.m666["version_context"], null)
}
