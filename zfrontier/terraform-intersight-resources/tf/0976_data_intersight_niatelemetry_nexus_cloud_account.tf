# Sample data source intersight_niatelemetry_nexus_cloud_account — reads ../models/data_intersight_niatelemetry_nexus_cloud_account.yml
locals { m976 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_nexus_cloud_account.yml"))["data_intersight_niatelemetry_nexus_cloud_account"] }

data "intersight_niatelemetry_nexus_cloud_account" "n976" {
  account_moid = try(local.m976["account_moid"], null)
  aci_count = try(local.m976["aci_count"], null)
  additional_properties = try(local.m976["additional_properties"], null)
  class_id = try(local.m976["class_id"], null)
  create_time = try(local.m976["create_time"], null)
  domain_group_moid = try(local.m976["domain_group_moid"], null)
  id = try(local.m976["id"], null)
  mod_time = try(local.m976["mod_time"], null)
  moid = try(local.m976["moid"], null)
  nxos_count = try(local.m976["nxos_count"], null)
  object_type = try(local.m976["object_type"], null)
  owners = try(local.m976["owners"], null)
  results = try(local.m976["results"], null)
  shared_scope = try(local.m976["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m976["account"], null) == null ? [] : local.m976["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m976["ancestors"], null) == null ? [] : local.m976["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m976["parent"], null) == null ? [] : local.m976["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m976["permission_resources"], null) == null ? [] : local.m976["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m976["tags"], null) == null ? [] : local.m976["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m976["version_context"], null) == null ? [] : local.m976["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
