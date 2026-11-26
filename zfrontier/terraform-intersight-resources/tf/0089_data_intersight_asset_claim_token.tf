# Sample data source intersight_asset_claim_token — reads ../models/data_intersight_asset_claim_token.yml
locals { m089 = yamldecode(file("${path.module}/../models/data_intersight_asset_claim_token.yml"))["data_intersight_asset_claim_token"] }

data "intersight_asset_claim_token" "n089" {
  account_moid = try(local.m089["account_moid"], null)
  additional_properties = try(local.m089["additional_properties"], null)
  claim = try(local.m089["claim"], null)
  class_id = try(local.m089["class_id"], null)
  create_time = try(local.m089["create_time"], null)
  domain_group_moid = try(local.m089["domain_group_moid"], null)
  expiration_date = try(local.m089["expiration_date"], null)
  id = try(local.m089["id"], null)
  mod_time = try(local.m089["mod_time"], null)
  moid = try(local.m089["moid"], null)
  object_type = try(local.m089["object_type"], null)
  owners = try(local.m089["owners"], null)
  results = try(local.m089["results"], null)
  shared_scope = try(local.m089["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m089["ancestors"], null) == null ? [] : local.m089["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m089["parent"], null) == null ? [] : local.m089["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m089["permission_resources"], null) == null ? [] : local.m089["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m089["tags"], null) == null ? [] : local.m089["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m089["user"], null) == null ? [] : local.m089["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m089["version_context"], null) == null ? [] : local.m089["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
