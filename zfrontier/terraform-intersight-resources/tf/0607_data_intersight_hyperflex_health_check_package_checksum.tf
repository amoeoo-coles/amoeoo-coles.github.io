# Sample data source intersight_hyperflex_health_check_package_checksum — reads ../models/data_intersight_hyperflex_health_check_package_checksum.yml
locals { m607 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_health_check_package_checksum.yml"))["data_intersight_hyperflex_health_check_package_checksum"] }

data "intersight_hyperflex_health_check_package_checksum" "n607" {
  account_moid = try(local.m607["account_moid"], null)
  additional_properties = try(local.m607["additional_properties"], null)
  checksum = try(local.m607["checksum"], null)
  class_id = try(local.m607["class_id"], null)
  create_time = try(local.m607["create_time"], null)
  domain_group_moid = try(local.m607["domain_group_moid"], null)
  id = try(local.m607["id"], null)
  mod_time = try(local.m607["mod_time"], null)
  moid = try(local.m607["moid"], null)
  name = try(local.m607["name"], null)
  nr_version = try(local.m607["nr_version"], null)
  object_type = try(local.m607["object_type"], null)
  owners = try(local.m607["owners"], null)
  package_name = try(local.m607["package_name"], null)
  results = try(local.m607["results"], null)
  shared_scope = try(local.m607["shared_scope"], null)
  timestamp = try(local.m607["timestamp"], null)
  dynamic "ancestors" {
    for_each = try(local.m607["ancestors"], null) == null ? [] : local.m607["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m607["parent"], null) == null ? [] : local.m607["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m607["permission_resources"], null) == null ? [] : local.m607["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m607["tags"], null) == null ? [] : local.m607["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m607["version_context"], null) == null ? [] : local.m607["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
