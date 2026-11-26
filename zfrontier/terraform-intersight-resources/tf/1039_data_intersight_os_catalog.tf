# Sample data source intersight_os_catalog — reads ../models/data_intersight_os_catalog.yml
locals { m1039 = yamldecode(file("${path.module}/../models/data_intersight_os_catalog.yml"))["data_intersight_os_catalog"] }

data "intersight_os_catalog" "n1039" {
  account_moid = try(local.m1039["account_moid"], null)
  additional_properties = try(local.m1039["additional_properties"], null)
  class_id = try(local.m1039["class_id"], null)
  create_time = try(local.m1039["create_time"], null)
  domain_group_moid = try(local.m1039["domain_group_moid"], null)
  id = try(local.m1039["id"], null)
  mod_time = try(local.m1039["mod_time"], null)
  moid = try(local.m1039["moid"], null)
  name = try(local.m1039["name"], null)
  object_type = try(local.m1039["object_type"], null)
  owners = try(local.m1039["owners"], null)
  results = try(local.m1039["results"], null)
  shared_scope = try(local.m1039["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1039["ancestors"], null) == null ? [] : local.m1039["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "configuration_files" {
    for_each = try(local.m1039["configuration_files"], null) == null ? [] : local.m1039["configuration_files"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributions" {
    for_each = try(local.m1039["distributions"], null) == null ? [] : local.m1039["distributions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1039["organization"], null) == null ? [] : local.m1039["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1039["parent"], null) == null ? [] : local.m1039["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1039["permission_resources"], null) == null ? [] : local.m1039["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1039["tags"], null) == null ? [] : local.m1039["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1039["version_context"], null) == null ? [] : local.m1039["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
