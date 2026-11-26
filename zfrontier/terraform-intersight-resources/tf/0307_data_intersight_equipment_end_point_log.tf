# Sample data source intersight_equipment_end_point_log — reads ../models/data_intersight_equipment_end_point_log.yml
locals { m307 = yamldecode(file("${path.module}/../models/data_intersight_equipment_end_point_log.yml"))["data_intersight_equipment_end_point_log"] }

data "intersight_equipment_end_point_log" "n307" {
  account_moid = try(local.m307["account_moid"], null)
  additional_properties = try(local.m307["additional_properties"], null)
  class_id = try(local.m307["class_id"], null)
  collection_time = try(local.m307["collection_time"], null)
  create_time = try(local.m307["create_time"], null)
  domain_group_moid = try(local.m307["domain_group_moid"], null)
  download_url = try(local.m307["download_url"], null)
  file_name = try(local.m307["file_name"], null)
  id = try(local.m307["id"], null)
  log_type = try(local.m307["log_type"], null)
  mod_time = try(local.m307["mod_time"], null)
  moid = try(local.m307["moid"], null)
  object_type = try(local.m307["object_type"], null)
  owners = try(local.m307["owners"], null)
  results = try(local.m307["results"], null)
  shared_scope = try(local.m307["shared_scope"], null)
  status = try(local.m307["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m307["ancestors"], null) == null ? [] : local.m307["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m307["parent"], null) == null ? [] : local.m307["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m307["permission_resources"], null) == null ? [] : local.m307["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m307["registered_device"], null) == null ? [] : local.m307["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m307["server"], null) == null ? [] : local.m307["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m307["tags"], null) == null ? [] : local.m307["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m307["version_context"], null) == null ? [] : local.m307["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
