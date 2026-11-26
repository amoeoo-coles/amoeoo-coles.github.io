# Sample data source intersight_mgmt_config_backup_file — reads ../models/data_intersight_mgmt_config_backup_file.yml
locals { m850 = yamldecode(file("${path.module}/../models/data_intersight_mgmt_config_backup_file.yml"))["data_intersight_mgmt_config_backup_file"] }

data "intersight_mgmt_config_backup_file" "n850" {
  account_moid = try(local.m850["account_moid"], null)
  additional_properties = try(local.m850["additional_properties"], null)
  class_id = try(local.m850["class_id"], null)
  configuration_file_upload_id = try(local.m850["configuration_file_upload_id"], null)
  create_time = try(local.m850["create_time"], null)
  description = try(local.m850["description"], null)
  domain_group_moid = try(local.m850["domain_group_moid"], null)
  download_count = try(local.m850["download_count"], null)
  feature_source = try(local.m850["feature_source"], null)
  id = try(local.m850["id"], null)
  import_action = try(local.m850["import_action"], null)
  import_state = try(local.m850["import_state"], null)
  imported_time = try(local.m850["imported_time"], null)
  last_access_time = try(local.m850["last_access_time"], null)
  md5e_tag = try(local.m850["md5e_tag"], null)
  md5sum = try(local.m850["md5sum"], null)
  mod_time = try(local.m850["mod_time"], null)
  moid = try(local.m850["moid"], null)
  name = try(local.m850["name"], null)
  nr_version = try(local.m850["nr_version"], null)
  object_type = try(local.m850["object_type"], null)
  owners = try(local.m850["owners"], null)
  release_date = try(local.m850["release_date"], null)
  results = try(local.m850["results"], null)
  sha512sum = try(local.m850["sha512sum"], null)
  shared_scope = try(local.m850["shared_scope"], null)
  size = try(local.m850["size"], null)
  software_advisory_url = try(local.m850["software_advisory_url"], null)
  dynamic "account" {
    for_each = try(local.m850["account"], null) == null ? [] : local.m850["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m850["ancestors"], null) == null ? [] : local.m850["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m850["nr_source"], null) == null ? [] : local.m850["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m850["parent"], null) == null ? [] : local.m850["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m850["permission_resources"], null) == null ? [] : local.m850["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m850["tags"], null) == null ? [] : local.m850["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m850["version_context"], null) == null ? [] : local.m850["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
