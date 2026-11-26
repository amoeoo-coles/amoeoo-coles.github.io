# Sample data source intersight_convergedinfra_server_compliance_details — reads ../models/data_intersight_convergedinfra_server_compliance_details.yml
locals { m279 = yamldecode(file("${path.module}/../models/data_intersight_convergedinfra_server_compliance_details.yml"))["data_intersight_convergedinfra_server_compliance_details"] }

data "intersight_convergedinfra_server_compliance_details" "n279" {
  account_moid = try(local.m279["account_moid"], null)
  adapter_count = try(local.m279["adapter_count"], null)
  additional_properties = try(local.m279["additional_properties"], null)
  class_id = try(local.m279["class_id"], null)
  create_time = try(local.m279["create_time"], null)
  domain_group_moid = try(local.m279["domain_group_moid"], null)
  firmware = try(local.m279["firmware"], null)
  hcl_status = try(local.m279["hcl_status"], null)
  hcl_status_reason = try(local.m279["hcl_status_reason"], null)
  id = try(local.m279["id"], null)
  mod_time = try(local.m279["mod_time"], null)
  model = try(local.m279["model"], null)
  moid = try(local.m279["moid"], null)
  name = try(local.m279["name"], null)
  object_type = try(local.m279["object_type"], null)
  os = try(local.m279["os"], null)
  owners = try(local.m279["owners"], null)
  platform = try(local.m279["platform"], null)
  processor = try(local.m279["processor"], null)
  reason = try(local.m279["reason"], null)
  results = try(local.m279["results"], null)
  shared_scope = try(local.m279["shared_scope"], null)
  status = try(local.m279["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m279["ancestors"], null) == null ? [] : local.m279["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m279["parent"], null) == null ? [] : local.m279["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m279["permission_resources"], null) == null ? [] : local.m279["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod_compliance" {
    for_each = try(local.m279["pod_compliance"], null) == null ? [] : local.m279["pod_compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m279["server"], null) == null ? [] : local.m279["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m279["tags"], null) == null ? [] : local.m279["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m279["version_context"], null) == null ? [] : local.m279["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
