# Sample data source intersight_hyperflex_ext_iscsi_storage_policy — reads ../models/data_intersight_hyperflex_ext_iscsi_storage_policy.yml
locals { m600 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_ext_iscsi_storage_policy.yml"))["data_intersight_hyperflex_ext_iscsi_storage_policy"] }

data "intersight_hyperflex_ext_iscsi_storage_policy" "n600" {
  account_moid = try(local.m600["account_moid"], null)
  additional_properties = try(local.m600["additional_properties"], null)
  admin_state = try(local.m600["admin_state"], null)
  class_id = try(local.m600["class_id"], null)
  create_time = try(local.m600["create_time"], null)
  description = try(local.m600["description"], null)
  domain_group_moid = try(local.m600["domain_group_moid"], null)
  id = try(local.m600["id"], null)
  mod_time = try(local.m600["mod_time"], null)
  moid = try(local.m600["moid"], null)
  name = try(local.m600["name"], null)
  object_type = try(local.m600["object_type"], null)
  owners = try(local.m600["owners"], null)
  results = try(local.m600["results"], null)
  shared_scope = try(local.m600["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m600["ancestors"], null) == null ? [] : local.m600["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m600["cluster_profiles"], null) == null ? [] : local.m600["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "exta_traffic" {
    for_each = try(local.m600["exta_traffic"], null) == null ? [] : local.m600["exta_traffic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "extb_traffic" {
    for_each = try(local.m600["extb_traffic"], null) == null ? [] : local.m600["extb_traffic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m600["organization"], null) == null ? [] : local.m600["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m600["parent"], null) == null ? [] : local.m600["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m600["permission_resources"], null) == null ? [] : local.m600["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m600["tags"], null) == null ? [] : local.m600["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m600["version_context"], null) == null ? [] : local.m600["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
