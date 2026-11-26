# Sample data source intersight_convergedinfra_pod_compliance_info — reads ../models/data_intersight_convergedinfra_pod_compliance_info.yml
locals { m278 = yamldecode(file("${path.module}/../models/data_intersight_convergedinfra_pod_compliance_info.yml"))["data_intersight_convergedinfra_pod_compliance_info"] }

data "intersight_convergedinfra_pod_compliance_info" "n278" {
  account_moid = try(local.m278["account_moid"], null)
  additional_properties = try(local.m278["additional_properties"], null)
  class_id = try(local.m278["class_id"], null)
  create_time = try(local.m278["create_time"], null)
  domain_group_moid = try(local.m278["domain_group_moid"], null)
  id = try(local.m278["id"], null)
  mod_time = try(local.m278["mod_time"], null)
  moid = try(local.m278["moid"], null)
  name = try(local.m278["name"], null)
  object_type = try(local.m278["object_type"], null)
  owners = try(local.m278["owners"], null)
  reason = try(local.m278["reason"], null)
  results = try(local.m278["results"], null)
  shared_scope = try(local.m278["shared_scope"], null)
  status = try(local.m278["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m278["ancestors"], null) == null ? [] : local.m278["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "details" {
    for_each = try(local.m278["details"], null) == null ? [] : local.m278["details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m278["parent"], null) == null ? [] : local.m278["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m278["permission_resources"], null) == null ? [] : local.m278["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod" {
    for_each = try(local.m278["pod"], null) == null ? [] : local.m278["pod"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m278["tags"], null) == null ? [] : local.m278["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m278["version_context"], null) == null ? [] : local.m278["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
