# Sample data source intersight_niatelemetry_mso_tenant_details — reads ../models/data_intersight_niatelemetry_mso_tenant_details.yml
locals { m973 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_mso_tenant_details.yml"))["data_intersight_niatelemetry_mso_tenant_details"] }

data "intersight_niatelemetry_mso_tenant_details" "n973" {
  account_moid = try(local.m973["account_moid"], null)
  additional_properties = try(local.m973["additional_properties"], null)
  class_id = try(local.m973["class_id"], null)
  create_time = try(local.m973["create_time"], null)
  deployed_sites = try(local.m973["deployed_sites"], null)
  domain_group_moid = try(local.m973["domain_group_moid"], null)
  id = try(local.m973["id"], null)
  mod_time = try(local.m973["mod_time"], null)
  moid = try(local.m973["moid"], null)
  number_of_schemas_assigned_per_tenant_in_mso = try(local.m973["number_of_schemas_assigned_per_tenant_in_mso"], null)
  object_type = try(local.m973["object_type"], null)
  owners = try(local.m973["owners"], null)
  results = try(local.m973["results"], null)
  shared_scope = try(local.m973["shared_scope"], null)
  sites_each_tenant_is_deployed_to_in_mso = try(local.m973["sites_each_tenant_is_deployed_to_in_mso"], null)
  tenant_id = try(local.m973["tenant_id"], null)
  tenant_name = try(local.m973["tenant_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m973["ancestors"], null) == null ? [] : local.m973["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m973["parent"], null) == null ? [] : local.m973["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m973["permission_resources"], null) == null ? [] : local.m973["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m973["registered_device"], null) == null ? [] : local.m973["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m973["tags"], null) == null ? [] : local.m973["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m973["version_context"], null) == null ? [] : local.m973["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
