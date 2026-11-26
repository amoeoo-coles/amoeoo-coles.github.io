# Sample data source intersight_hyperflex_vcenter_config_policy — reads ../models/data_intersight_hyperflex_vcenter_config_policy.yml
locals { m638 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_vcenter_config_policy.yml"))["data_intersight_hyperflex_vcenter_config_policy"] }

data "intersight_hyperflex_vcenter_config_policy" "n638" {
  account_moid = try(local.m638["account_moid"], null)
  additional_properties = try(local.m638["additional_properties"], null)
  class_id = try(local.m638["class_id"], null)
  create_time = try(local.m638["create_time"], null)
  data_center = try(local.m638["data_center"], null)
  description = try(local.m638["description"], null)
  domain_group_moid = try(local.m638["domain_group_moid"], null)
  hostname = try(local.m638["hostname"], null)
  id = try(local.m638["id"], null)
  is_password_set = try(var.secrets["data_intersight_hyperflex_vcenter_config_policy.is_password_set"], local.m638["is_password_set"])
  mod_time = try(local.m638["mod_time"], null)
  moid = try(local.m638["moid"], null)
  name = try(local.m638["name"], null)
  object_type = try(local.m638["object_type"], null)
  owners = try(local.m638["owners"], null)
  password = try(var.secrets["data_intersight_hyperflex_vcenter_config_policy.password"], local.m638["password"])
  results = try(local.m638["results"], null)
  shared_scope = try(local.m638["shared_scope"], null)
  sso_url = try(local.m638["sso_url"], null)
  username = try(local.m638["username"], null)
  dynamic "ancestors" {
    for_each = try(local.m638["ancestors"], null) == null ? [] : local.m638["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_profiles" {
    for_each = try(local.m638["cluster_profiles"], null) == null ? [] : local.m638["cluster_profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m638["organization"], null) == null ? [] : local.m638["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m638["parent"], null) == null ? [] : local.m638["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m638["permission_resources"], null) == null ? [] : local.m638["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m638["tags"], null) == null ? [] : local.m638["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m638["version_context"], null) == null ? [] : local.m638["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
