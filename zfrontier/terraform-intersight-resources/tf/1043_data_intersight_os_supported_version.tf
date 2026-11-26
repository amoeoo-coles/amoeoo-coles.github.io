# Sample data source intersight_os_supported_version — reads ../models/data_intersight_os_supported_version.yml
locals { m1043 = yamldecode(file("${path.module}/../models/data_intersight_os_supported_version.yml"))["data_intersight_os_supported_version"] }

data "intersight_os_supported_version" "n1043" {
  account_moid = try(local.m1043["account_moid"], null)
  additional_properties = try(local.m1043["additional_properties"], null)
  class_id = try(local.m1043["class_id"], null)
  create_time = try(local.m1043["create_time"], null)
  domain_group_moid = try(local.m1043["domain_group_moid"], null)
  filter_options = try(local.m1043["filter_options"], null)
  id = try(local.m1043["id"], null)
  mod_time = try(local.m1043["mod_time"], null)
  moid = try(local.m1043["moid"], null)
  object_type = try(local.m1043["object_type"], null)
  owners = try(local.m1043["owners"], null)
  results = try(local.m1043["results"], null)
  shared_scope = try(local.m1043["shared_scope"], null)
  version_name = try(local.m1043["version_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1043["ancestors"], null) == null ? [] : local.m1043["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_version" {
    for_each = try(local.m1043["nr_version"], null) == null ? [] : local.m1043["nr_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1043["parent"], null) == null ? [] : local.m1043["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1043["permission_resources"], null) == null ? [] : local.m1043["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1043["tags"], null) == null ? [] : local.m1043["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vendor" {
    for_each = try(local.m1043["vendor"], null) == null ? [] : local.m1043["vendor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1043["version_context"], null) == null ? [] : local.m1043["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
