# Sample resource intersight_hyperflex_ucsm_config_policy — reads ../models/intersight_hyperflex_ucsm_config_policy.yml
locals { m573 = yamldecode(file("${path.module}/../models/intersight_hyperflex_ucsm_config_policy.yml"))["intersight_hyperflex_ucsm_config_policy"] }

resource "intersight_hyperflex_ucsm_config_policy" "n573" {
  account_moid = try(local.m573["account_moid"], null)
  additional_properties = try(local.m573["additional_properties"], null)
  ancestors = try(local.m573["ancestors"], null)
  class_id = try(local.m573["class_id"], null)
  cluster_profiles = try(local.m573["cluster_profiles"], null)
  create_time = try(local.m573["create_time"], null)
  description = try(local.m573["description"], null)
  domain_group_moid = try(local.m573["domain_group_moid"], null)
  id = try(local.m573["id"], null)
  kvm_ip_range = try(local.m573["kvm_ip_range"], null)
  mac_prefix_range = try(local.m573["mac_prefix_range"], null)
  mod_time = try(local.m573["mod_time"], null)
  moid = try(local.m573["moid"], null)
  name = try(local.m573["name"], null)
  object_type = try(local.m573["object_type"], null)
  organization = try(local.m573["organization"], null)
  owners = try(local.m573["owners"], null)
  parent = try(local.m573["parent"], null)
  permission_resources = try(local.m573["permission_resources"], null)
  server_firmware_version = try(local.m573["server_firmware_version"], null)
  shared_scope = try(local.m573["shared_scope"], null)
  tags = try(local.m573["tags"], null)
  version_context = try(local.m573["version_context"], null)
}
