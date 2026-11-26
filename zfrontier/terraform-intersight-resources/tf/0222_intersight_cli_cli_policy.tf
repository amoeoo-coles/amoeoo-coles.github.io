# Sample resource intersight_cli_cli_policy — reads ../models/intersight_cli_cli_policy.yml
locals { m222 = yamldecode(file("${path.module}/../models/intersight_cli_cli_policy.yml"))["intersight_cli_cli_policy"] }

resource "intersight_cli_cli_policy" "n222" {
  account = try(local.m222["account"], null)
  account_moid = try(local.m222["account_moid"], null)
  additional_properties = try(local.m222["additional_properties"], null)
  ancestors = try(local.m222["ancestors"], null)
  class_id = try(local.m222["class_id"], null)
  create_time = try(local.m222["create_time"], null)
  domain_group_moid = try(local.m222["domain_group_moid"], null)
  fi_and_unified_edge_ecmc_cli_launch = try(local.m222["fi_and_unified_edge_ecmc_cli_launch"], null)
  id = try(local.m222["id"], null)
  mod_time = try(local.m222["mod_time"], null)
  moid = try(local.m222["moid"], null)
  object_type = try(local.m222["object_type"], null)
  owners = try(local.m222["owners"], null)
  parent = try(local.m222["parent"], null)
  permission_resources = try(local.m222["permission_resources"], null)
  shared_scope = try(local.m222["shared_scope"], null)
  tags = try(local.m222["tags"], null)
  version_context = try(local.m222["version_context"], null)
}
