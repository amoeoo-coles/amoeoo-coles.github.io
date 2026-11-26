# Sample data source intersight_iaas_ucsd_managed_infra — reads ../models/data_intersight_iaas_ucsd_managed_infra.yml
locals { m654 = yamldecode(file("${path.module}/../models/data_intersight_iaas_ucsd_managed_infra.yml"))["data_intersight_iaas_ucsd_managed_infra"] }

data "intersight_iaas_ucsd_managed_infra" "n654" {
  account_moid = try(local.m654["account_moid"], null)
  additional_properties = try(local.m654["additional_properties"], null)
  advanced_catalog_count = try(local.m654["advanced_catalog_count"], null)
  bm_catalog_count = try(local.m654["bm_catalog_count"], null)
  class_id = try(local.m654["class_id"], null)
  container_catalog_count = try(local.m654["container_catalog_count"], null)
  create_time = try(local.m654["create_time"], null)
  domain_group_moid = try(local.m654["domain_group_moid"], null)
  esxi_host_count = try(local.m654["esxi_host_count"], null)
  external_group_count = try(local.m654["external_group_count"], null)
  hyperv_host_count = try(local.m654["hyperv_host_count"], null)
  id = try(local.m654["id"], null)
  local_group_count = try(local.m654["local_group_count"], null)
  mod_time = try(local.m654["mod_time"], null)
  moid = try(local.m654["moid"], null)
  object_type = try(local.m654["object_type"], null)
  owners = try(local.m654["owners"], null)
  results = try(local.m654["results"], null)
  shared_scope = try(local.m654["shared_scope"], null)
  standard_catalog_count = try(local.m654["standard_catalog_count"], null)
  user_count = try(local.m654["user_count"], null)
  vdc_count = try(local.m654["vdc_count"], null)
  vm_count = try(local.m654["vm_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m654["ancestors"], null) == null ? [] : local.m654["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "guid" {
    for_each = try(local.m654["guid"], null) == null ? [] : local.m654["guid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m654["parent"], null) == null ? [] : local.m654["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m654["permission_resources"], null) == null ? [] : local.m654["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m654["tags"], null) == null ? [] : local.m654["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m654["version_context"], null) == null ? [] : local.m654["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
