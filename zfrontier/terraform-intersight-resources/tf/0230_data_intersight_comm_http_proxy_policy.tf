# Sample data source intersight_comm_http_proxy_policy — reads ../models/data_intersight_comm_http_proxy_policy.yml
locals { m230 = yamldecode(file("${path.module}/../models/data_intersight_comm_http_proxy_policy.yml"))["data_intersight_comm_http_proxy_policy"] }

data "intersight_comm_http_proxy_policy" "n230" {
  account_moid = try(local.m230["account_moid"], null)
  additional_properties = try(local.m230["additional_properties"], null)
  class_id = try(local.m230["class_id"], null)
  create_time = try(local.m230["create_time"], null)
  description = try(local.m230["description"], null)
  domain_group_moid = try(local.m230["domain_group_moid"], null)
  hostname = try(local.m230["hostname"], null)
  id = try(local.m230["id"], null)
  is_password_set = try(var.secrets["data_intersight_comm_http_proxy_policy.is_password_set"], local.m230["is_password_set"])
  mod_time = try(local.m230["mod_time"], null)
  moid = try(local.m230["moid"], null)
  name = try(local.m230["name"], null)
  object_type = try(local.m230["object_type"], null)
  owners = try(local.m230["owners"], null)
  password = try(var.secrets["data_intersight_comm_http_proxy_policy.password"], local.m230["password"])
  port = try(local.m230["port"], null)
  results = try(local.m230["results"], null)
  shared_scope = try(local.m230["shared_scope"], null)
  username = try(local.m230["username"], null)
  dynamic "ancestors" {
    for_each = try(local.m230["ancestors"], null) == null ? [] : local.m230["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m230["cluster_profiles"], null) == null ? [] : local.m230["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m230["organization"], null) == null ? [] : local.m230["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m230["parent"], null) == null ? [] : local.m230["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m230["permission_resources"], null) == null ? [] : local.m230["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m230["tags"], null) == null ? [] : local.m230["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m230["version_context"], null) == null ? [] : local.m230["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
