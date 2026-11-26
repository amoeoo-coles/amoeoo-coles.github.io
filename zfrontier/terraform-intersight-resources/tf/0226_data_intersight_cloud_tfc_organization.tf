# Sample data source intersight_cloud_tfc_organization — reads ../models/data_intersight_cloud_tfc_organization.yml
locals { m226 = yamldecode(file("${path.module}/../models/data_intersight_cloud_tfc_organization.yml"))["data_intersight_cloud_tfc_organization"] }

data "intersight_cloud_tfc_organization" "n226" {
  account_moid = try(local.m226["account_moid"], null)
  additional_properties = try(local.m226["additional_properties"], null)
  agent_ceiling = try(local.m226["agent_ceiling"], null)
  class_id = try(local.m226["class_id"], null)
  create_time = try(local.m226["create_time"], null)
  domain_group_moid = try(local.m226["domain_group_moid"], null)
  email = try(local.m226["email"], null)
  id = try(local.m226["id"], null)
  identity = try(local.m226["identity"], null)
  mod_time = try(local.m226["mod_time"], null)
  moid = try(local.m226["moid"], null)
  name = try(local.m226["name"], null)
  num_teams = try(local.m226["num_teams"], null)
  num_users = try(local.m226["num_users"], null)
  object_type = try(local.m226["object_type"], null)
  owners = try(local.m226["owners"], null)
  results = try(local.m226["results"], null)
  run_ceiling = try(local.m226["run_ceiling"], null)
  shared_scope = try(local.m226["shared_scope"], null)
  vcs_providers = try(local.m226["vcs_providers"], null)
  dynamic "ancestors" {
    for_each = try(local.m226["ancestors"], null) == null ? [] : local.m226["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m226["parent"], null) == null ? [] : local.m226["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m226["permission_resources"], null) == null ? [] : local.m226["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m226["tags"], null) == null ? [] : local.m226["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m226["target"], null) == null ? [] : local.m226["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m226["version_context"], null) == null ? [] : local.m226["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
