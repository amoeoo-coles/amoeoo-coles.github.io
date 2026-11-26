# Sample data source intersight_hyperflex_alarm — reads ../models/data_intersight_hyperflex_alarm.yml
locals { m577 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_alarm.yml"))["data_intersight_hyperflex_alarm"] }

data "intersight_hyperflex_alarm" "n577" {
  account_moid = try(local.m577["account_moid"], null)
  acknowledged = try(local.m577["acknowledged"], null)
  acknowledged_by = try(local.m577["acknowledged_by"], null)
  acknowledged_time = try(local.m577["acknowledged_time"], null)
  acknowledged_time_as_utc = try(local.m577["acknowledged_time_as_utc"], null)
  additional_properties = try(local.m577["additional_properties"], null)
  class_id = try(local.m577["class_id"], null)
  create_time = try(local.m577["create_time"], null)
  description = try(local.m577["description"], null)
  domain_group_moid = try(local.m577["domain_group_moid"], null)
  entity_data = try(local.m577["entity_data"], null)
  entity_name = try(local.m577["entity_name"], null)
  entity_type = try(local.m577["entity_type"], null)
  entity_uu_id = try(local.m577["entity_uu_id"], null)
  id = try(local.m577["id"], null)
  message = try(local.m577["message"], null)
  mod_time = try(local.m577["mod_time"], null)
  moid = try(local.m577["moid"], null)
  name = try(local.m577["name"], null)
  object_type = try(local.m577["object_type"], null)
  owners = try(local.m577["owners"], null)
  results = try(local.m577["results"], null)
  shared_scope = try(local.m577["shared_scope"], null)
  status = try(local.m577["status"], null)
  triggered_time = try(local.m577["triggered_time"], null)
  triggered_time_as_utc = try(local.m577["triggered_time_as_utc"], null)
  uuid = try(local.m577["uuid"], null)
  dynamic "ancestor_mos" {
    for_each = try(local.m577["ancestor_mos"], null) == null ? [] : local.m577["ancestor_mos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m577["ancestors"], null) == null ? [] : local.m577["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m577["cluster"], null) == null ? [] : local.m577["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m577["parent"], null) == null ? [] : local.m577["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m577["permission_resources"], null) == null ? [] : local.m577["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m577["tags"], null) == null ? [] : local.m577["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m577["version_context"], null) == null ? [] : local.m577["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
