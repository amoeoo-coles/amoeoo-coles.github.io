# Sample data source intersight_convergedinfra_storage_compliance_details — reads ../models/data_intersight_convergedinfra_storage_compliance_details.yml
locals { m280 = yamldecode(file("${path.module}/../models/data_intersight_convergedinfra_storage_compliance_details.yml"))["data_intersight_convergedinfra_storage_compliance_details"] }

data "intersight_convergedinfra_storage_compliance_details" "n280" {
  account_moid = try(local.m280["account_moid"], null)
  additional_properties = try(local.m280["additional_properties"], null)
  class_id = try(local.m280["class_id"], null)
  create_time = try(local.m280["create_time"], null)
  domain_group_moid = try(local.m280["domain_group_moid"], null)
  id = try(local.m280["id"], null)
  mod_time = try(local.m280["mod_time"], null)
  moid = try(local.m280["moid"], null)
  name = try(local.m280["name"], null)
  object_type = try(local.m280["object_type"], null)
  os = try(local.m280["os"], null)
  owners = try(local.m280["owners"], null)
  protocol = try(local.m280["protocol"], null)
  reason = try(local.m280["reason"], null)
  ref_device = try(local.m280["ref_device"], null)
  results = try(local.m280["results"], null)
  shared_scope = try(local.m280["shared_scope"], null)
  status = try(local.m280["status"], null)
  dynamic "adapter_compliance" {
    for_each = try(local.m280["adapter_compliance"], null) == null ? [] : local.m280["adapter_compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m280["ancestors"], null) == null ? [] : local.m280["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m280["parent"], null) == null ? [] : local.m280["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m280["permission_resources"], null) == null ? [] : local.m280["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pod_compliance" {
    for_each = try(local.m280["pod_compliance"], null) == null ? [] : local.m280["pod_compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_array" {
    for_each = try(local.m280["storage_array"], null) == null ? [] : local.m280["storage_array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_compliance" {
    for_each = try(local.m280["switch_compliance"], null) == null ? [] : local.m280["switch_compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m280["tags"], null) == null ? [] : local.m280["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m280["version_context"], null) == null ? [] : local.m280["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
