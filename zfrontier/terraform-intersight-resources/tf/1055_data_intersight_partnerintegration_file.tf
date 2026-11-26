# Sample data source intersight_partnerintegration_file — reads ../models/data_intersight_partnerintegration_file.yml
locals { m1055 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_file.yml"))["data_intersight_partnerintegration_file"] }

data "intersight_partnerintegration_file" "n1055" {
  account_moid = try(local.m1055["account_moid"], null)
  additional_properties = try(local.m1055["additional_properties"], null)
  class_id = try(local.m1055["class_id"], null)
  create_time = try(local.m1055["create_time"], null)
  description = try(local.m1055["description"], null)
  domain_group_moid = try(local.m1055["domain_group_moid"], null)
  download_count = try(local.m1055["download_count"], null)
  feature_source = try(local.m1055["feature_source"], null)
  file_path = try(local.m1055["file_path"], null)
  file_type = try(local.m1055["file_type"], null)
  id = try(local.m1055["id"], null)
  import_action = try(local.m1055["import_action"], null)
  import_state = try(local.m1055["import_state"], null)
  imported_time = try(local.m1055["imported_time"], null)
  last_access_time = try(local.m1055["last_access_time"], null)
  md5e_tag = try(local.m1055["md5e_tag"], null)
  md5sum = try(local.m1055["md5sum"], null)
  mod_time = try(local.m1055["mod_time"], null)
  moid = try(local.m1055["moid"], null)
  name = try(local.m1055["name"], null)
  nr_version = try(local.m1055["nr_version"], null)
  object_type = try(local.m1055["object_type"], null)
  owners = try(local.m1055["owners"], null)
  release_date = try(local.m1055["release_date"], null)
  results = try(local.m1055["results"], null)
  sha512sum = try(local.m1055["sha512sum"], null)
  shared_scope = try(local.m1055["shared_scope"], null)
  size = try(local.m1055["size"], null)
  software_advisory_url = try(local.m1055["software_advisory_url"], null)
  workspace_name = try(local.m1055["workspace_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1055["ancestors"], null) == null ? [] : local.m1055["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1055["catalog"], null) == null ? [] : local.m1055["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1055["nr_source"], null) == null ? [] : local.m1055["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1055["parent"], null) == null ? [] : local.m1055["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1055["permission_resources"], null) == null ? [] : local.m1055["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1055["tags"], null) == null ? [] : local.m1055["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1055["version_context"], null) == null ? [] : local.m1055["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
