# Sample resource intersight_hyperflex_service_auth_token — reads ../models/intersight_hyperflex_service_auth_token.yml
locals { m569 = yamldecode(file("${path.module}/../models/intersight_hyperflex_service_auth_token.yml"))["intersight_hyperflex_service_auth_token"] }

resource "intersight_hyperflex_service_auth_token" "n569" {
  account_moid = try(local.m569["account_moid"], null)
  additional_properties = try(local.m569["additional_properties"], null)
  ancestors = try(local.m569["ancestors"], null)
  class_id = try(local.m569["class_id"], null)
  client_id = try(local.m569["client_id"], null)
  cluster = try(local.m569["cluster"], null)
  create_time = try(local.m569["create_time"], null)
  csi_version = try(local.m569["csi_version"], null)
  domain_group_moid = try(local.m569["domain_group_moid"], null)
  id = try(local.m569["id"], null)
  mod_time = try(local.m569["mod_time"], null)
  moid = try(local.m569["moid"], null)
  object_type = try(local.m569["object_type"], null)
  organization = try(local.m569["organization"], null)
  owners = try(local.m569["owners"], null)
  parent = try(local.m569["parent"], null)
  permission_resources = try(local.m569["permission_resources"], null)
  service_auth_token = try(var.secrets["intersight_hyperflex_service_auth_token.service_auth_token"], local.m569["service_auth_token"])
  shared_scope = try(local.m569["shared_scope"], null)
  status = try(local.m569["status"], null)
  tags = try(local.m569["tags"], null)
  token_owner = try(var.secrets["intersight_hyperflex_service_auth_token.token_owner"], local.m569["token_owner"])
  version_context = try(local.m569["version_context"], null)
}
