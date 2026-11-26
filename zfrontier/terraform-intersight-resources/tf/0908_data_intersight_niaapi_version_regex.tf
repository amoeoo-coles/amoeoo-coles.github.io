# Sample data source intersight_niaapi_version_regex — reads ../models/data_intersight_niaapi_version_regex.yml
locals { m908 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_version_regex.yml"))["data_intersight_niaapi_version_regex"] }

data "intersight_niaapi_version_regex" "n908" {
  account_moid = try(local.m908["account_moid"], null)
  additional_properties = try(local.m908["additional_properties"], null)
  class_id = try(local.m908["class_id"], null)
  create_time = try(local.m908["create_time"], null)
  domain_group_moid = try(local.m908["domain_group_moid"], null)
  id = try(local.m908["id"], null)
  mod_time = try(local.m908["mod_time"], null)
  moid = try(local.m908["moid"], null)
  nr_version = try(local.m908["nr_version"], null)
  object_type = try(local.m908["object_type"], null)
  owners = try(local.m908["owners"], null)
  results = try(local.m908["results"], null)
  shared_scope = try(local.m908["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m908["ancestors"], null) == null ? [] : local.m908["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "apic" {
    for_each = try(local.m908["apic"], null) == null ? [] : local.m908["apic"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "dcnm" {
    for_each = try(local.m908["dcnm"], null) == null ? [] : local.m908["dcnm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m908["parent"], null) == null ? [] : local.m908["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m908["permission_resources"], null) == null ? [] : local.m908["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m908["tags"], null) == null ? [] : local.m908["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m908["version_context"], null) == null ? [] : local.m908["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
