# Sample resource intersight_compute_pcie_connectivity_policy — reads ../models/intersight_compute_pcie_connectivity_policy.yml
locals { m233 = yamldecode(file("${path.module}/../models/intersight_compute_pcie_connectivity_policy.yml"))["intersight_compute_pcie_connectivity_policy"] }

resource "intersight_compute_pcie_connectivity_policy" "n233" {
  account_moid = try(local.m233["account_moid"], null)
  additional_properties = try(local.m233["additional_properties"], null)
  ancestors = try(local.m233["ancestors"], null)
  class_id = try(local.m233["class_id"], null)
  create_time = try(local.m233["create_time"], null)
  description = try(local.m233["description"], null)
  domain_group_moid = try(local.m233["domain_group_moid"], null)
  id = try(local.m233["id"], null)
  mod_time = try(local.m233["mod_time"], null)
  moid = try(local.m233["moid"], null)
  name = try(local.m233["name"], null)
  object_type = try(local.m233["object_type"], null)
  organization = try(local.m233["organization"], null)
  owners = try(local.m233["owners"], null)
  parent = try(local.m233["parent"], null)
  pcie_zones = try(local.m233["pcie_zones"], null)
  permission_resources = try(local.m233["permission_resources"], null)
  profiles = try(local.m233["profiles"], null)
  shared_scope = try(local.m233["shared_scope"], null)
  tags = try(local.m233["tags"], null)
  version_context = try(local.m233["version_context"], null)
}
