# Sample data source intersight_virtualization_vmware_proactive_ha — reads ../models/data_intersight_virtualization_vmware_proactive_ha.yml
locals { m1423 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_proactive_ha.yml"))["data_intersight_virtualization_vmware_proactive_ha"] }

data "intersight_virtualization_vmware_proactive_ha" "n1423" {
  account_moid = try(local.m1423["account_moid"], null)
  additional_properties = try(local.m1423["additional_properties"], null)
  class_id = try(local.m1423["class_id"], null)
  create_time = try(local.m1423["create_time"], null)
  domain_group_moid = try(local.m1423["domain_group_moid"], null)
  id = try(local.m1423["id"], null)
  last_acknowledged_alarm_time = try(local.m1423["last_acknowledged_alarm_time"], null)
  last_sent_alarm_time = try(local.m1423["last_sent_alarm_time"], null)
  mod_time = try(local.m1423["mod_time"], null)
  moid = try(local.m1423["moid"], null)
  object_type = try(local.m1423["object_type"], null)
  owners = try(local.m1423["owners"], null)
  results = try(local.m1423["results"], null)
  shared_scope = try(local.m1423["shared_scope"], null)
  dynamic "alarm_definitions" {
    for_each = try(local.m1423["alarm_definitions"], null) == null ? [] : local.m1423["alarm_definitions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1423["ancestors"], null) == null ? [] : local.m1423["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1423["parent"], null) == null ? [] : local.m1423["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1423["permission_resources"], null) == null ? [] : local.m1423["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1423["registered_device"], null) == null ? [] : local.m1423["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1423["tags"], null) == null ? [] : local.m1423["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1423["version_context"], null) == null ? [] : local.m1423["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
