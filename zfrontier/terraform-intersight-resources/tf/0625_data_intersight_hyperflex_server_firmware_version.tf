# Sample data source intersight_hyperflex_server_firmware_version — reads ../models/data_intersight_hyperflex_server_firmware_version.yml
locals { m625 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_server_firmware_version.yml"))["data_intersight_hyperflex_server_firmware_version"] }

data "intersight_hyperflex_server_firmware_version" "n625" {
  account_moid = try(local.m625["account_moid"], null)
  additional_properties = try(local.m625["additional_properties"], null)
  class_id = try(local.m625["class_id"], null)
  create_time = try(local.m625["create_time"], null)
  domain_group_moid = try(local.m625["domain_group_moid"], null)
  id = try(local.m625["id"], null)
  mod_time = try(local.m625["mod_time"], null)
  moid = try(local.m625["moid"], null)
  object_type = try(local.m625["object_type"], null)
  owners = try(local.m625["owners"], null)
  results = try(local.m625["results"], null)
  shared_scope = try(local.m625["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m625["ancestors"], null) == null ? [] : local.m625["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m625["app_catalog"], null) == null ? [] : local.m625["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m625["parent"], null) == null ? [] : local.m625["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m625["permission_resources"], null) == null ? [] : local.m625["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_firmware_version_entries" {
    for_each = try(local.m625["server_firmware_version_entries"], null) == null ? [] : local.m625["server_firmware_version_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m625["tags"], null) == null ? [] : local.m625["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m625["version_context"], null) == null ? [] : local.m625["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
