# Sample data source intersight_ucsd_backup_info — reads ../models/data_intersight_ucsd_backup_info.yml
locals { m1395 = yamldecode(file("${path.module}/../models/data_intersight_ucsd_backup_info.yml"))["data_intersight_ucsd_backup_info"] }

data "intersight_ucsd_backup_info" "n1395" {
  account_moid = try(local.m1395["account_moid"], null)
  additional_properties = try(local.m1395["additional_properties"], null)
  backup_file_name = try(local.m1395["backup_file_name"], null)
  backup_location = try(local.m1395["backup_location"], null)
  backup_server_ip = try(local.m1395["backup_server_ip"], null)
  backup_size = try(local.m1395["backup_size"], null)
  class_id = try(local.m1395["class_id"], null)
  create_time = try(local.m1395["create_time"], null)
  domain_group_moid = try(local.m1395["domain_group_moid"], null)
  duration = try(local.m1395["duration"], null)
  encryption_key = try(var.secrets["data_intersight_ucsd_backup_info.encryption_key"], local.m1395["encryption_key"])
  failure_reason = try(local.m1395["failure_reason"], null)
  id = try(local.m1395["id"], null)
  is_purged = try(local.m1395["is_purged"], null)
  last_modified = try(local.m1395["last_modified"], null)
  mod_time = try(local.m1395["mod_time"], null)
  moid = try(local.m1395["moid"], null)
  object_type = try(local.m1395["object_type"], null)
  owners = try(local.m1395["owners"], null)
  percentage_completion = try(local.m1395["percentage_completion"], null)
  product_version = try(local.m1395["product_version"], null)
  protocol = try(local.m1395["protocol"], null)
  results = try(local.m1395["results"], null)
  shared_scope = try(local.m1395["shared_scope"], null)
  stage_completion = try(local.m1395["stage_completion"], null)
  start_time = try(local.m1395["start_time"], null)
  status = try(local.m1395["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1395["ancestors"], null) == null ? [] : local.m1395["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "connectors" {
    for_each = try(local.m1395["connectors"], null) == null ? [] : local.m1395["connectors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1395["parent"], null) == null ? [] : local.m1395["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1395["permission_resources"], null) == null ? [] : local.m1395["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1395["registered_device"], null) == null ? [] : local.m1395["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1395["tags"], null) == null ? [] : local.m1395["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1395["version_context"], null) == null ? [] : local.m1395["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
