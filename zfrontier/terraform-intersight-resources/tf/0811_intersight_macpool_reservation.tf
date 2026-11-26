# Sample resource intersight_macpool_reservation — reads ../models/intersight_macpool_reservation.yml
locals { m811 = yamldecode(file("${path.module}/../models/intersight_macpool_reservation.yml"))["intersight_macpool_reservation"] }

resource "intersight_macpool_reservation" "n811" {
  account_moid = try(local.m811["account_moid"], null)
  additional_properties = try(local.m811["additional_properties"], null)
  allocation_type = try(local.m811["allocation_type"], null)
  ancestors = try(local.m811["ancestors"], null)
  block_head = try(local.m811["block_head"], null)
  class_id = try(local.m811["class_id"], null)
  create_time = try(local.m811["create_time"], null)
  domain_group_moid = try(local.m811["domain_group_moid"], null)
  id = try(local.m811["id"], null)
  identity = try(local.m811["identity"], null)
  member_of = try(local.m811["member_of"], null)
  mod_time = try(local.m811["mod_time"], null)
  moid = try(local.m811["moid"], null)
  object_type = try(local.m811["object_type"], null)
  organization = try(local.m811["organization"], null)
  owners = try(local.m811["owners"], null)
  parent = try(local.m811["parent"], null)
  permission_resources = try(local.m811["permission_resources"], null)
  pool = try(local.m811["pool"], null)
  pool_member = try(local.m811["pool_member"], null)
  shared_scope = try(local.m811["shared_scope"], null)
  tags = try(local.m811["tags"], null)
  universe = try(local.m811["universe"], null)
  version_context = try(local.m811["version_context"], null)
}
