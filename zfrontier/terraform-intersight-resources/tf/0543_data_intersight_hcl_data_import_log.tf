# Sample data source intersight_hcl_data_import_log — reads ../models/data_intersight_hcl_data_import_log.yml
locals { m543 = yamldecode(file("${path.module}/../models/data_intersight_hcl_data_import_log.yml"))["data_intersight_hcl_data_import_log"] }

data "intersight_hcl_data_import_log" "n543" {
  account_moid = try(local.m543["account_moid"], null)
  additional_properties = try(local.m543["additional_properties"], null)
  check_sum = try(local.m543["check_sum"], null)
  class_id = try(local.m543["class_id"], null)
  create_time = try(local.m543["create_time"], null)
  domain_group_moid = try(local.m543["domain_group_moid"], null)
  id = try(local.m543["id"], null)
  import_type = try(local.m543["import_type"], null)
  initiator_type = try(local.m543["initiator_type"], null)
  last_hcl_data_modified_time = try(local.m543["last_hcl_data_modified_time"], null)
  mod_time = try(local.m543["mod_time"], null)
  moid = try(local.m543["moid"], null)
  object_type = try(local.m543["object_type"], null)
  owners = try(local.m543["owners"], null)
  results = try(local.m543["results"], null)
  shared_scope = try(local.m543["shared_scope"], null)
  status = try(local.m543["status"], null)
  status_details = try(local.m543["status_details"], null)
  dynamic "account" {
    for_each = try(local.m543["account"], null) == null ? [] : local.m543["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m543["ancestors"], null) == null ? [] : local.m543["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hcl_incremental_data" {
    for_each = try(local.m543["hcl_incremental_data"], null) == null ? [] : local.m543["hcl_incremental_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m543["parent"], null) == null ? [] : local.m543["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m543["permission_resources"], null) == null ? [] : local.m543["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m543["tags"], null) == null ? [] : local.m543["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m543["version_context"], null) == null ? [] : local.m543["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
