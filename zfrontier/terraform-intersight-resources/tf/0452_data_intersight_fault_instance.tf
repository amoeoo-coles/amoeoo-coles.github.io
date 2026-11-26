# Sample data source intersight_fault_instance — reads ../models/data_intersight_fault_instance.yml
locals { m452 = yamldecode(file("${path.module}/../models/data_intersight_fault_instance.yml"))["data_intersight_fault_instance"] }

data "intersight_fault_instance" "n452" {
  account_moid = try(local.m452["account_moid"], null)
  acknowledged = try(local.m452["acknowledged"], null)
  additional_properties = try(local.m452["additional_properties"], null)
  affected_dn = try(local.m452["affected_dn"], null)
  affected_mo_id = try(local.m452["affected_mo_id"], null)
  affected_mo_type = try(local.m452["affected_mo_type"], null)
  ancestor_mo_id = try(local.m452["ancestor_mo_id"], null)
  ancestor_mo_type = try(local.m452["ancestor_mo_type"], null)
  class_id = try(local.m452["class_id"], null)
  code = try(local.m452["code"], null)
  create_time = try(local.m452["create_time"], null)
  creation_time = try(local.m452["creation_time"], null)
  description = try(local.m452["description"], null)
  device_mo_id = try(local.m452["device_mo_id"], null)
  dn = try(local.m452["dn"], null)
  domain_group_moid = try(local.m452["domain_group_moid"], null)
  id = try(local.m452["id"], null)
  last_transition_time = try(local.m452["last_transition_time"], null)
  mod_time = try(local.m452["mod_time"], null)
  moid = try(local.m452["moid"], null)
  num_occurrences = try(local.m452["num_occurrences"], null)
  object_type = try(local.m452["object_type"], null)
  original_severity = try(local.m452["original_severity"], null)
  owners = try(local.m452["owners"], null)
  previous_severity = try(local.m452["previous_severity"], null)
  results = try(local.m452["results"], null)
  rn = try(local.m452["rn"], null)
  rule = try(local.m452["rule"], null)
  severity = try(local.m452["severity"], null)
  shared_scope = try(local.m452["shared_scope"], null)
  dynamic "affected_mo" {
    for_each = try(local.m452["affected_mo"], null) == null ? [] : local.m452["affected_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestor_mo" {
    for_each = try(local.m452["ancestor_mo"], null) == null ? [] : local.m452["ancestor_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m452["ancestors"], null) == null ? [] : local.m452["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m452["inventory_device_info"], null) == null ? [] : local.m452["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m452["parent"], null) == null ? [] : local.m452["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m452["permission_resources"], null) == null ? [] : local.m452["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m452["registered_device"], null) == null ? [] : local.m452["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m452["tags"], null) == null ? [] : local.m452["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m452["version_context"], null) == null ? [] : local.m452["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
