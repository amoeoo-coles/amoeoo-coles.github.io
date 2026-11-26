# Sample resource intersight_asset_claim_token — reads ../models/intersight_asset_claim_token.yml
locals { m083 = yamldecode(file("${path.module}/../models/intersight_asset_claim_token.yml"))["intersight_asset_claim_token"] }

resource "intersight_asset_claim_token" "n083" {
  account_moid = try(local.m083["account_moid"], null)
  additional_properties = try(local.m083["additional_properties"], null)
  ancestors = try(local.m083["ancestors"], null)
  claim = try(local.m083["claim"], null)
  class_id = try(local.m083["class_id"], null)
  create_time = try(local.m083["create_time"], null)
  domain_group_moid = try(local.m083["domain_group_moid"], null)
  expiration_date = try(local.m083["expiration_date"], null)
  id = try(local.m083["id"], null)
  mod_time = try(local.m083["mod_time"], null)
  moid = try(local.m083["moid"], null)
  object_type = try(local.m083["object_type"], null)
  owners = try(local.m083["owners"], null)
  parent = try(local.m083["parent"], null)
  permission_resources = try(local.m083["permission_resources"], null)
  shared_scope = try(local.m083["shared_scope"], null)
  tags = try(local.m083["tags"], null)
  user = try(local.m083["user"], null)
  version_context = try(local.m083["version_context"], null)
}
