# Sample data source intersight_mgmt_config_restore_category_summary — reads ../models/data_intersight_mgmt_config_restore_category_summary.yml
locals { m855 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_restore_category_summary.yml"))["data_intersight_mgmt_config_restore_category_summary"] }

data "intersight_mgmt_config_restore_category_summary" "n855" {
  account_moid = try(local.m855["account_moid"], null)
  additional_properties = try(local.m855["additional_properties"], null)
  category_name = try(local.m855["category_name"], null)
  class_id = try(local.m855["class_id"], null)
  create_time = try(local.m855["create_time"], null)
  domain_group_moid = try(local.m855["domain_group_moid"], null)
  id = try(local.m855["id"], null)
  mod_time = try(local.m855["mod_time"], null)
  moid = try(local.m855["moid"], null)
  name = try(local.m855["name"], null)
  object_type = try(local.m855["object_type"], null)
  owners = try(local.m855["owners"], null)
  results = try(local.m855["results"], null)
  scope = try(local.m855["scope"], null)
  shared_scope = try(local.m855["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m855["ancestors"], null) == null ? [] : local.m855["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m855["parent"], null) == null ? [] : local.m855["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m855["permission_resources"], null) == null ? [] : local.m855["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "restore_operation" {
    for_each = try(local.m855["restore_operation"], null) == null ? [] : local.m855["restore_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "summary_set" {
    for_each = try(local.m855["summary_set"], null) == null ? [] : local.m855["summary_set"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m855["tags"], null) == null ? [] : local.m855["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m855["version_context"], null) == null ? [] : local.m855["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
