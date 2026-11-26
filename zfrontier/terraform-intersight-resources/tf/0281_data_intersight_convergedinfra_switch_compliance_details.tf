# Sample data source intersight_convergedinfra_switch_compliance_details — reads ../models/data_intersight_convergedinfra_switch_compliance_details.yml
locals { m281 = yamldecode(file("${path.module}/../models/data_intersight_convergedinfra_switch_compliance_details.yml"))["data_intersight_convergedinfra_switch_compliance_details"] }

data "intersight_convergedinfra_switch_compliance_details" "n281" {
  account_moid = try(local.m281["account_moid"], null)
  additional_properties = try(local.m281["additional_properties"], null)
  class_id = try(local.m281["class_id"], null)
  create_time = try(local.m281["create_time"], null)
  domain_group_moid = try(local.m281["domain_group_moid"], null)
  firmware = try(local.m281["firmware"], null)
  id = try(local.m281["id"], null)
  mod_time = try(local.m281["mod_time"], null)
  model = try(local.m281["model"], null)
  moid = try(local.m281["moid"], null)
  name = try(local.m281["name"], null)
  object_type = try(local.m281["object_type"], null)
  owners = try(local.m281["owners"], null)
  reason = try(local.m281["reason"], null)
  results = try(local.m281["results"], null)
  shared_scope = try(local.m281["shared_scope"], null)
  status = try(local.m281["status"], null)
  type = try(local.m281["type"], null)
  dynamic "ancestors" {
    for_each = try(local.m281["ancestors"], null) == null ? [] : local.m281["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m281["parent"], null) == null ? [] : local.m281["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m281["permission_resources"], null) == null ? [] : local.m281["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod_compliance" {
    for_each = try(local.m281["pod_compliance"], null) == null ? [] : local.m281["pod_compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_compliances" {
    for_each = try(local.m281["storage_compliances"], null) == null ? [] : local.m281["storage_compliances"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch" {
    for_each = try(local.m281["switch"], null) == null ? [] : local.m281["switch"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m281["tags"], null) == null ? [] : local.m281["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m281["version_context"], null) == null ? [] : local.m281["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
