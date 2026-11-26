# Sample data source intersight_niaapi_sn_validator_metadata — reads ../models/data_intersight_niaapi_sn_validator_metadata.yml
locals { m906 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_sn_validator_metadata.yml"))["data_intersight_niaapi_sn_validator_metadata"] }

data "intersight_niaapi_sn_validator_metadata" "n906" {
  account_moid = try(local.m906["account_moid"], null)
  additional_properties = try(local.m906["additional_properties"], null)
  checksum = try(local.m906["checksum"], null)
  class_id = try(local.m906["class_id"], null)
  create_time = try(local.m906["create_time"], null)
  domain_group_moid = try(local.m906["domain_group_moid"], null)
  file_name = try(local.m906["file_name"], null)
  id = try(local.m906["id"], null)
  mod_time = try(local.m906["mod_time"], null)
  moid = try(local.m906["moid"], null)
  nr_version = try(local.m906["nr_version"], null)
  object_type = try(local.m906["object_type"], null)
  owners = try(local.m906["owners"], null)
  results = try(local.m906["results"], null)
  shared_scope = try(local.m906["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m906["ancestors"], null) == null ? [] : local.m906["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m906["parent"], null) == null ? [] : local.m906["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m906["permission_resources"], null) == null ? [] : local.m906["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m906["tags"], null) == null ? [] : local.m906["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m906["version_context"], null) == null ? [] : local.m906["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
