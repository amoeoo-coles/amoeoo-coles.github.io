# Sample data source intersight_firmware_distributable — reads ../models/data_intersight_firmware_distributable.yml
locals { m483 = yamldecode(file("${path.module}/../models/data_intersight_firmware_distributable.yml"))["data_intersight_firmware_distributable"] }

data "intersight_firmware_distributable" "n483" {
  account_moid = try(local.m483["account_moid"], null)
  additional_properties = try(local.m483["additional_properties"], null)
  bundle_type = try(local.m483["bundle_type"], null)
  class_id = try(local.m483["class_id"], null)
  create_time = try(local.m483["create_time"], null)
  description = try(local.m483["description"], null)
  domain_group_moid = try(local.m483["domain_group_moid"], null)
  download_count = try(local.m483["download_count"], null)
  feature_flags = try(local.m483["feature_flags"], null)
  feature_source = try(local.m483["feature_source"], null)
  file_location = try(local.m483["file_location"], null)
  guid = try(local.m483["guid"], null)
  id = try(local.m483["id"], null)
  image_category = try(local.m483["image_category"], null)
  image_type = try(local.m483["image_type"], null)
  import_action = try(local.m483["import_action"], null)
  import_state = try(local.m483["import_state"], null)
  imported_time = try(local.m483["imported_time"], null)
  is_beta = try(local.m483["is_beta"], null)
  last_access_time = try(local.m483["last_access_time"], null)
  md5e_tag = try(local.m483["md5e_tag"], null)
  md5sum = try(local.m483["md5sum"], null)
  mdfid = try(local.m483["mdfid"], null)
  mod_time = try(local.m483["mod_time"], null)
  model = try(local.m483["model"], null)
  moid = try(local.m483["moid"], null)
  name = try(local.m483["name"], null)
  nr_version = try(local.m483["nr_version"], null)
  object_type = try(local.m483["object_type"], null)
  origin = try(local.m483["origin"], null)
  owners = try(local.m483["owners"], null)
  platform_type = try(local.m483["platform_type"], null)
  recommended_build = try(local.m483["recommended_build"], null)
  release_date = try(local.m483["release_date"], null)
  release_notes_url = try(local.m483["release_notes_url"], null)
  results = try(local.m483["results"], null)
  sha512sum = try(local.m483["sha512sum"], null)
  shared_scope = try(local.m483["shared_scope"], null)
  size = try(local.m483["size"], null)
  software_advisory_url = try(local.m483["software_advisory_url"], null)
  software_type_id = try(local.m483["software_type_id"], null)
  supported_models = try(local.m483["supported_models"], null)
  vendor = try(local.m483["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m483["ancestors"], null) == null ? [] : local.m483["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m483["catalog"], null) == null ? [] : local.m483["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "component_meta" {
    for_each = try(local.m483["component_meta"], null) == null ? [] : local.m483["component_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable_metas" {
    for_each = try(local.m483["distributable_metas"], null) == null ? [] : local.m483["distributable_metas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m483["nr_source"], null) == null ? [] : local.m483["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m483["parent"], null) == null ? [] : local.m483["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m483["permission_resources"], null) == null ? [] : local.m483["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m483["release"], null) == null ? [] : local.m483["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m483["tags"], null) == null ? [] : local.m483["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m483["version_context"], null) == null ? [] : local.m483["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
