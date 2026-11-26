# Sample data source intersight_cond_alarm — reads ../models/data_intersight_cond_alarm.yml
locals { m260 = yamldecode(file("${path.module}/../models/data_intersight_cond_alarm.yml"))["data_intersight_cond_alarm"] }

data "intersight_cond_alarm" "n260" {
  account_moid = try(local.m260["account_moid"], null)
  acknowledge = try(local.m260["acknowledge"], null)
  acknowledge_by = try(local.m260["acknowledge_by"], null)
  acknowledge_time = try(local.m260["acknowledge_time"], null)
  additional_properties = try(local.m260["additional_properties"], null)
  affected_mo_display_name = try(local.m260["affected_mo_display_name"], null)
  affected_mo_id = try(local.m260["affected_mo_id"], null)
  affected_mo_type = try(local.m260["affected_mo_type"], null)
  affected_object = try(local.m260["affected_object"], null)
  ancestor_mo_id = try(local.m260["ancestor_mo_id"], null)
  ancestor_mo_type = try(local.m260["ancestor_mo_type"], null)
  class_id = try(local.m260["class_id"], null)
  code = try(local.m260["code"], null)
  create_time = try(local.m260["create_time"], null)
  creation_time = try(local.m260["creation_time"], null)
  description = try(local.m260["description"], null)
  domain_group_moid = try(local.m260["domain_group_moid"], null)
  flapping = try(local.m260["flapping"], null)
  flapping_count = try(local.m260["flapping_count"], null)
  flapping_start_time = try(local.m260["flapping_start_time"], null)
  id = try(local.m260["id"], null)
  last_transition_time = try(local.m260["last_transition_time"], null)
  mod_time = try(local.m260["mod_time"], null)
  moid = try(local.m260["moid"], null)
  ms_affected_object = try(local.m260["ms_affected_object"], null)
  name = try(local.m260["name"], null)
  object_type = try(local.m260["object_type"], null)
  orig_severity = try(local.m260["orig_severity"], null)
  owners = try(local.m260["owners"], null)
  results = try(local.m260["results"], null)
  severity = try(local.m260["severity"], null)
  shared_scope = try(local.m260["shared_scope"], null)
  suppressed = try(local.m260["suppressed"], null)
  suppressed_time = try(local.m260["suppressed_time"], null)
  dynamic "affected_mo" {
    for_each = try(local.m260["affected_mo"], null) == null ? [] : local.m260["affected_mo"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_summary_aggregators" {
    for_each = try(local.m260["alarm_summary_aggregators"], null) == null ? [] : local.m260["alarm_summary_aggregators"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m260["ancestors"], null) == null ? [] : local.m260["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "definition" {
    for_each = try(local.m260["definition"], null) == null ? [] : local.m260["definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "location_details" {
    for_each = try(local.m260["location_details"], null) == null ? [] : local.m260["location_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m260["parent"], null) == null ? [] : local.m260["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m260["permission_resources"], null) == null ? [] : local.m260["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m260["registered_device"], null) == null ? [] : local.m260["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "suppression_rules" {
    for_each = try(local.m260["suppression_rules"], null) == null ? [] : local.m260["suppression_rules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m260["tags"], null) == null ? [] : local.m260["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m260["version_context"], null) == null ? [] : local.m260["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
