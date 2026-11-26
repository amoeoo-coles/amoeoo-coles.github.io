# Sample data source intersight_iaas_connector_pack — reads ../models/data_intersight_iaas_connector_pack.yml
locals { m645 = yamldecode(file("${path.module}/../models/data_intersight_iaas_connector_pack.yml"))["data_intersight_iaas_connector_pack"] }

data "intersight_iaas_connector_pack" "n645" {
  account_moid = try(local.m645["account_moid"], null)
  additional_properties = try(local.m645["additional_properties"], null)
  class_id = try(local.m645["class_id"], null)
  complete_version = try(local.m645["complete_version"], null)
  create_time = try(local.m645["create_time"], null)
  dependency_names = try(local.m645["dependency_names"], null)
  domain_group_moid = try(local.m645["domain_group_moid"], null)
  downloaded_version = try(local.m645["downloaded_version"], null)
  id = try(local.m645["id"], null)
  mod_time = try(local.m645["mod_time"], null)
  moid = try(local.m645["moid"], null)
  name = try(local.m645["name"], null)
  nr_version = try(local.m645["nr_version"], null)
  object_type = try(local.m645["object_type"], null)
  owners = try(local.m645["owners"], null)
  results = try(local.m645["results"], null)
  shared_scope = try(local.m645["shared_scope"], null)
  state = try(local.m645["state"], null)
  dynamic "ancestors" {
    for_each = try(local.m645["ancestors"], null) == null ? [] : local.m645["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m645["guid"], null) == null ? [] : local.m645["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m645["parent"], null) == null ? [] : local.m645["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m645["permission_resources"], null) == null ? [] : local.m645["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m645["tags"], null) == null ? [] : local.m645["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m645["version_context"], null) == null ? [] : local.m645["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
