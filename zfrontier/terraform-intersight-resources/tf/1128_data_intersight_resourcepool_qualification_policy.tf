# Sample data source intersight_resourcepool_qualification_policy — reads ../models/data_intersight_resourcepool_qualification_policy.yml
locals { m1128 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_qualification_policy.yml"))["data_intersight_resourcepool_qualification_policy"] }

data "intersight_resourcepool_qualification_policy" "n1128" {
  account_moid = try(local.m1128["account_moid"], null)
  additional_properties = try(local.m1128["additional_properties"], null)
  class_id = try(local.m1128["class_id"], null)
  create_time = try(local.m1128["create_time"], null)
  description = try(local.m1128["description"], null)
  domain_group_moid = try(local.m1128["domain_group_moid"], null)
  id = try(local.m1128["id"], null)
  mod_time = try(local.m1128["mod_time"], null)
  moid = try(local.m1128["moid"], null)
  name = try(local.m1128["name"], null)
  object_type = try(local.m1128["object_type"], null)
  owners = try(local.m1128["owners"], null)
  results = try(local.m1128["results"], null)
  shared_scope = try(local.m1128["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1128["ancestors"], null) == null ? [] : local.m1128["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1128["organization"], null) == null ? [] : local.m1128["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1128["parent"], null) == null ? [] : local.m1128["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1128["permission_resources"], null) == null ? [] : local.m1128["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualifiers" {
    for_each = try(local.m1128["qualifiers"], null) == null ? [] : local.m1128["qualifiers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_pools" {
    for_each = try(local.m1128["resource_pools"], null) == null ? [] : local.m1128["resource_pools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1128["tags"], null) == null ? [] : local.m1128["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1128["version_context"], null) == null ? [] : local.m1128["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
