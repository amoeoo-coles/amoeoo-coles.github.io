# Sample data source intersight_software_appliance_distributable — reads ../models/data_intersight_software_appliance_distributable.yml
locals { m1185 = yamldecode(file("${path.module}/../models/data_intersight_software_appliance_distributable.yml"))["data_intersight_software_appliance_distributable"] }

data "intersight_software_appliance_distributable" "n1185" {
  account_moid = try(local.m1185["account_moid"], null)
  additional_properties = try(local.m1185["additional_properties"], null)
  bundle_type = try(local.m1185["bundle_type"], null)
  class_id = try(local.m1185["class_id"], null)
  create_time = try(local.m1185["create_time"], null)
  description = try(local.m1185["description"], null)
  domain_group_moid = try(local.m1185["domain_group_moid"], null)
  download_count = try(local.m1185["download_count"], null)
  feature_source = try(local.m1185["feature_source"], null)
  guid = try(local.m1185["guid"], null)
  id = try(local.m1185["id"], null)
  image_type = try(local.m1185["image_type"], null)
  import_action = try(local.m1185["import_action"], null)
  import_state = try(local.m1185["import_state"], null)
  imported_time = try(local.m1185["imported_time"], null)
  last_access_time = try(local.m1185["last_access_time"], null)
  md5e_tag = try(local.m1185["md5e_tag"], null)
  md5sum = try(local.m1185["md5sum"], null)
  mdfid = try(local.m1185["mdfid"], null)
  mod_time = try(local.m1185["mod_time"], null)
  model = try(local.m1185["model"], null)
  moid = try(local.m1185["moid"], null)
  name = try(local.m1185["name"], null)
  nr_version = try(local.m1185["nr_version"], null)
  object_type = try(local.m1185["object_type"], null)
  owners = try(local.m1185["owners"], null)
  platform_type = try(local.m1185["platform_type"], null)
  recommended_build = try(local.m1185["recommended_build"], null)
  release_date = try(local.m1185["release_date"], null)
  release_notes_url = try(local.m1185["release_notes_url"], null)
  results = try(local.m1185["results"], null)
  sha512sum = try(local.m1185["sha512sum"], null)
  shared_scope = try(local.m1185["shared_scope"], null)
  size = try(local.m1185["size"], null)
  software_advisory_url = try(local.m1185["software_advisory_url"], null)
  software_type_id = try(local.m1185["software_type_id"], null)
  supported_models = try(local.m1185["supported_models"], null)
  vendor = try(local.m1185["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1185["ancestors"], null) == null ? [] : local.m1185["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1185["catalog"], null) == null ? [] : local.m1185["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "component_meta" {
    for_each = try(local.m1185["component_meta"], null) == null ? [] : local.m1185["component_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable_metas" {
    for_each = try(local.m1185["distributable_metas"], null) == null ? [] : local.m1185["distributable_metas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1185["nr_source"], null) == null ? [] : local.m1185["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1185["parent"], null) == null ? [] : local.m1185["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1185["permission_resources"], null) == null ? [] : local.m1185["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m1185["release"], null) == null ? [] : local.m1185["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1185["tags"], null) == null ? [] : local.m1185["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1185["version_context"], null) == null ? [] : local.m1185["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
