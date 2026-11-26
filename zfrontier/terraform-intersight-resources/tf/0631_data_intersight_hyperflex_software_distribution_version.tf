# Sample data source intersight_hyperflex_software_distribution_version — reads ../models/data_intersight_hyperflex_software_distribution_version.yml
locals { m631 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_software_distribution_version.yml"))["data_intersight_hyperflex_software_distribution_version"] }

data "intersight_hyperflex_software_distribution_version" "n631" {
  account_moid = try(local.m631["account_moid"], null)
  additional_properties = try(local.m631["additional_properties"], null)
  class_id = try(local.m631["class_id"], null)
  create_time = try(local.m631["create_time"], null)
  domain_group_moid = try(local.m631["domain_group_moid"], null)
  id = try(local.m631["id"], null)
  mod_time = try(local.m631["mod_time"], null)
  moid = try(local.m631["moid"], null)
  nr_version = try(local.m631["nr_version"], null)
  object_type = try(local.m631["object_type"], null)
  owners = try(local.m631["owners"], null)
  results = try(local.m631["results"], null)
  shared_scope = try(local.m631["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m631["ancestors"], null) == null ? [] : local.m631["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distribution_components" {
    for_each = try(local.m631["distribution_components"], null) == null ? [] : local.m631["distribution_components"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m631["parent"], null) == null ? [] : local.m631["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m631["permission_resources"], null) == null ? [] : local.m631["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "software_distribution_entry" {
    for_each = try(local.m631["software_distribution_entry"], null) == null ? [] : local.m631["software_distribution_entry"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m631["tags"], null) == null ? [] : local.m631["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m631["version_context"], null) == null ? [] : local.m631["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
