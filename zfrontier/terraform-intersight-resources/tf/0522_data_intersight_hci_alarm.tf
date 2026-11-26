# Sample data source intersight_hci_alarm — reads ../models/data_intersight_hci_alarm.yml
locals { m522 = yamldecode(file("${path.module}/../models/data_intersight_hci_alarm.yml"))["data_intersight_hci_alarm"] }

data "intersight_hci_alarm" "n522" {
  account_moid = try(local.m522["account_moid"], null)
  additional_properties = try(local.m522["additional_properties"], null)
  alarm_ext_id = try(local.m522["alarm_ext_id"], null)
  alert_type = try(local.m522["alert_type"], null)
  class_id = try(local.m522["class_id"], null)
  cluster_ext_id = try(local.m522["cluster_ext_id"], null)
  create_time = try(local.m522["create_time"], null)
  domain_group_moid = try(local.m522["domain_group_moid"], null)
  id = try(local.m522["id"], null)
  is_resolved = try(local.m522["is_resolved"], null)
  message = try(local.m522["message"], null)
  mod_time = try(local.m522["mod_time"], null)
  moid = try(local.m522["moid"], null)
  object_type = try(local.m522["object_type"], null)
  origin_acknowledge_time = try(local.m522["origin_acknowledge_time"], null)
  origin_creation_time = try(local.m522["origin_creation_time"], null)
  origin_is_acknowledged = try(local.m522["origin_is_acknowledged"], null)
  owners = try(local.m522["owners"], null)
  resolved_time = try(local.m522["resolved_time"], null)
  results = try(local.m522["results"], null)
  severity = try(local.m522["severity"], null)
  shared_scope = try(local.m522["shared_scope"], null)
  source_entity_ext_id = try(local.m522["source_entity_ext_id"], null)
  source_entity_name = try(local.m522["source_entity_name"], null)
  source_entity_type = try(local.m522["source_entity_type"], null)
  title = try(local.m522["title"], null)
  dynamic "ancestors" {
    for_each = try(local.m522["ancestors"], null) == null ? [] : local.m522["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m522["cluster"], null) == null ? [] : local.m522["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parameters" {
    for_each = try(local.m522["parameters"], null) == null ? [] : local.m522["parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m522["parent"], null) == null ? [] : local.m522["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m522["permission_resources"], null) == null ? [] : local.m522["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m522["registered_device"], null) == null ? [] : local.m522["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m522["tags"], null) == null ? [] : local.m522["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m522["version_context"], null) == null ? [] : local.m522["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
