# Sample data source intersight_hyperflex_service_auth_token — reads ../models/data_intersight_hyperflex_service_auth_token.yml
locals { m628 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_service_auth_token.yml"))["data_intersight_hyperflex_service_auth_token"] }

data "intersight_hyperflex_service_auth_token" "n628" {
  account_moid = try(local.m628["account_moid"], null)
  additional_properties = try(local.m628["additional_properties"], null)
  class_id = try(local.m628["class_id"], null)
  client_id = try(local.m628["client_id"], null)
  create_time = try(local.m628["create_time"], null)
  csi_version = try(local.m628["csi_version"], null)
  domain_group_moid = try(local.m628["domain_group_moid"], null)
  id = try(local.m628["id"], null)
  mod_time = try(local.m628["mod_time"], null)
  moid = try(local.m628["moid"], null)
  object_type = try(local.m628["object_type"], null)
  owners = try(local.m628["owners"], null)
  results = try(local.m628["results"], null)
  service_auth_token = try(var.secrets["data_intersight_hyperflex_service_auth_token.service_auth_token"], local.m628["service_auth_token"])
  shared_scope = try(local.m628["shared_scope"], null)
  status = try(local.m628["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m628["ancestors"], null) == null ? [] : local.m628["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m628["cluster"], null) == null ? [] : local.m628["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m628["organization"], null) == null ? [] : local.m628["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m628["parent"], null) == null ? [] : local.m628["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m628["permission_resources"], null) == null ? [] : local.m628["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m628["tags"], null) == null ? [] : local.m628["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "token_owner" {
    for_each = try(local.m628["token_owner"], null) == null ? [] : local.m628["token_owner"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m628["version_context"], null) == null ? [] : local.m628["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
