# Sample data source intersight_hyperflex_software_distribution_component — reads ../models/data_intersight_hyperflex_software_distribution_component.yml
locals { m629 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_software_distribution_component.yml"))["data_intersight_hyperflex_software_distribution_component"] }

data "intersight_hyperflex_software_distribution_component" "n629" {
  account_moid = try(local.m629["account_moid"], null)
  additional_properties = try(local.m629["additional_properties"], null)
  bucket_name = try(local.m629["bucket_name"], null)
  class_id = try(local.m629["class_id"], null)
  component_id = try(local.m629["component_id"], null)
  component_name = try(local.m629["component_name"], null)
  create_time = try(local.m629["create_time"], null)
  domain_group_moid = try(local.m629["domain_group_moid"], null)
  file_path = try(local.m629["file_path"], null)
  files_to_download = try(local.m629["files_to_download"], null)
  id = try(local.m629["id"], null)
  mod_time = try(local.m629["mod_time"], null)
  moid = try(local.m629["moid"], null)
  nr_version = try(local.m629["nr_version"], null)
  object_type = try(local.m629["object_type"], null)
  owners = try(local.m629["owners"], null)
  results = try(local.m629["results"], null)
  shared_scope = try(local.m629["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m629["ancestors"], null) == null ? [] : local.m629["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m629["parent"], null) == null ? [] : local.m629["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m629["permission_resources"], null) == null ? [] : local.m629["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "software_distribution_version" {
    for_each = try(local.m629["software_distribution_version"], null) == null ? [] : local.m629["software_distribution_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m629["tags"], null) == null ? [] : local.m629["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m629["version_context"], null) == null ? [] : local.m629["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
