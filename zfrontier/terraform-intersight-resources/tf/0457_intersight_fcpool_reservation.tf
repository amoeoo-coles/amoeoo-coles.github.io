# Sample resource intersight_fcpool_reservation — reads ../models/intersight_fcpool_reservation.yml
locals { m457 = yamldecode(file("${path.module}/../models/intersight_fcpool_reservation.yml"))["intersight_fcpool_reservation"] }

resource "intersight_fcpool_reservation" "n457" {
  account_moid = try(local.m457["account_moid"], null)
  additional_properties = try(local.m457["additional_properties"], null)
  allocation_type = try(local.m457["allocation_type"], null)
  ancestors = try(local.m457["ancestors"], null)
  block = try(local.m457["block"], null)
  class_id = try(local.m457["class_id"], null)
  create_time = try(local.m457["create_time"], null)
  domain_group_moid = try(local.m457["domain_group_moid"], null)
  id = try(local.m457["id"], null)
  id_purpose = try(local.m457["id_purpose"], null)
  identity = try(local.m457["identity"], null)
  mod_time = try(local.m457["mod_time"], null)
  moid = try(local.m457["moid"], null)
  object_type = try(local.m457["object_type"], null)
  organization = try(local.m457["organization"], null)
  owners = try(local.m457["owners"], null)
  parent = try(local.m457["parent"], null)
  permission_resources = try(local.m457["permission_resources"], null)
  pool = try(local.m457["pool"], null)
  pool_member = try(local.m457["pool_member"], null)
  shared_scope = try(local.m457["shared_scope"], null)
  tags = try(local.m457["tags"], null)
  universe = try(local.m457["universe"], null)
  version_context = try(local.m457["version_context"], null)
}
