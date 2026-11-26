# Sample data source intersight_niatelemetry_https_acl_contract_details — reads ../models/data_intersight_niatelemetry_https_acl_contract_details.yml
locals { m959 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_https_acl_contract_details.yml"))["data_intersight_niatelemetry_https_acl_contract_details"] }

data "intersight_niatelemetry_https_acl_contract_details" "n959" {
  account_moid = try(local.m959["account_moid"], null)
  additional_properties = try(local.m959["additional_properties"], null)
  class_id = try(local.m959["class_id"], null)
  consumer_dn = try(local.m959["consumer_dn"], null)
  contract_name = try(local.m959["contract_name"], null)
  create_time = try(local.m959["create_time"], null)
  domain_group_moid = try(local.m959["domain_group_moid"], null)
  id = try(local.m959["id"], null)
  mgmt_instp_dn = try(local.m959["mgmt_instp_dn"], null)
  mgmt_subnet_addresses = try(local.m959["mgmt_subnet_addresses"], null)
  mod_time = try(local.m959["mod_time"], null)
  moid = try(local.m959["moid"], null)
  object_type = try(local.m959["object_type"], null)
  owners = try(local.m959["owners"], null)
  provider_dn = try(local.m959["provider_dn"], null)
  record_type = try(local.m959["record_type"], null)
  record_version = try(local.m959["record_version"], null)
  results = try(local.m959["results"], null)
  shared_scope = try(local.m959["shared_scope"], null)
  site_name = try(local.m959["site_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m959["ancestors"], null) == null ? [] : local.m959["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m959["parent"], null) == null ? [] : local.m959["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m959["permission_resources"], null) == null ? [] : local.m959["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m959["registered_device"], null) == null ? [] : local.m959["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m959["tags"], null) == null ? [] : local.m959["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m959["version_context"], null) == null ? [] : local.m959["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
