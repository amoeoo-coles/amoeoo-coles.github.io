# Sample data source intersight_resourcepool_chassis_qualification_policy — reads ../models/data_intersight_resourcepool_chassis_qualification_policy.yml
locals { m1122 = yamldecode(file("${path.module}/../models/data_intersight_resourcepool_chassis_qualification_policy.yml"))["data_intersight_resourcepool_chassis_qualification_policy"] }

data "intersight_resourcepool_chassis_qualification_policy" "n1122" {
  account_moid = try(local.m1122["account_moid"], null)
  additional_properties = try(local.m1122["additional_properties"], null)
  class_id = try(local.m1122["class_id"], null)
  create_time = try(local.m1122["create_time"], null)
  description = try(local.m1122["description"], null)
  domain_group_moid = try(local.m1122["domain_group_moid"], null)
  exclude_servers = try(local.m1122["exclude_servers"], null)
  id = try(local.m1122["id"], null)
  mod_time = try(local.m1122["mod_time"], null)
  moid = try(local.m1122["moid"], null)
  name = try(local.m1122["name"], null)
  object_type = try(local.m1122["object_type"], null)
  owners = try(local.m1122["owners"], null)
  results = try(local.m1122["results"], null)
  shared_scope = try(local.m1122["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1122["ancestors"], null) == null ? [] : local.m1122["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1122["organization"], null) == null ? [] : local.m1122["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1122["parent"], null) == null ? [] : local.m1122["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1122["permission_resources"], null) == null ? [] : local.m1122["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "qualifiers" {
    for_each = try(local.m1122["qualifiers"], null) == null ? [] : local.m1122["qualifiers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_pools" {
    for_each = try(local.m1122["resource_pools"], null) == null ? [] : local.m1122["resource_pools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1122["tags"], null) == null ? [] : local.m1122["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1122["version_context"], null) == null ? [] : local.m1122["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
