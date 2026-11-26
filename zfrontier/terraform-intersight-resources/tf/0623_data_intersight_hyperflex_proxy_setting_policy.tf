# Sample data source intersight_hyperflex_proxy_setting_policy — reads ../models/data_intersight_hyperflex_proxy_setting_policy.yml
locals { m623 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_proxy_setting_policy.yml"))["data_intersight_hyperflex_proxy_setting_policy"] }

data "intersight_hyperflex_proxy_setting_policy" "n623" {
  account_moid = try(local.m623["account_moid"], null)
  additional_properties = try(local.m623["additional_properties"], null)
  class_id = try(local.m623["class_id"], null)
  create_time = try(local.m623["create_time"], null)
  description = try(local.m623["description"], null)
  domain_group_moid = try(local.m623["domain_group_moid"], null)
  hostname = try(local.m623["hostname"], null)
  id = try(local.m623["id"], null)
  is_password_set = try(var.secrets["data_intersight_hyperflex_proxy_setting_policy.is_password_set"], local.m623["is_password_set"])
  mod_time = try(local.m623["mod_time"], null)
  moid = try(local.m623["moid"], null)
  name = try(local.m623["name"], null)
  object_type = try(local.m623["object_type"], null)
  owners = try(local.m623["owners"], null)
  password = try(var.secrets["data_intersight_hyperflex_proxy_setting_policy.password"], local.m623["password"])
  port = try(local.m623["port"], null)
  results = try(local.m623["results"], null)
  shared_scope = try(local.m623["shared_scope"], null)
  username = try(local.m623["username"], null)
  dynamic "ancestors" {
    for_each = try(local.m623["ancestors"], null) == null ? [] : local.m623["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m623["cluster_profiles"], null) == null ? [] : local.m623["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m623["organization"], null) == null ? [] : local.m623["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m623["parent"], null) == null ? [] : local.m623["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m623["permission_resources"], null) == null ? [] : local.m623["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m623["tags"], null) == null ? [] : local.m623["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m623["version_context"], null) == null ? [] : local.m623["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
