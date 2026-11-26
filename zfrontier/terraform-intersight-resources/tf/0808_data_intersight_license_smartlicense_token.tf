# Sample data source intersight_license_smartlicense_token — reads ../models/data_intersight_license_smartlicense_token.yml
locals { m808 = yamldecode(file("${path.module}/../models/data_intersight_license_smartlicense_token.yml"))["data_intersight_license_smartlicense_token"] }

data "intersight_license_smartlicense_token" "n808" {
  account_moid = try(local.m808["account_moid"], null)
  additional_properties = try(local.m808["additional_properties"], null)
  class_id = try(local.m808["class_id"], null)
  create_time = try(local.m808["create_time"], null)
  domain_group_moid = try(local.m808["domain_group_moid"], null)
  id = try(local.m808["id"], null)
  mod_time = try(local.m808["mod_time"], null)
  moid = try(local.m808["moid"], null)
  object_type = try(local.m808["object_type"], null)
  owners = try(local.m808["owners"], null)
  results = try(local.m808["results"], null)
  shared_scope = try(local.m808["shared_scope"], null)
  token = try(var.secrets["data_intersight_license_smartlicense_token.token"], local.m808["token"])
  dynamic "account_license_data" {
    for_each = try(local.m808["account_license_data"], null) == null ? [] : local.m808["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m808["ancestors"], null) == null ? [] : local.m808["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m808["parent"], null) == null ? [] : local.m808["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m808["permission_resources"], null) == null ? [] : local.m808["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m808["tags"], null) == null ? [] : local.m808["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m808["version_context"], null) == null ? [] : local.m808["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
