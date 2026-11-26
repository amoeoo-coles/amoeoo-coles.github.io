# Sample data source intersight_niatelemetry_advisory — reads ../models/data_intersight_niatelemetry_advisory.yml
locals { m912 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_advisory.yml"))["data_intersight_niatelemetry_advisory"] }

data "intersight_niatelemetry_advisory" "n912" {
  account_moid = try(local.m912["account_moid"], null)
  additional_properties = try(local.m912["additional_properties"], null)
  advisory_id = try(local.m912["advisory_id"], null)
  advisory_score = try(local.m912["advisory_score"], null)
  advisory_string = try(local.m912["advisory_string"], null)
  class_id = try(local.m912["class_id"], null)
  compensating_control = try(local.m912["compensating_control"], null)
  create_time = try(local.m912["create_time"], null)
  cve_ids = try(local.m912["cve_ids"], null)
  cvss = try(local.m912["cvss"], null)
  domain_group_moid = try(local.m912["domain_group_moid"], null)
  entity_name = try(local.m912["entity_name"], null)
  fabric_name = try(local.m912["fabric_name"], null)
  id = try(local.m912["id"], null)
  mod_time = try(local.m912["mod_time"], null)
  moid = try(local.m912["moid"], null)
  node_names = try(local.m912["node_names"], null)
  object_type = try(local.m912["object_type"], null)
  owners = try(local.m912["owners"], null)
  protected_nodes = try(local.m912["protected_nodes"], null)
  results = try(local.m912["results"], null)
  security_advisory_id = try(local.m912["security_advisory_id"], null)
  security_status = try(local.m912["security_status"], null)
  severity = try(local.m912["severity"], null)
  shared_scope = try(local.m912["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m912["ancestors"], null) == null ? [] : local.m912["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m912["fabric"], null) == null ? [] : local.m912["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "impacted_nodes" {
    for_each = try(local.m912["impacted_nodes"], null) == null ? [] : local.m912["impacted_nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m912["parent"], null) == null ? [] : local.m912["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m912["permission_resources"], null) == null ? [] : local.m912["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "recommendations" {
    for_each = try(local.m912["recommendations"], null) == null ? [] : local.m912["recommendations"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m912["tags"], null) == null ? [] : local.m912["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m912["version_context"], null) == null ? [] : local.m912["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
