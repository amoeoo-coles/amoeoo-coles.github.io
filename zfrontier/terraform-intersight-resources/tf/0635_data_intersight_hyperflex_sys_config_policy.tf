# Sample data source intersight_hyperflex_sys_config_policy — reads ../models/data_intersight_hyperflex_sys_config_policy.yml
locals { m635 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_sys_config_policy.yml"))["data_intersight_hyperflex_sys_config_policy"] }

data "intersight_hyperflex_sys_config_policy" "n635" {
  account_moid = try(local.m635["account_moid"], null)
  additional_properties = try(local.m635["additional_properties"], null)
  class_id = try(local.m635["class_id"], null)
  create_time = try(local.m635["create_time"], null)
  description = try(local.m635["description"], null)
  dns_domain_name = try(local.m635["dns_domain_name"], null)
  dns_servers = try(local.m635["dns_servers"], null)
  domain_group_moid = try(local.m635["domain_group_moid"], null)
  id = try(local.m635["id"], null)
  mod_time = try(local.m635["mod_time"], null)
  moid = try(local.m635["moid"], null)
  name = try(local.m635["name"], null)
  ntp_servers = try(local.m635["ntp_servers"], null)
  object_type = try(local.m635["object_type"], null)
  owners = try(local.m635["owners"], null)
  results = try(local.m635["results"], null)
  shared_scope = try(local.m635["shared_scope"], null)
  timezone = try(local.m635["timezone"], null)
  dynamic "ancestors" {
    for_each = try(local.m635["ancestors"], null) == null ? [] : local.m635["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m635["cluster_profiles"], null) == null ? [] : local.m635["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m635["organization"], null) == null ? [] : local.m635["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m635["parent"], null) == null ? [] : local.m635["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m635["permission_resources"], null) == null ? [] : local.m635["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m635["tags"], null) == null ? [] : local.m635["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m635["version_context"], null) == null ? [] : local.m635["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
