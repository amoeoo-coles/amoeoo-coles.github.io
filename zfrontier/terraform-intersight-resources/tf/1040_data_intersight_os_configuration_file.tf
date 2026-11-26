# Sample data source intersight_os_configuration_file — reads ../models/data_intersight_os_configuration_file.yml
locals { m1040 = yamldecode(file("${path.module}/../models/data_intersight_os_configuration_file.yml"))["data_intersight_os_configuration_file"] }

data "intersight_os_configuration_file" "n1040" {
  account_moid = try(local.m1040["account_moid"], null)
  additional_properties = try(local.m1040["additional_properties"], null)
  class_id = try(local.m1040["class_id"], null)
  create_time = try(local.m1040["create_time"], null)
  description = try(local.m1040["description"], null)
  domain_group_moid = try(local.m1040["domain_group_moid"], null)
  file_content = try(local.m1040["file_content"], null)
  id = try(local.m1040["id"], null)
  internal = try(local.m1040["internal"], null)
  mod_time = try(local.m1040["mod_time"], null)
  moid = try(local.m1040["moid"], null)
  name = try(local.m1040["name"], null)
  object_type = try(local.m1040["object_type"], null)
  owners = try(local.m1040["owners"], null)
  results = try(local.m1040["results"], null)
  shared_scope = try(local.m1040["shared_scope"], null)
  supported = try(local.m1040["supported"], null)
  dynamic "ancestors" {
    for_each = try(local.m1040["ancestors"], null) == null ? [] : local.m1040["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1040["catalog"], null) == null ? [] : local.m1040["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributions" {
    for_each = try(local.m1040["distributions"], null) == null ? [] : local.m1040["distributions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1040["parent"], null) == null ? [] : local.m1040["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1040["permission_resources"], null) == null ? [] : local.m1040["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "placeholders" {
    for_each = try(local.m1040["placeholders"], null) == null ? [] : local.m1040["placeholders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1040["tags"], null) == null ? [] : local.m1040["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1040["version_context"], null) == null ? [] : local.m1040["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
