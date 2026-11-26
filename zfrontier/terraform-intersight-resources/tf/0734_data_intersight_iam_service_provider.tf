# Sample data source intersight_iam_service_provider — reads ../models/data_intersight_iam_service_provider.yml
locals { m734 = yamldecode(file("${path.module}/../models/data_intersight_iam_service_provider.yml"))["data_intersight_iam_service_provider"] }

data "intersight_iam_service_provider" "n734" {
  account_moid = try(local.m734["account_moid"], null)
  additional_properties = try(local.m734["additional_properties"], null)
  cert_expiry_time = try(local.m734["cert_expiry_time"], null)
  class_id = try(local.m734["class_id"], null)
  create_time = try(local.m734["create_time"], null)
  domain_group_moid = try(local.m734["domain_group_moid"], null)
  entity_id = try(local.m734["entity_id"], null)
  id = try(local.m734["id"], null)
  metadata = try(local.m734["metadata"], null)
  mod_time = try(local.m734["mod_time"], null)
  moid = try(local.m734["moid"], null)
  name = try(local.m734["name"], null)
  object_type = try(local.m734["object_type"], null)
  owners = try(local.m734["owners"], null)
  results = try(local.m734["results"], null)
  shared_scope = try(local.m734["shared_scope"], null)
  sp_metadata_expiry_state = try(local.m734["sp_metadata_expiry_state"], null)
  sp_metadata_type = try(local.m734["sp_metadata_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m734["ancestors"], null) == null ? [] : local.m734["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m734["parent"], null) == null ? [] : local.m734["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m734["permission_resources"], null) == null ? [] : local.m734["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m734["system"], null) == null ? [] : local.m734["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m734["tags"], null) == null ? [] : local.m734["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m734["version_context"], null) == null ? [] : local.m734["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
