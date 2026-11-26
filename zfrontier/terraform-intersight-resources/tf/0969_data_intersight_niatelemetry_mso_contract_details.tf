# Sample data source intersight_niatelemetry_mso_contract_details — reads ../models/data_intersight_niatelemetry_mso_contract_details.yml
locals { m969 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_mso_contract_details.yml"))["data_intersight_niatelemetry_mso_contract_details"] }

data "intersight_niatelemetry_mso_contract_details" "n969" {
  account_moid = try(local.m969["account_moid"], null)
  additional_properties = try(local.m969["additional_properties"], null)
  class_id = try(local.m969["class_id"], null)
  contract_name = try(local.m969["contract_name"], null)
  create_time = try(local.m969["create_time"], null)
  deployed_sites = try(local.m969["deployed_sites"], null)
  domain_group_moid = try(local.m969["domain_group_moid"], null)
  id = try(local.m969["id"], null)
  is_local = try(local.m969["is_local"], null)
  mod_time = try(local.m969["mod_time"], null)
  moid = try(local.m969["moid"], null)
  object_type = try(local.m969["object_type"], null)
  owners = try(local.m969["owners"], null)
  reference = try(local.m969["reference"], null)
  results = try(local.m969["results"], null)
  schema_id = try(local.m969["schema_id"], null)
  schema_name = try(local.m969["schema_name"], null)
  shared_scope = try(local.m969["shared_scope"], null)
  template_name = try(local.m969["template_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m969["ancestors"], null) == null ? [] : local.m969["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m969["parent"], null) == null ? [] : local.m969["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m969["permission_resources"], null) == null ? [] : local.m969["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m969["registered_device"], null) == null ? [] : local.m969["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m969["tags"], null) == null ? [] : local.m969["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m969["version_context"], null) == null ? [] : local.m969["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
