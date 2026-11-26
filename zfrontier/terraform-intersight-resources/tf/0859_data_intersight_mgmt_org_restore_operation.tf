# Sample data source intersight_mgmt_org_restore_operation — reads ../models/data_intersight_mgmt_org_restore_operation.yml
locals { m859 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_org_restore_operation.yml"))["data_intersight_mgmt_org_restore_operation"] }

data "intersight_mgmt_org_restore_operation" "n859" {
  account_moid = try(local.m859["account_moid"], null)
  additional_properties = try(local.m859["additional_properties"], null)
  class_id = try(local.m859["class_id"], null)
  create_time = try(local.m859["create_time"], null)
  domain_group_moid = try(local.m859["domain_group_moid"], null)
  id = try(local.m859["id"], null)
  mod_time = try(local.m859["mod_time"], null)
  moid = try(local.m859["moid"], null)
  object_type = try(local.m859["object_type"], null)
  org_name = try(local.m859["org_name"], null)
  owners = try(local.m859["owners"], null)
  results = try(local.m859["results"], null)
  sequence_number = try(local.m859["sequence_number"], null)
  shared_orgs = try(local.m859["shared_orgs"], null)
  shared_scope = try(local.m859["shared_scope"], null)
  status = try(local.m859["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m859["ancestors"], null) == null ? [] : local.m859["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "category_import_data" {
    for_each = try(local.m859["category_import_data"], null) == null ? [] : local.m859["category_import_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "import_jobs" {
    for_each = try(local.m859["import_jobs"], null) == null ? [] : local.m859["import_jobs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m859["organization"], null) == null ? [] : local.m859["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m859["parent"], null) == null ? [] : local.m859["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m859["permission_resources"], null) == null ? [] : local.m859["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "restore_operation" {
    for_each = try(local.m859["restore_operation"], null) == null ? [] : local.m859["restore_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m859["tags"], null) == null ? [] : local.m859["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m859["version_context"], null) == null ? [] : local.m859["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
