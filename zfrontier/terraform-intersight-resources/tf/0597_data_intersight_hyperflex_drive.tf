# Sample data source intersight_hyperflex_drive — reads ../models/data_intersight_hyperflex_drive.yml
locals { m597 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_drive.yml"))["data_intersight_hyperflex_drive"] }

data "intersight_hyperflex_drive" "n597" {
  account_moid = try(local.m597["account_moid"], null)
  additional_properties = try(local.m597["additional_properties"], null)
  capacity = try(local.m597["capacity"], null)
  class_id = try(local.m597["class_id"], null)
  create_time = try(local.m597["create_time"], null)
  disk_use_state = try(local.m597["disk_use_state"], null)
  domain_group_moid = try(local.m597["domain_group_moid"], null)
  host_name = try(local.m597["host_name"], null)
  host_uuid = try(local.m597["host_uuid"], null)
  id = try(local.m597["id"], null)
  mod_time = try(local.m597["mod_time"], null)
  model_number = try(local.m597["model_number"], null)
  moid = try(local.m597["moid"], null)
  node_uuid = try(local.m597["node_uuid"], null)
  nr_version = try(local.m597["nr_version"], null)
  object_type = try(local.m597["object_type"], null)
  owners = try(local.m597["owners"], null)
  path = try(local.m597["path"], null)
  protocol = try(local.m597["protocol"], null)
  results = try(local.m597["results"], null)
  serial_number = try(local.m597["serial_number"], null)
  shared_scope = try(local.m597["shared_scope"], null)
  slot_number = try(local.m597["slot_number"], null)
  status = try(local.m597["status"], null)
  type = try(local.m597["type"], null)
  usage = try(local.m597["usage"], null)
  used_capacity = try(local.m597["used_capacity"], null)
  uuid = try(local.m597["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m597["ancestors"], null) == null ? [] : local.m597["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m597["locator_led"], null) == null ? [] : local.m597["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node" {
    for_each = try(local.m597["node"], null) == null ? [] : local.m597["node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m597["parent"], null) == null ? [] : local.m597["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m597["permission_resources"], null) == null ? [] : local.m597["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m597["tags"], null) == null ? [] : local.m597["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m597["version_context"], null) == null ? [] : local.m597["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
