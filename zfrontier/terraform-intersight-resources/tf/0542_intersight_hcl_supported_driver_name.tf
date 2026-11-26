# Sample resource intersight_hcl_supported_driver_name — reads ../models/intersight_hcl_supported_driver_name.yml
locals { m542 = yamldecode(file("${path.module}/../models/intersight_hcl_supported_driver_name.yml"))["intersight_hcl_supported_driver_name"] }

resource "intersight_hcl_supported_driver_name" "n542" {
  account_moid = try(local.m542["account_moid"], null)
  additional_properties = try(local.m542["additional_properties"], null)
  ancestors = try(local.m542["ancestors"], null)
  class_id = try(local.m542["class_id"], null)
  create_time = try(local.m542["create_time"], null)
  domain_group_moid = try(local.m542["domain_group_moid"], null)
  id = try(local.m542["id"], null)
  mod_time = try(local.m542["mod_time"], null)
  moid = try(local.m542["moid"], null)
  object_type = try(local.m542["object_type"], null)
  os_vendor = try(local.m542["os_vendor"], null)
  os_version = try(local.m542["os_version"], null)
  owners = try(local.m542["owners"], null)
  parent = try(local.m542["parent"], null)
  permission_resources = try(local.m542["permission_resources"], null)
  product_list = try(local.m542["product_list"], null)
  shared_scope = try(local.m542["shared_scope"], null)
  tags = try(local.m542["tags"], null)
  version_context = try(local.m542["version_context"], null)
}
