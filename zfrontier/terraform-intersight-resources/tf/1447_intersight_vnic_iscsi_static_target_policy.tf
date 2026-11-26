# Sample resource intersight_vnic_iscsi_static_target_policy — reads ../models/intersight_vnic_iscsi_static_target_policy.yml
locals { m1447 = yamldecode(file("${path.module}/../models/intersight_vnic_iscsi_static_target_policy.yml"))["intersight_vnic_iscsi_static_target_policy"] }

resource "intersight_vnic_iscsi_static_target_policy" "n1447" {
  account_moid = try(local.m1447["account_moid"], null)
  additional_properties = try(local.m1447["additional_properties"], null)
  ancestors = try(local.m1447["ancestors"], null)
  class_id = try(local.m1447["class_id"], null)
  create_time = try(local.m1447["create_time"], null)
  description = try(local.m1447["description"], null)
  domain_group_moid = try(local.m1447["domain_group_moid"], null)
  id = try(local.m1447["id"], null)
  ip_address = try(local.m1447["ip_address"], null)
  iscsi_ip_type = try(local.m1447["iscsi_ip_type"], null)
  lun = try(local.m1447["lun"], null)
  mod_time = try(local.m1447["mod_time"], null)
  moid = try(local.m1447["moid"], null)
  name = try(local.m1447["name"], null)
  object_type = try(local.m1447["object_type"], null)
  organization = try(local.m1447["organization"], null)
  owners = try(local.m1447["owners"], null)
  parent = try(local.m1447["parent"], null)
  permission_resources = try(local.m1447["permission_resources"], null)
  port = try(local.m1447["port"], null)
  shared_scope = try(local.m1447["shared_scope"], null)
  tags = try(local.m1447["tags"], null)
  target_name = try(local.m1447["target_name"], null)
  version_context = try(local.m1447["version_context"], null)
}
