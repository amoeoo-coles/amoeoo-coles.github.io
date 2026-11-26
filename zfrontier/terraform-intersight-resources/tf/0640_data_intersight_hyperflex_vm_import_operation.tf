# Sample data source intersight_hyperflex_vm_import_operation — reads ../models/data_intersight_hyperflex_vm_import_operation.yml
locals { m640 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_vm_import_operation.yml"))["data_intersight_hyperflex_vm_import_operation"] }

data "intersight_hyperflex_vm_import_operation" "n640" {
  account_moid = try(local.m640["account_moid"], null)
  additional_properties = try(local.m640["additional_properties"], null)
  class_id = try(local.m640["class_id"], null)
  create_time = try(local.m640["create_time"], null)
  domain_group_moid = try(local.m640["domain_group_moid"], null)
  id = try(local.m640["id"], null)
  mod_time = try(local.m640["mod_time"], null)
  moid = try(local.m640["moid"], null)
  object_type = try(local.m640["object_type"], null)
  owners = try(local.m640["owners"], null)
  results = try(local.m640["results"], null)
  shared_scope = try(local.m640["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m640["ancestors"], null) == null ? [] : local.m640["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_moid" {
    for_each = try(local.m640["device_moid"], null) == null ? [] : local.m640["device_moid"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m640["organization"], null) == null ? [] : local.m640["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m640["parent"], null) == null ? [] : local.m640["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m640["permission_resources"], null) == null ? [] : local.m640["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m640["tags"], null) == null ? [] : local.m640["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m640["version_context"], null) == null ? [] : local.m640["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
