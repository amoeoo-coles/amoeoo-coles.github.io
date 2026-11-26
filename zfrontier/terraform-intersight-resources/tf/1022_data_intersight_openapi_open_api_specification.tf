# Sample data source intersight_openapi_open_api_specification — reads ../models/data_intersight_openapi_open_api_specification.yml
locals { m1022 = yamldecode(file("${path.module}/../models/data_intersight_openapi_open_api_specification.yml"))["data_intersight_openapi_open_api_specification"] }

data "intersight_openapi_open_api_specification" "n1022" {
  account_moid = try(local.m1022["account_moid"], null)
  additional_properties = try(local.m1022["additional_properties"], null)
  class_id = try(local.m1022["class_id"], null)
  create_time = try(local.m1022["create_time"], null)
  description = try(local.m1022["description"], null)
  domain_group_moid = try(local.m1022["domain_group_moid"], null)
  download_count = try(local.m1022["download_count"], null)
  feature_source = try(local.m1022["feature_source"], null)
  file_path = try(local.m1022["file_path"], null)
  file_upload_id = try(local.m1022["file_upload_id"], null)
  id = try(local.m1022["id"], null)
  import_action = try(local.m1022["import_action"], null)
  import_state = try(local.m1022["import_state"], null)
  imported_time = try(local.m1022["imported_time"], null)
  last_access_time = try(local.m1022["last_access_time"], null)
  md5e_tag = try(local.m1022["md5e_tag"], null)
  md5sum = try(local.m1022["md5sum"], null)
  mod_time = try(local.m1022["mod_time"], null)
  moid = try(local.m1022["moid"], null)
  name = try(local.m1022["name"], null)
  nr_version = try(local.m1022["nr_version"], null)
  object_type = try(local.m1022["object_type"], null)
  owners = try(local.m1022["owners"], null)
  release_date = try(local.m1022["release_date"], null)
  results = try(local.m1022["results"], null)
  sha512sum = try(local.m1022["sha512sum"], null)
  shared_scope = try(local.m1022["shared_scope"], null)
  size = try(local.m1022["size"], null)
  software_advisory_url = try(local.m1022["software_advisory_url"], null)
  dynamic "ancestors" {
    for_each = try(local.m1022["ancestors"], null) == null ? [] : local.m1022["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1022["nr_source"], null) == null ? [] : local.m1022["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1022["organization"], null) == null ? [] : local.m1022["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1022["parent"], null) == null ? [] : local.m1022["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1022["permission_resources"], null) == null ? [] : local.m1022["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1022["tags"], null) == null ? [] : local.m1022["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1022["version_context"], null) == null ? [] : local.m1022["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
