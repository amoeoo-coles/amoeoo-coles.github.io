# Sample resource intersight_uuidpool_reservation — reads ../models/intersight_uuidpool_reservation.yml
locals { m1397 = yamldecode(file("${path.module}/../models/intersight_uuidpool_reservation.yml"))["intersight_uuidpool_reservation"] }

resource "intersight_uuidpool_reservation" "n1397" {
  account_moid = try(local.m1397["account_moid"], null)
  additional_properties = try(local.m1397["additional_properties"], null)
  allocation_type = try(local.m1397["allocation_type"], null)
  ancestors = try(local.m1397["ancestors"], null)
  block = try(local.m1397["block"], null)
  class_id = try(local.m1397["class_id"], null)
  create_time = try(local.m1397["create_time"], null)
  domain_group_moid = try(local.m1397["domain_group_moid"], null)
  id = try(local.m1397["id"], null)
  identity = try(local.m1397["identity"], null)
  mod_time = try(local.m1397["mod_time"], null)
  moid = try(local.m1397["moid"], null)
  object_type = try(local.m1397["object_type"], null)
  organization = try(local.m1397["organization"], null)
  owners = try(local.m1397["owners"], null)
  parent = try(local.m1397["parent"], null)
  permission_resources = try(local.m1397["permission_resources"], null)
  pool = try(local.m1397["pool"], null)
  pool_member = try(local.m1397["pool_member"], null)
  shared_scope = try(local.m1397["shared_scope"], null)
  tags = try(local.m1397["tags"], null)
  universe = try(local.m1397["universe"], null)
  version_context = try(local.m1397["version_context"], null)
}
