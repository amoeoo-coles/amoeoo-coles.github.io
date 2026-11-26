# Sample data source intersight_apiproxy_allow_list — reads ../models/data_intersight_apiproxy_allow_list.yml
locals { m017 = yamldecode(file("${path.module}/../models/data_intersight_apiproxy_allow_list.yml"))["data_intersight_apiproxy_allow_list"] }

data "intersight_apiproxy_allow_list" "n017" {
  account_moid = try(local.m017["account_moid"], null)
  additional_properties = try(local.m017["additional_properties"], null)
  class_id = try(local.m017["class_id"], null)
  create_time = try(local.m017["create_time"], null)
  domain_group_moid = try(local.m017["domain_group_moid"], null)
  id = try(local.m017["id"], null)
  mod_time = try(local.m017["mod_time"], null)
  moid = try(local.m017["moid"], null)
  nr_version = try(local.m017["nr_version"], null)
  object_type = try(local.m017["object_type"], null)
  owners = try(local.m017["owners"], null)
  platform = try(local.m017["platform"], null)
  results = try(local.m017["results"], null)
  shared_scope = try(local.m017["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m017["ancestors"], null) == null ? [] : local.m017["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m017["parent"], null) == null ? [] : local.m017["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m017["permission_resources"], null) == null ? [] : local.m017["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m017["tags"], null) == null ? [] : local.m017["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m017["version_context"], null) == null ? [] : local.m017["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
