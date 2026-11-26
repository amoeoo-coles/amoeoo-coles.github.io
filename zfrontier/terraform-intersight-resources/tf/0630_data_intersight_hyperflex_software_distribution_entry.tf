# Sample data source intersight_hyperflex_software_distribution_entry — reads ../models/data_intersight_hyperflex_software_distribution_entry.yml
locals { m630 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_software_distribution_entry.yml"))["data_intersight_hyperflex_software_distribution_entry"] }

data "intersight_hyperflex_software_distribution_entry" "n630" {
  account_moid = try(local.m630["account_moid"], null)
  additional_properties = try(local.m630["additional_properties"], null)
  class_id = try(local.m630["class_id"], null)
  create_time = try(local.m630["create_time"], null)
  distribution_type = try(local.m630["distribution_type"], null)
  domain_group_moid = try(local.m630["domain_group_moid"], null)
  id = try(local.m630["id"], null)
  mod_time = try(local.m630["mod_time"], null)
  moid = try(local.m630["moid"], null)
  object_type = try(local.m630["object_type"], null)
  owners = try(local.m630["owners"], null)
  results = try(local.m630["results"], null)
  shared_scope = try(local.m630["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m630["ancestors"], null) == null ? [] : local.m630["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m630["app_catalog"], null) == null ? [] : local.m630["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distribution_versions" {
    for_each = try(local.m630["distribution_versions"], null) == null ? [] : local.m630["distribution_versions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m630["parent"], null) == null ? [] : local.m630["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m630["permission_resources"], null) == null ? [] : local.m630["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m630["tags"], null) == null ? [] : local.m630["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m630["version_context"], null) == null ? [] : local.m630["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
