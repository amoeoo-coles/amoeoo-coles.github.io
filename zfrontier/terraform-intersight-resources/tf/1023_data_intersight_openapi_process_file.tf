# Sample data source intersight_openapi_process_file — reads ../models/data_intersight_openapi_process_file.yml
locals { m1023 = yamldecode(file("${path.module}/../models/data_intersight_openapi_process_file.yml"))["data_intersight_openapi_process_file"] }

data "intersight_openapi_process_file" "n1023" {
  account_moid = try(local.m1023["account_moid"], null)
  additional_properties = try(local.m1023["additional_properties"], null)
  class_id = try(local.m1023["class_id"], null)
  create_time = try(local.m1023["create_time"], null)
  domain_group_moid = try(local.m1023["domain_group_moid"], null)
  failure_reason = try(local.m1023["failure_reason"], null)
  file_download_status = try(local.m1023["file_download_status"], null)
  file_processing_status = try(local.m1023["file_processing_status"], null)
  file_validation_status = try(local.m1023["file_validation_status"], null)
  id = try(local.m1023["id"], null)
  mod_time = try(local.m1023["mod_time"], null)
  moid = try(local.m1023["moid"], null)
  object_type = try(local.m1023["object_type"], null)
  owners = try(local.m1023["owners"], null)
  results = try(local.m1023["results"], null)
  shared_scope = try(local.m1023["shared_scope"], null)
  spec_file_path = try(local.m1023["spec_file_path"], null)
  dynamic "ancestors" {
    for_each = try(local.m1023["ancestors"], null) == null ? [] : local.m1023["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_info" {
    for_each = try(local.m1023["file_info"], null) == null ? [] : local.m1023["file_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1023["organization"], null) == null ? [] : local.m1023["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1023["parent"], null) == null ? [] : local.m1023["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1023["permission_resources"], null) == null ? [] : local.m1023["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1023["tags"], null) == null ? [] : local.m1023["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1023["version_context"], null) == null ? [] : local.m1023["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
