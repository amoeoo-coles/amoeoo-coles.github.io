# Sample data source intersight_tam_security_advisory — reads ../models/data_intersight_tam_security_advisory.yml
locals { m1363 = yamldecode(file("${path.module}/../models/data_intersight_tam_security_advisory.yml"))["data_intersight_tam_security_advisory"] }

data "intersight_tam_security_advisory" "n1363" {
  account_moid = try(local.m1363["account_moid"], null)
  additional_properties = try(local.m1363["additional_properties"], null)
  advisory_id = try(local.m1363["advisory_id"], null)
  base_score = try(local.m1363["base_score"], null)
  class_id = try(local.m1363["class_id"], null)
  create_time = try(local.m1363["create_time"], null)
  cve_ids = try(local.m1363["cve_ids"], null)
  date_published = try(local.m1363["date_published"], null)
  date_updated = try(local.m1363["date_updated"], null)
  description = try(local.m1363["description"], null)
  domain_group_moid = try(local.m1363["domain_group_moid"], null)
  environmental_score = try(local.m1363["environmental_score"], null)
  execute_on_pod = try(local.m1363["execute_on_pod"], null)
  external_url = try(local.m1363["external_url"], null)
  id = try(local.m1363["id"], null)
  mod_time = try(local.m1363["mod_time"], null)
  moid = try(local.m1363["moid"], null)
  name = try(local.m1363["name"], null)
  nr_version = try(local.m1363["nr_version"], null)
  object_type = try(local.m1363["object_type"], null)
  other_ref_urls = try(local.m1363["other_ref_urls"], null)
  owners = try(local.m1363["owners"], null)
  recommendation = try(local.m1363["recommendation"], null)
  results = try(local.m1363["results"], null)
  shared_scope = try(local.m1363["shared_scope"], null)
  state = try(local.m1363["state"], null)
  status = try(local.m1363["status"], null)
  temporal_score = try(local.m1363["temporal_score"], null)
  workaround = try(local.m1363["workaround"], null)
  dynamic "actions" {
    for_each = try(local.m1363["actions"], null) == null ? [] : local.m1363["actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1363["ancestors"], null) == null ? [] : local.m1363["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "api_data_sources" {
    for_each = try(local.m1363["api_data_sources"], null) == null ? [] : local.m1363["api_data_sources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1363["organization"], null) == null ? [] : local.m1363["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1363["parent"], null) == null ? [] : local.m1363["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1363["permission_resources"], null) == null ? [] : local.m1363["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "severity" {
    for_each = try(local.m1363["severity"], null) == null ? [] : local.m1363["severity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1363["tags"], null) == null ? [] : local.m1363["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1363["version_context"], null) == null ? [] : local.m1363["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
