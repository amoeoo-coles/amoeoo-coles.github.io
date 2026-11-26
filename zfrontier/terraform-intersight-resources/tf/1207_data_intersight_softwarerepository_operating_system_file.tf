# Sample data source intersight_softwarerepository_operating_system_file — reads ../models/data_intersight_softwarerepository_operating_system_file.yml
locals { m1207 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_operating_system_file.yml"))["data_intersight_softwarerepository_operating_system_file"] }

data "intersight_softwarerepository_operating_system_file" "n1207" {
  account_moid = try(local.m1207["account_moid"], null)
  additional_properties = try(local.m1207["additional_properties"], null)
  bundle_type = try(local.m1207["bundle_type"], null)
  class_id = try(local.m1207["class_id"], null)
  create_time = try(local.m1207["create_time"], null)
  description = try(local.m1207["description"], null)
  domain_group_moid = try(local.m1207["domain_group_moid"], null)
  download_count = try(local.m1207["download_count"], null)
  feature_source = try(local.m1207["feature_source"], null)
  file_name = try(local.m1207["file_name"], null)
  guid = try(local.m1207["guid"], null)
  id = try(local.m1207["id"], null)
  image_type = try(local.m1207["image_type"], null)
  import_action = try(local.m1207["import_action"], null)
  import_progress = try(local.m1207["import_progress"], null)
  import_state = try(local.m1207["import_state"], null)
  imported_time = try(local.m1207["imported_time"], null)
  last_access_time = try(local.m1207["last_access_time"], null)
  md5e_tag = try(local.m1207["md5e_tag"], null)
  md5sum = try(local.m1207["md5sum"], null)
  mdfid = try(local.m1207["mdfid"], null)
  mod_time = try(local.m1207["mod_time"], null)
  model = try(local.m1207["model"], null)
  moid = try(local.m1207["moid"], null)
  name = try(local.m1207["name"], null)
  nr_version = try(local.m1207["nr_version"], null)
  object_type = try(local.m1207["object_type"], null)
  owners = try(local.m1207["owners"], null)
  platform_type = try(local.m1207["platform_type"], null)
  recommended_build = try(local.m1207["recommended_build"], null)
  release_date = try(local.m1207["release_date"], null)
  release_notes_url = try(local.m1207["release_notes_url"], null)
  results = try(local.m1207["results"], null)
  sample_hashes = try(local.m1207["sample_hashes"], null)
  sha512sum = try(local.m1207["sha512sum"], null)
  shared_scope = try(local.m1207["shared_scope"], null)
  size = try(local.m1207["size"], null)
  software_advisory_url = try(local.m1207["software_advisory_url"], null)
  software_type_id = try(local.m1207["software_type_id"], null)
  vendor = try(local.m1207["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1207["ancestors"], null) == null ? [] : local.m1207["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1207["catalog"], null) == null ? [] : local.m1207["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1207["nr_source"], null) == null ? [] : local.m1207["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1207["parent"], null) == null ? [] : local.m1207["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1207["permission_resources"], null) == null ? [] : local.m1207["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m1207["release"], null) == null ? [] : local.m1207["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1207["tags"], null) == null ? [] : local.m1207["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1207["version_context"], null) == null ? [] : local.m1207["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
