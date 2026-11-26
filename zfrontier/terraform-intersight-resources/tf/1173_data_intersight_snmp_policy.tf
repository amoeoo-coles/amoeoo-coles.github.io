# Sample data source intersight_snmp_policy — reads ../models/data_intersight_snmp_policy.yml
locals { m1173 = yamldecode(file("${path.module}/../models/data_intersight_snmp_policy.yml"))["data_intersight_snmp_policy"] }

data "intersight_snmp_policy" "n1173" {
  access_community_string = try(var.secrets["data_intersight_snmp_policy.access_community_string"], local.m1173["access_community_string"])
  account_moid = try(local.m1173["account_moid"], null)
  additional_properties = try(local.m1173["additional_properties"], null)
  class_id = try(local.m1173["class_id"], null)
  community_access = try(var.secrets["data_intersight_snmp_policy.community_access"], local.m1173["community_access"])
  create_time = try(local.m1173["create_time"], null)
  description = try(local.m1173["description"], null)
  domain_group_moid = try(local.m1173["domain_group_moid"], null)
  enabled = try(local.m1173["enabled"], null)
  engine_id = try(local.m1173["engine_id"], null)
  id = try(local.m1173["id"], null)
  mod_time = try(local.m1173["mod_time"], null)
  moid = try(local.m1173["moid"], null)
  name = try(local.m1173["name"], null)
  object_type = try(local.m1173["object_type"], null)
  owners = try(local.m1173["owners"], null)
  results = try(local.m1173["results"], null)
  shared_scope = try(local.m1173["shared_scope"], null)
  snmp_port = try(local.m1173["snmp_port"], null)
  sys_contact = try(local.m1173["sys_contact"], null)
  sys_location = try(local.m1173["sys_location"], null)
  trap_community = try(var.secrets["data_intersight_snmp_policy.trap_community"], local.m1173["trap_community"])
  v2_enabled = try(local.m1173["v2_enabled"], null)
  v3_enabled = try(local.m1173["v3_enabled"], null)
  dynamic "ancestors" {
    for_each = try(local.m1173["ancestors"], null) == null ? [] : local.m1173["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1173["organization"], null) == null ? [] : local.m1173["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1173["parent"], null) == null ? [] : local.m1173["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1173["permission_resources"], null) == null ? [] : local.m1173["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1173["profiles"], null) == null ? [] : local.m1173["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "snmp_traps" {
    for_each = try(local.m1173["snmp_traps"], null) == null ? [] : local.m1173["snmp_traps"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "snmp_users" {
    for_each = try(local.m1173["snmp_users"], null) == null ? [] : local.m1173["snmp_users"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1173["tags"], null) == null ? [] : local.m1173["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1173["version_context"], null) == null ? [] : local.m1173["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
