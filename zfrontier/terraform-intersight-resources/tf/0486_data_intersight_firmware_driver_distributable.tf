# Sample data source intersight_firmware_driver_distributable — reads ../models/data_intersight_firmware_driver_distributable.yml
locals { m486 = yamldecode(file("${path.module}/../models/data_intersight_firmware_driver_distributable.yml"))["data_intersight_firmware_driver_distributable"] }

data "intersight_firmware_driver_distributable" "n486" {
  account_moid = try(local.m486["account_moid"], null)
  additional_properties = try(local.m486["additional_properties"], null)
  bundle_type = try(local.m486["bundle_type"], null)
  category = try(local.m486["category"], null)
  class_id = try(local.m486["class_id"], null)
  create_time = try(local.m486["create_time"], null)
  description = try(local.m486["description"], null)
  directory = try(local.m486["directory"], null)
  domain_group_moid = try(local.m486["domain_group_moid"], null)
  download_count = try(local.m486["download_count"], null)
  feature_source = try(local.m486["feature_source"], null)
  guid = try(local.m486["guid"], null)
  id = try(local.m486["id"], null)
  image_type = try(local.m486["image_type"], null)
  import_action = try(local.m486["import_action"], null)
  import_state = try(local.m486["import_state"], null)
  imported_time = try(local.m486["imported_time"], null)
  last_access_time = try(local.m486["last_access_time"], null)
  md5e_tag = try(local.m486["md5e_tag"], null)
  md5sum = try(local.m486["md5sum"], null)
  mdfid = try(local.m486["mdfid"], null)
  mod_time = try(local.m486["mod_time"], null)
  model = try(local.m486["model"], null)
  moid = try(local.m486["moid"], null)
  name = try(local.m486["name"], null)
  nr_version = try(local.m486["nr_version"], null)
  object_type = try(local.m486["object_type"], null)
  osname = try(local.m486["osname"], null)
  osversion = try(local.m486["osversion"], null)
  owners = try(local.m486["owners"], null)
  platform_type = try(local.m486["platform_type"], null)
  recommended_build = try(local.m486["recommended_build"], null)
  release_date = try(local.m486["release_date"], null)
  release_notes_url = try(local.m486["release_notes_url"], null)
  results = try(local.m486["results"], null)
  sha512sum = try(local.m486["sha512sum"], null)
  shared_scope = try(local.m486["shared_scope"], null)
  size = try(local.m486["size"], null)
  software_advisory_url = try(local.m486["software_advisory_url"], null)
  software_type_id = try(local.m486["software_type_id"], null)
  supported_models = try(local.m486["supported_models"], null)
  vendor = try(local.m486["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m486["ancestors"], null) == null ? [] : local.m486["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m486["catalog"], null) == null ? [] : local.m486["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "component_meta" {
    for_each = try(local.m486["component_meta"], null) == null ? [] : local.m486["component_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable_metas" {
    for_each = try(local.m486["distributable_metas"], null) == null ? [] : local.m486["distributable_metas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m486["nr_source"], null) == null ? [] : local.m486["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m486["parent"], null) == null ? [] : local.m486["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m486["permission_resources"], null) == null ? [] : local.m486["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m486["release"], null) == null ? [] : local.m486["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m486["tags"], null) == null ? [] : local.m486["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m486["version_context"], null) == null ? [] : local.m486["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
