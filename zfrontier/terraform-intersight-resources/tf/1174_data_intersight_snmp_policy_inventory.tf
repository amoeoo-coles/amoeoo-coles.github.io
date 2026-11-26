# Sample data source intersight_snmp_policy_inventory — reads ../models/data_intersight_snmp_policy_inventory.yml
locals { m1174 = yamldecode(file("${path.module}/../models/data_intersight_snmp_policy_inventory.yml"))["data_intersight_snmp_policy_inventory"] }

data "intersight_snmp_policy_inventory" "n1174" {
  access_community_string = try(var.secrets["data_intersight_snmp_policy_inventory.access_community_string"], local.m1174["access_community_string"])
  account_moid = try(local.m1174["account_moid"], null)
  additional_properties = try(local.m1174["additional_properties"], null)
  class_id = try(local.m1174["class_id"], null)
  community_access = try(var.secrets["data_intersight_snmp_policy_inventory.community_access"], local.m1174["community_access"])
  create_time = try(local.m1174["create_time"], null)
  description = try(local.m1174["description"], null)
  device_mo_id = try(local.m1174["device_mo_id"], null)
  domain_group_moid = try(local.m1174["domain_group_moid"], null)
  enabled = try(local.m1174["enabled"], null)
  engine_id = try(local.m1174["engine_id"], null)
  id = try(local.m1174["id"], null)
  mod_time = try(local.m1174["mod_time"], null)
  moid = try(local.m1174["moid"], null)
  name = try(local.m1174["name"], null)
  object_type = try(local.m1174["object_type"], null)
  owners = try(local.m1174["owners"], null)
  results = try(local.m1174["results"], null)
  shared_scope = try(local.m1174["shared_scope"], null)
  snmp_port = try(local.m1174["snmp_port"], null)
  sys_contact = try(local.m1174["sys_contact"], null)
  sys_location = try(local.m1174["sys_location"], null)
  trap_community = try(var.secrets["data_intersight_snmp_policy_inventory.trap_community"], local.m1174["trap_community"])
  v2_enabled = try(local.m1174["v2_enabled"], null)
  v3_enabled = try(local.m1174["v3_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m1174["ancestors"], null) == null ? [] : local.m1174["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1174["parent"], null) == null ? [] : local.m1174["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1174["permission_resources"], null) == null ? [] : local.m1174["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "snmp_traps" {
    for_each = try(local.m1174["snmp_traps"], null) == null ? [] : local.m1174["snmp_traps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "snmp_users" {
    for_each = try(local.m1174["snmp_users"], null) == null ? [] : local.m1174["snmp_users"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1174["tags"], null) == null ? [] : local.m1174["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target_mo" {
    for_each = try(local.m1174["target_mo"], null) == null ? [] : local.m1174["target_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1174["version_context"], null) == null ? [] : local.m1174["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
