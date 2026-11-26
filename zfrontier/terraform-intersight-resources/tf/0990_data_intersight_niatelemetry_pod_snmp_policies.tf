# Sample data source intersight_niatelemetry_pod_snmp_policies — reads ../models/data_intersight_niatelemetry_pod_snmp_policies.yml
locals { m990 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_pod_snmp_policies.yml"))["data_intersight_niatelemetry_pod_snmp_policies"] }

data "intersight_niatelemetry_pod_snmp_policies" "n990" {
  account_moid = try(local.m990["account_moid"], null)
  additional_properties = try(local.m990["additional_properties"], null)
  admin_st = try(local.m990["admin_st"], null)
  class_id = try(local.m990["class_id"], null)
  create_time = try(local.m990["create_time"], null)
  domain_group_moid = try(local.m990["domain_group_moid"], null)
  id = try(local.m990["id"], null)
  mod_time = try(local.m990["mod_time"], null)
  moid = try(local.m990["moid"], null)
  object_type = try(local.m990["object_type"], null)
  owners = try(local.m990["owners"], null)
  pol_dn = try(local.m990["pol_dn"], null)
  record_type = try(local.m990["record_type"], null)
  record_version = try(local.m990["record_version"], null)
  results = try(local.m990["results"], null)
  shared_scope = try(local.m990["shared_scope"], null)
  site_name = try(local.m990["site_name"], null)
  snmp_client_grp = try(local.m990["snmp_client_grp"], null)
  snmp_community = try(var.secrets["data_intersight_niatelemetry_pod_snmp_policies.snmp_community"], local.m990["snmp_community"])
  snmp_trap_fwd_server = try(local.m990["snmp_trap_fwd_server"], null)
  snmp_user = try(local.m990["snmp_user"], null)
  dynamic "ancestors" {
    for_each = try(local.m990["ancestors"], null) == null ? [] : local.m990["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m990["parent"], null) == null ? [] : local.m990["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m990["permission_resources"], null) == null ? [] : local.m990["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m990["registered_device"], null) == null ? [] : local.m990["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m990["tags"], null) == null ? [] : local.m990["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m990["version_context"], null) == null ? [] : local.m990["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
