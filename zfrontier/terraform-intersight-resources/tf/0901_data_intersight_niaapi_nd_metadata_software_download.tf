# Sample data source intersight_niaapi_nd_metadata_software_download — reads ../models/data_intersight_niaapi_nd_metadata_software_download.yml
locals { m901 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_nd_metadata_software_download.yml"))["data_intersight_niaapi_nd_metadata_software_download"] }

data "intersight_niaapi_nd_metadata_software_download" "n901" {
  account_moid = try(local.m901["account_moid"], null)
  additional_properties = try(local.m901["additional_properties"], null)
  class_id = try(local.m901["class_id"], null)
  create_time = try(local.m901["create_time"], null)
  description = try(local.m901["description"], null)
  domain_group_moid = try(local.m901["domain_group_moid"], null)
  id = try(local.m901["id"], null)
  mod_time = try(local.m901["mod_time"], null)
  moid = try(local.m901["moid"], null)
  name = try(local.m901["name"], null)
  nr_version = try(local.m901["nr_version"], null)
  object_type = try(local.m901["object_type"], null)
  owners = try(local.m901["owners"], null)
  release_date = try(local.m901["release_date"], null)
  results = try(local.m901["results"], null)
  shared_scope = try(local.m901["shared_scope"], null)
  size = try(local.m901["size"], null)
  type = try(local.m901["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m901["ancestors"], null) == null ? [] : local.m901["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m901["parent"], null) == null ? [] : local.m901["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m901["permission_resources"], null) == null ? [] : local.m901["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m901["tags"], null) == null ? [] : local.m901["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m901["version_context"], null) == null ? [] : local.m901["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
