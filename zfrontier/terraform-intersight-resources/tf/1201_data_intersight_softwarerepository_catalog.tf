# Sample data source intersight_softwarerepository_catalog — reads ../models/data_intersight_softwarerepository_catalog.yml
locals { m1201 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_catalog.yml"))["data_intersight_softwarerepository_catalog"] }

data "intersight_softwarerepository_catalog" "n1201" {
  account_moid = try(local.m1201["account_moid"], null)
  additional_properties = try(local.m1201["additional_properties"], null)
  class_id = try(local.m1201["class_id"], null)
  create_time = try(local.m1201["create_time"], null)
  domain_group_moid = try(local.m1201["domain_group_moid"], null)
  id = try(local.m1201["id"], null)
  is_image_pull_failure = try(local.m1201["is_image_pull_failure"], null)
  mod_time = try(local.m1201["mod_time"], null)
  moid = try(local.m1201["moid"], null)
  name = try(local.m1201["name"], null)
  object_type = try(local.m1201["object_type"], null)
  owners = try(local.m1201["owners"], null)
  results = try(local.m1201["results"], null)
  shared_scope = try(local.m1201["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1201["ancestors"], null) == null ? [] : local.m1201["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1201["organization"], null) == null ? [] : local.m1201["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1201["parent"], null) == null ? [] : local.m1201["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1201["permission_resources"], null) == null ? [] : local.m1201["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system" {
    for_each = try(local.m1201["system"], null) == null ? [] : local.m1201["system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1201["tags"], null) == null ? [] : local.m1201["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1201["version_context"], null) == null ? [] : local.m1201["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
