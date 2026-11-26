# Sample data source intersight_mgmt_config_restore_operation — reads ../models/data_intersight_mgmt_config_restore_operation.yml
locals { m856 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_restore_operation.yml"))["data_intersight_mgmt_config_restore_operation"] }

data "intersight_mgmt_config_restore_operation" "n856" {
  account_moid = try(local.m856["account_moid"], null)
  additional_properties = try(local.m856["additional_properties"], null)
  backup_account_moid = try(local.m856["backup_account_moid"], null)
  backup_name = try(local.m856["backup_name"], null)
  backup_source = try(local.m856["backup_source"], null)
  class_id = try(local.m856["class_id"], null)
  create_time = try(local.m856["create_time"], null)
  domain_group_moid = try(local.m856["domain_group_moid"], null)
  end_time = try(local.m856["end_time"], null)
  id = try(local.m856["id"], null)
  ignore_secure_properties = try(local.m856["ignore_secure_properties"], null)
  is_aes_key_set = try(local.m856["is_aes_key_set"], null)
  mod_time = try(local.m856["mod_time"], null)
  moid = try(local.m856["moid"], null)
  name = try(local.m856["name"], null)
  nr_source = try(local.m856["nr_source"], null)
  object_type = try(local.m856["object_type"], null)
  owners = try(local.m856["owners"], null)
  results = try(local.m856["results"], null)
  shared_scope = try(local.m856["shared_scope"], null)
  start_time = try(local.m856["start_time"], null)
  status = try(local.m856["status"], null)
  dynamic "account" {
    for_each = try(local.m856["account"], null) == null ? [] : local.m856["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "acct_category_import_data" {
    for_each = try(local.m856["acct_category_import_data"], null) == null ? [] : local.m856["acct_category_import_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "acct_import_jobs" {
    for_each = try(local.m856["acct_import_jobs"], null) == null ? [] : local.m856["acct_import_jobs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m856["ancestors"], null) == null ? [] : local.m856["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "local_source" {
    for_each = try(local.m856["local_source"], null) == null ? [] : local.m856["local_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "options" {
    for_each = try(local.m856["options"], null) == null ? [] : local.m856["options"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "org_import_jobs" {
    for_each = try(local.m856["org_import_jobs"], null) == null ? [] : local.m856["org_import_jobs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "org_restores" {
    for_each = try(local.m856["org_restores"], null) == null ? [] : local.m856["org_restores"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m856["parent"], null) == null ? [] : local.m856["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m856["permission_resources"], null) == null ? [] : local.m856["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m856["tags"], null) == null ? [] : local.m856["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m856["version_context"], null) == null ? [] : local.m856["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m856["workflow_info"], null) == null ? [] : local.m856["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
