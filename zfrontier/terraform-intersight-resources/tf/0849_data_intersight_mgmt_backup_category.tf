# Sample data source intersight_mgmt_backup_category — reads ../models/data_intersight_mgmt_backup_category.yml
locals { m849 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_backup_category.yml"))["data_intersight_mgmt_backup_category"] }

data "intersight_mgmt_backup_category" "n849" {
  account_moid = try(local.m849["account_moid"], null)
  additional_properties = try(local.m849["additional_properties"], null)
  class_id = try(local.m849["class_id"], null)
  create_time = try(local.m849["create_time"], null)
  domain_group_moid = try(local.m849["domain_group_moid"], null)
  id = try(local.m849["id"], null)
  mod_time = try(local.m849["mod_time"], null)
  moid = try(local.m849["moid"], null)
  name = try(local.m849["name"], null)
  object_type = try(local.m849["object_type"], null)
  order = try(local.m849["order"], null)
  owners = try(local.m849["owners"], null)
  reporting_services = try(local.m849["reporting_services"], null)
  results = try(local.m849["results"], null)
  scope = try(local.m849["scope"], null)
  shared_scope = try(local.m849["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m849["ancestors"], null) == null ? [] : local.m849["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m849["parent"], null) == null ? [] : local.m849["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m849["permission_resources"], null) == null ? [] : local.m849["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m849["tags"], null) == null ? [] : local.m849["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m849["version_context"], null) == null ? [] : local.m849["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
