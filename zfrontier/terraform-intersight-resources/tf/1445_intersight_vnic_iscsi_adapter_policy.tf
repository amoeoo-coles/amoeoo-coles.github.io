# Sample resource intersight_vnic_iscsi_adapter_policy — reads ../models/intersight_vnic_iscsi_adapter_policy.yml
locals { m1445 = yamldecode(file("${path.module}/../models/intersight_vnic_iscsi_adapter_policy.yml"))["intersight_vnic_iscsi_adapter_policy"] }

resource "intersight_vnic_iscsi_adapter_policy" "n1445" {
  account_moid = try(local.m1445["account_moid"], null)
  additional_properties = try(local.m1445["additional_properties"], null)
  ancestors = try(local.m1445["ancestors"], null)
  class_id = try(local.m1445["class_id"], null)
  connection_time_out = try(local.m1445["connection_time_out"], null)
  create_time = try(local.m1445["create_time"], null)
  description = try(local.m1445["description"], null)
  dhcp_timeout = try(local.m1445["dhcp_timeout"], null)
  domain_group_moid = try(local.m1445["domain_group_moid"], null)
  id = try(local.m1445["id"], null)
  lun_busy_retry_count = try(local.m1445["lun_busy_retry_count"], null)
  mod_time = try(local.m1445["mod_time"], null)
  moid = try(local.m1445["moid"], null)
  name = try(local.m1445["name"], null)
  object_type = try(local.m1445["object_type"], null)
  organization = try(local.m1445["organization"], null)
  owners = try(local.m1445["owners"], null)
  parent = try(local.m1445["parent"], null)
  permission_resources = try(local.m1445["permission_resources"], null)
  shared_scope = try(local.m1445["shared_scope"], null)
  tags = try(local.m1445["tags"], null)
  version_context = try(local.m1445["version_context"], null)
}
