# Sample resource intersight_connectorpack_connector_pack_upgrade — reads ../models/intersight_connectorpack_connector_pack_upgrade.yml
locals { m272 = yamldecode(file("${path.module}/../models/intersight_connectorpack_connector_pack_upgrade.yml"))["intersight_connectorpack_connector_pack_upgrade"] }

resource "intersight_connectorpack_connector_pack_upgrade" "n272" {
  account_moid = try(local.m272["account_moid"], null)
  additional_properties = try(local.m272["additional_properties"], null)
  ancestors = try(local.m272["ancestors"], null)
  class_id = try(local.m272["class_id"], null)
  connector_pack_op_type = try(local.m272["connector_pack_op_type"], null)
  create_time = try(local.m272["create_time"], null)
  domain_group_moid = try(local.m272["domain_group_moid"], null)
  id = try(local.m272["id"], null)
  mod_time = try(local.m272["mod_time"], null)
  moid = try(local.m272["moid"], null)
  object_type = try(local.m272["object_type"], null)
  owners = try(local.m272["owners"], null)
  parent = try(local.m272["parent"], null)
  permission_resources = try(local.m272["permission_resources"], null)
  shared_scope = try(local.m272["shared_scope"], null)
  tags = try(local.m272["tags"], null)
  ucsd_info = try(local.m272["ucsd_info"], null)
  version_context = try(local.m272["version_context"], null)
  wait_for_completion = try(local.m272["wait_for_completion"], null)
  workflow = try(local.m272["workflow"], null)
}
