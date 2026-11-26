# Sample data source intersight_firmware_server_configuration_utility_distributable — reads ../models/data_intersight_firmware_server_configuration_utility_distributable.yml
locals { m502 = yamldecode(file("${path.module}/../models/data_intersight_firmware_server_configuration_utility_distributable.yml"))["data_intersight_firmware_server_configuration_utility_distributable"] }

data "intersight_firmware_server_configuration_utility_distributable" "n502" {
  account_moid = try(local.m502["account_moid"], null)
  additional_properties = try(local.m502["additional_properties"], null)
  bundle_type = try(local.m502["bundle_type"], null)
  class_id = try(local.m502["class_id"], null)
  create_time = try(local.m502["create_time"], null)
  description = try(local.m502["description"], null)
  domain_group_moid = try(local.m502["domain_group_moid"], null)
  download_count = try(local.m502["download_count"], null)
  feature_source = try(local.m502["feature_source"], null)
  guid = try(local.m502["guid"], null)
  id = try(local.m502["id"], null)
  image_type = try(local.m502["image_type"], null)
  import_action = try(local.m502["import_action"], null)
  import_state = try(local.m502["import_state"], null)
  imported_time = try(local.m502["imported_time"], null)
  last_access_time = try(local.m502["last_access_time"], null)
  md5e_tag = try(local.m502["md5e_tag"], null)
  md5sum = try(local.m502["md5sum"], null)
  mdfid = try(local.m502["mdfid"], null)
  mod_time = try(local.m502["mod_time"], null)
  model = try(local.m502["model"], null)
  moid = try(local.m502["moid"], null)
  name = try(local.m502["name"], null)
  nr_version = try(local.m502["nr_version"], null)
  object_type = try(local.m502["object_type"], null)
  owners = try(local.m502["owners"], null)
  platform_type = try(local.m502["platform_type"], null)
  recommended_build = try(local.m502["recommended_build"], null)
  release_date = try(local.m502["release_date"], null)
  release_notes_url = try(local.m502["release_notes_url"], null)
  results = try(local.m502["results"], null)
  sha512sum = try(local.m502["sha512sum"], null)
  shared_scope = try(local.m502["shared_scope"], null)
  size = try(local.m502["size"], null)
  software_advisory_url = try(local.m502["software_advisory_url"], null)
  software_type_id = try(local.m502["software_type_id"], null)
  supported_models = try(local.m502["supported_models"], null)
  vendor = try(local.m502["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m502["ancestors"], null) == null ? [] : local.m502["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m502["catalog"], null) == null ? [] : local.m502["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "component_meta" {
    for_each = try(local.m502["component_meta"], null) == null ? [] : local.m502["component_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable_metas" {
    for_each = try(local.m502["distributable_metas"], null) == null ? [] : local.m502["distributable_metas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m502["nr_source"], null) == null ? [] : local.m502["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m502["parent"], null) == null ? [] : local.m502["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m502["permission_resources"], null) == null ? [] : local.m502["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m502["release"], null) == null ? [] : local.m502["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m502["tags"], null) == null ? [] : local.m502["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m502["version_context"], null) == null ? [] : local.m502["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
