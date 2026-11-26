# Sample data source intersight_tam_advisory_definition — reads ../models/data_intersight_tam_advisory_definition.yml
locals { m1360 = yamldecode(file("${path.module}/../models/data_intersight_tam_advisory_definition.yml"))["data_intersight_tam_advisory_definition"] }

data "intersight_tam_advisory_definition" "n1360" {
  account_moid = try(local.m1360["account_moid"], null)
  additional_properties = try(local.m1360["additional_properties"], null)
  advisory_id = try(local.m1360["advisory_id"], null)
  class_id = try(local.m1360["class_id"], null)
  create_time = try(local.m1360["create_time"], null)
  date_published = try(local.m1360["date_published"], null)
  date_updated = try(local.m1360["date_updated"], null)
  description = try(local.m1360["description"], null)
  domain_group_moid = try(local.m1360["domain_group_moid"], null)
  execute_on_pod = try(local.m1360["execute_on_pod"], null)
  external_url = try(local.m1360["external_url"], null)
  id = try(local.m1360["id"], null)
  mod_time = try(local.m1360["mod_time"], null)
  moid = try(local.m1360["moid"], null)
  name = try(local.m1360["name"], null)
  nr_version = try(local.m1360["nr_version"], null)
  object_type = try(local.m1360["object_type"], null)
  other_ref_urls = try(local.m1360["other_ref_urls"], null)
  owners = try(local.m1360["owners"], null)
  recommendation = try(local.m1360["recommendation"], null)
  results = try(local.m1360["results"], null)
  shared_scope = try(local.m1360["shared_scope"], null)
  state = try(local.m1360["state"], null)
  type = try(local.m1360["type"], null)
  workaround = try(local.m1360["workaround"], null)
  dynamic "actions" {
    for_each = try(local.m1360["actions"], null) == null ? [] : local.m1360["actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "advisory_details" {
    for_each = try(local.m1360["advisory_details"], null) == null ? [] : local.m1360["advisory_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1360["ancestors"], null) == null ? [] : local.m1360["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "api_data_sources" {
    for_each = try(local.m1360["api_data_sources"], null) == null ? [] : local.m1360["api_data_sources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1360["organization"], null) == null ? [] : local.m1360["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1360["parent"], null) == null ? [] : local.m1360["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1360["permission_resources"], null) == null ? [] : local.m1360["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "s3_data_sources" {
    for_each = try(local.m1360["s3_data_sources"], null) == null ? [] : local.m1360["s3_data_sources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "severity" {
    for_each = try(local.m1360["severity"], null) == null ? [] : local.m1360["severity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1360["tags"], null) == null ? [] : local.m1360["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1360["version_context"], null) == null ? [] : local.m1360["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
