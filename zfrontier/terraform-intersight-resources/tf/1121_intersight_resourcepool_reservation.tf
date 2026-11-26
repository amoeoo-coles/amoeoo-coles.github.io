# Sample resource intersight_resourcepool_reservation — reads ../models/intersight_resourcepool_reservation.yml
locals { m1121 = yamldecode(file("${path.module}/../models/intersight_resourcepool_reservation.yml"))["intersight_resourcepool_reservation"] }

resource "intersight_resourcepool_reservation" "n1121" {
  account_moid = try(local.m1121["account_moid"], null)
  additional_properties = try(local.m1121["additional_properties"], null)
  allocation_type = try(local.m1121["allocation_type"], null)
  ancestors = try(local.m1121["ancestors"], null)
  class_id = try(local.m1121["class_id"], null)
  create_time = try(local.m1121["create_time"], null)
  domain_group_moid = try(local.m1121["domain_group_moid"], null)
  id = try(local.m1121["id"], null)
  identity = try(local.m1121["identity"], null)
  mod_time = try(local.m1121["mod_time"], null)
  moid = try(local.m1121["moid"], null)
  object_type = try(local.m1121["object_type"], null)
  organization = try(local.m1121["organization"], null)
  owners = try(local.m1121["owners"], null)
  parent = try(local.m1121["parent"], null)
  permission_resources = try(local.m1121["permission_resources"], null)
  pool = try(local.m1121["pool"], null)
  pool_member = try(local.m1121["pool_member"], null)
  resource_serial = try(local.m1121["resource_serial"], null)
  resource_type = try(local.m1121["resource_type"], null)
  shared_scope = try(local.m1121["shared_scope"], null)
  tags = try(local.m1121["tags"], null)
  universe = try(local.m1121["universe"], null)
  version_context = try(local.m1121["version_context"], null)
}
