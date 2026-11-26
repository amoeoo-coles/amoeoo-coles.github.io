# Sample resource intersight_vnic_fc_qos_policy — reads ../models/intersight_vnic_fc_qos_policy.yml
locals { m1444 = yamldecode(file("${path.module}/../models/intersight_vnic_fc_qos_policy.yml"))["intersight_vnic_fc_qos_policy"] }

resource "intersight_vnic_fc_qos_policy" "n1444" {
  account_moid = try(local.m1444["account_moid"], null)
  additional_properties = try(local.m1444["additional_properties"], null)
  ancestors = try(local.m1444["ancestors"], null)
  burst = try(local.m1444["burst"], null)
  class_id = try(local.m1444["class_id"], null)
  cos = try(local.m1444["cos"], null)
  create_time = try(local.m1444["create_time"], null)
  description = try(local.m1444["description"], null)
  domain_group_moid = try(local.m1444["domain_group_moid"], null)
  id = try(local.m1444["id"], null)
  max_data_field_size = try(local.m1444["max_data_field_size"], null)
  mod_time = try(local.m1444["mod_time"], null)
  moid = try(local.m1444["moid"], null)
  name = try(local.m1444["name"], null)
  object_type = try(local.m1444["object_type"], null)
  organization = try(local.m1444["organization"], null)
  owners = try(local.m1444["owners"], null)
  parent = try(local.m1444["parent"], null)
  permission_resources = try(local.m1444["permission_resources"], null)
  priority = try(local.m1444["priority"], null)
  rate_limit = try(local.m1444["rate_limit"], null)
  shared_scope = try(local.m1444["shared_scope"], null)
  tags = try(local.m1444["tags"], null)
  version_context = try(local.m1444["version_context"], null)
}
