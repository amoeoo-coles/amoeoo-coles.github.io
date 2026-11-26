# Sample data source intersight_mgmt_config_category_summary — reads ../models/data_intersight_mgmt_config_category_summary.yml
locals { m853 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_category_summary.yml"))["data_intersight_mgmt_config_category_summary"] }

data "intersight_mgmt_config_category_summary" "n853" {
  account_moid = try(local.m853["account_moid"], null)
  additional_properties = try(local.m853["additional_properties"], null)
  category_name = try(local.m853["category_name"], null)
  class_id = try(local.m853["class_id"], null)
  create_time = try(local.m853["create_time"], null)
  domain_group_moid = try(local.m853["domain_group_moid"], null)
  id = try(local.m853["id"], null)
  mod_time = try(local.m853["mod_time"], null)
  moid = try(local.m853["moid"], null)
  name = try(local.m853["name"], null)
  object_type = try(local.m853["object_type"], null)
  owners = try(local.m853["owners"], null)
  results = try(local.m853["results"], null)
  scope = try(local.m853["scope"], null)
  shared_scope = try(local.m853["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m853["ancestors"], null) == null ? [] : local.m853["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_instance" {
    for_each = try(local.m853["backup_instance"], null) == null ? [] : local.m853["backup_instance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m853["parent"], null) == null ? [] : local.m853["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m853["permission_resources"], null) == null ? [] : local.m853["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "summary_set" {
    for_each = try(local.m853["summary_set"], null) == null ? [] : local.m853["summary_set"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m853["tags"], null) == null ? [] : local.m853["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m853["version_context"], null) == null ? [] : local.m853["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
