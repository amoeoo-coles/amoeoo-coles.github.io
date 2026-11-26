# Sample data source intersight_software_hyperflex_distributable — reads ../models/data_intersight_software_hyperflex_distributable.yml
locals { m1191 = yamldecode(file("${path.module}/../models/data_intersight_software_hyperflex_distributable.yml"))["data_intersight_software_hyperflex_distributable"] }

data "intersight_software_hyperflex_distributable" "n1191" {
  account_moid = try(local.m1191["account_moid"], null)
  additional_properties = try(local.m1191["additional_properties"], null)
  bundle_type = try(local.m1191["bundle_type"], null)
  class_id = try(local.m1191["class_id"], null)
  create_time = try(local.m1191["create_time"], null)
  description = try(local.m1191["description"], null)
  domain_group_moid = try(local.m1191["domain_group_moid"], null)
  download_count = try(local.m1191["download_count"], null)
  feature_source = try(local.m1191["feature_source"], null)
  guid = try(local.m1191["guid"], null)
  id = try(local.m1191["id"], null)
  image_type = try(local.m1191["image_type"], null)
  import_action = try(local.m1191["import_action"], null)
  import_state = try(local.m1191["import_state"], null)
  imported_time = try(local.m1191["imported_time"], null)
  last_access_time = try(local.m1191["last_access_time"], null)
  md5e_tag = try(local.m1191["md5e_tag"], null)
  md5sum = try(local.m1191["md5sum"], null)
  mdfid = try(local.m1191["mdfid"], null)
  mod_time = try(local.m1191["mod_time"], null)
  model = try(local.m1191["model"], null)
  moid = try(local.m1191["moid"], null)
  name = try(local.m1191["name"], null)
  nr_version = try(local.m1191["nr_version"], null)
  object_type = try(local.m1191["object_type"], null)
  owners = try(local.m1191["owners"], null)
  platform_type = try(local.m1191["platform_type"], null)
  recommended_build = try(local.m1191["recommended_build"], null)
  release_date = try(local.m1191["release_date"], null)
  release_notes_url = try(local.m1191["release_notes_url"], null)
  results = try(local.m1191["results"], null)
  sha512sum = try(local.m1191["sha512sum"], null)
  shared_scope = try(local.m1191["shared_scope"], null)
  size = try(local.m1191["size"], null)
  software_advisory_url = try(local.m1191["software_advisory_url"], null)
  software_type_id = try(local.m1191["software_type_id"], null)
  supported_models = try(local.m1191["supported_models"], null)
  vendor = try(local.m1191["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1191["ancestors"], null) == null ? [] : local.m1191["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1191["catalog"], null) == null ? [] : local.m1191["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "component_meta" {
    for_each = try(local.m1191["component_meta"], null) == null ? [] : local.m1191["component_meta"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable_metas" {
    for_each = try(local.m1191["distributable_metas"], null) == null ? [] : local.m1191["distributable_metas"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_source" {
    for_each = try(local.m1191["nr_source"], null) == null ? [] : local.m1191["nr_source"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1191["parent"], null) == null ? [] : local.m1191["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1191["permission_resources"], null) == null ? [] : local.m1191["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m1191["release"], null) == null ? [] : local.m1191["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1191["tags"], null) == null ? [] : local.m1191["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1191["version_context"], null) == null ? [] : local.m1191["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
