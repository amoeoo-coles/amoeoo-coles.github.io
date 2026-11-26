# Sample data source intersight_syslog_policy — reads ../models/data_intersight_syslog_policy.yml
locals { m1356 = yamldecode(file("${path.module}/../models/data_intersight_syslog_policy.yml"))["data_intersight_syslog_policy"] }

data "intersight_syslog_policy" "n1356" {
  account_moid = try(local.m1356["account_moid"], null)
  additional_properties = try(local.m1356["additional_properties"], null)
  class_id = try(local.m1356["class_id"], null)
  create_time = try(local.m1356["create_time"], null)
  description = try(local.m1356["description"], null)
  domain_group_moid = try(local.m1356["domain_group_moid"], null)
  id = try(local.m1356["id"], null)
  mod_time = try(local.m1356["mod_time"], null)
  moid = try(local.m1356["moid"], null)
  name = try(local.m1356["name"], null)
  object_type = try(local.m1356["object_type"], null)
  owners = try(local.m1356["owners"], null)
  results = try(local.m1356["results"], null)
  shared_scope = try(local.m1356["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1356["ancestors"], null) == null ? [] : local.m1356["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "local_clients" {
    for_each = try(local.m1356["local_clients"], null) == null ? [] : local.m1356["local_clients"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1356["organization"], null) == null ? [] : local.m1356["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1356["parent"], null) == null ? [] : local.m1356["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1356["permission_resources"], null) == null ? [] : local.m1356["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1356["profiles"], null) == null ? [] : local.m1356["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "remote_clients" {
    for_each = try(local.m1356["remote_clients"], null) == null ? [] : local.m1356["remote_clients"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1356["tags"], null) == null ? [] : local.m1356["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1356["version_context"], null) == null ? [] : local.m1356["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
