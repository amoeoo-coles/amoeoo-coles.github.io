# Sample data source intersight_convergedinfra_adapter_compliance_details — reads ../models/data_intersight_convergedinfra_adapter_compliance_details.yml
locals { m276 = yamldecode(file("${path.module}/../models/data_intersight_convergedinfra_adapter_compliance_details.yml"))["data_intersight_convergedinfra_adapter_compliance_details"] }

data "intersight_convergedinfra_adapter_compliance_details" "n276" {
  account_moid = try(local.m276["account_moid"], null)
  additional_properties = try(local.m276["additional_properties"], null)
  class_id = try(local.m276["class_id"], null)
  create_time = try(local.m276["create_time"], null)
  domain_group_moid = try(local.m276["domain_group_moid"], null)
  driver_name = try(local.m276["driver_name"], null)
  driver_version = try(local.m276["driver_version"], null)
  firmware = try(local.m276["firmware"], null)
  hcl_status = try(local.m276["hcl_status"], null)
  hcl_status_reason = try(local.m276["hcl_status_reason"], null)
  id = try(local.m276["id"], null)
  mod_time = try(local.m276["mod_time"], null)
  model = try(local.m276["model"], null)
  moid = try(local.m276["moid"], null)
  name = try(local.m276["name"], null)
  object_type = try(local.m276["object_type"], null)
  owners = try(local.m276["owners"], null)
  reason = try(local.m276["reason"], null)
  results = try(local.m276["results"], null)
  shared_scope = try(local.m276["shared_scope"], null)
  status = try(local.m276["status"], null)
  dynamic "adapter" {
    for_each = try(local.m276["adapter"], null) == null ? [] : local.m276["adapter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m276["ancestors"], null) == null ? [] : local.m276["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m276["parent"], null) == null ? [] : local.m276["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m276["permission_resources"], null) == null ? [] : local.m276["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_compliance_details" {
    for_each = try(local.m276["server_compliance_details"], null) == null ? [] : local.m276["server_compliance_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_compliances" {
    for_each = try(local.m276["storage_compliances"], null) == null ? [] : local.m276["storage_compliances"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m276["tags"], null) == null ? [] : local.m276["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m276["version_context"], null) == null ? [] : local.m276["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
