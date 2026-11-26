# Sample resource intersight_compute_scrub_policy — reads ../models/intersight_compute_scrub_policy.yml
locals { m234 = yamldecode(file("${path.module}/../models/intersight_compute_scrub_policy.yml"))["intersight_compute_scrub_policy"] }

resource "intersight_compute_scrub_policy" "n234" {
  account_moid = try(local.m234["account_moid"], null)
  additional_properties = try(local.m234["additional_properties"], null)
  ancestors = try(local.m234["ancestors"], null)
  class_id = try(local.m234["class_id"], null)
  create_time = try(local.m234["create_time"], null)
  description = try(local.m234["description"], null)
  domain_group_moid = try(local.m234["domain_group_moid"], null)
  id = try(local.m234["id"], null)
  mod_time = try(local.m234["mod_time"], null)
  moid = try(local.m234["moid"], null)
  name = try(local.m234["name"], null)
  object_type = try(local.m234["object_type"], null)
  organization = try(local.m234["organization"], null)
  owners = try(local.m234["owners"], null)
  parent = try(local.m234["parent"], null)
  permission_resources = try(local.m234["permission_resources"], null)
  profiles = try(local.m234["profiles"], null)
  scrub_targets = try(local.m234["scrub_targets"], null)
  shared_scope = try(local.m234["shared_scope"], null)
  tags = try(local.m234["tags"], null)
  version_context = try(local.m234["version_context"], null)
}
