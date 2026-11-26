# Sample data source intersight_niatelemetry_snmp_src — reads ../models/data_intersight_niatelemetry_snmp_src.yml
locals { m994 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_snmp_src.yml"))["data_intersight_niatelemetry_snmp_src"] }

data "intersight_niatelemetry_snmp_src" "n994" {
  account_moid = try(local.m994["account_moid"], null)
  additional_properties = try(local.m994["additional_properties"], null)
  class_id = try(local.m994["class_id"], null)
  common_policy = try(local.m994["common_policy"], null)
  create_time = try(local.m994["create_time"], null)
  dn = try(local.m994["dn"], null)
  domain_group_moid = try(local.m994["domain_group_moid"], null)
  id = try(local.m994["id"], null)
  mod_time = try(local.m994["mod_time"], null)
  moid = try(local.m994["moid"], null)
  object_type = try(local.m994["object_type"], null)
  owners = try(local.m994["owners"], null)
  record_type = try(local.m994["record_type"], null)
  record_version = try(local.m994["record_version"], null)
  results = try(local.m994["results"], null)
  shared_scope = try(local.m994["shared_scope"], null)
  site_name = try(local.m994["site_name"], null)
  snmp_trap_dest = try(local.m994["snmp_trap_dest"], null)
  snmp_trap_dest_grp = try(local.m994["snmp_trap_dest_grp"], null)
  dynamic "ancestors" {
    for_each = try(local.m994["ancestors"], null) == null ? [] : local.m994["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m994["parent"], null) == null ? [] : local.m994["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m994["permission_resources"], null) == null ? [] : local.m994["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m994["registered_device"], null) == null ? [] : local.m994["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m994["tags"], null) == null ? [] : local.m994["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m994["version_context"], null) == null ? [] : local.m994["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
