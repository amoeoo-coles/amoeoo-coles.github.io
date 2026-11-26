# Sample data source intersight_hyperflex_server_firmware_version_entry — reads ../models/data_intersight_hyperflex_server_firmware_version_entry.yml
locals { m626 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_server_firmware_version_entry.yml"))["data_intersight_hyperflex_server_firmware_version_entry"] }

data "intersight_hyperflex_server_firmware_version_entry" "n626" {
  account_moid = try(local.m626["account_moid"], null)
  additional_properties = try(local.m626["additional_properties"], null)
  class_id = try(local.m626["class_id"], null)
  create_time = try(local.m626["create_time"], null)
  domain_group_moid = try(local.m626["domain_group_moid"], null)
  id = try(local.m626["id"], null)
  mod_time = try(local.m626["mod_time"], null)
  moid = try(local.m626["moid"], null)
  nr_version = try(local.m626["nr_version"], null)
  object_type = try(local.m626["object_type"], null)
  owners = try(local.m626["owners"], null)
  results = try(local.m626["results"], null)
  server_platform = try(local.m626["server_platform"], null)
  shared_scope = try(local.m626["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m626["ancestors"], null) == null ? [] : local.m626["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "constraint" {
    for_each = try(local.m626["constraint"], null) == null ? [] : local.m626["constraint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m626["parent"], null) == null ? [] : local.m626["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m626["permission_resources"], null) == null ? [] : local.m626["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_firmware_version" {
    for_each = try(local.m626["server_firmware_version"], null) == null ? [] : local.m626["server_firmware_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m626["tags"], null) == null ? [] : local.m626["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m626["version_context"], null) == null ? [] : local.m626["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
