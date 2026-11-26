# Sample data source intersight_mgmt_org_backup_operation — reads ../models/data_intersight_mgmt_org_backup_operation.yml
locals { m858 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_org_backup_operation.yml"))["data_intersight_mgmt_org_backup_operation"] }

data "intersight_mgmt_org_backup_operation" "n858" {
  account_moid = try(local.m858["account_moid"], null)
  additional_properties = try(local.m858["additional_properties"], null)
  class_id = try(local.m858["class_id"], null)
  create_time = try(local.m858["create_time"], null)
  domain_group_moid = try(local.m858["domain_group_moid"], null)
  id = try(local.m858["id"], null)
  mod_time = try(local.m858["mod_time"], null)
  moid = try(local.m858["moid"], null)
  object_type = try(local.m858["object_type"], null)
  org_name = try(local.m858["org_name"], null)
  owners = try(local.m858["owners"], null)
  preserve_identities = try(local.m858["preserve_identities"], null)
  results = try(local.m858["results"], null)
  shared_scope = try(local.m858["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m858["account"], null) == null ? [] : local.m858["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m858["ancestors"], null) == null ? [] : local.m858["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backup_operation" {
    for_each = try(local.m858["backup_operation"], null) == null ? [] : local.m858["backup_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "category_export_data" {
    for_each = try(local.m858["category_export_data"], null) == null ? [] : local.m858["category_export_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "org_export_job" {
    for_each = try(local.m858["org_export_job"], null) == null ? [] : local.m858["org_export_job"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m858["organization"], null) == null ? [] : local.m858["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m858["parent"], null) == null ? [] : local.m858["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m858["permission_resources"], null) == null ? [] : local.m858["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m858["tags"], null) == null ? [] : local.m858["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m858["version_context"], null) == null ? [] : local.m858["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
