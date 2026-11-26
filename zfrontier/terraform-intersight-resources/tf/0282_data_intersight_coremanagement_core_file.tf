# Sample data source intersight_coremanagement_core_file — reads ../models/data_intersight_coremanagement_core_file.yml
locals { m282 = yamldecode(file("${path.module}/../models/data_intersight_coremanagement_core_file.yml"))["data_intersight_coremanagement_core_file"] }

data "intersight_coremanagement_core_file" "n282" {
  account_moid = try(local.m282["account_moid"], null)
  additional_properties = try(local.m282["additional_properties"], null)
  admin_state = try(local.m282["admin_state"], null)
  class_id = try(local.m282["class_id"], null)
  core_file_download_url = try(local.m282["core_file_download_url"], null)
  create_time = try(local.m282["create_time"], null)
  device_type = try(local.m282["device_type"], null)
  domain_group_moid = try(local.m282["domain_group_moid"], null)
  endpoint_identifier = try(local.m282["endpoint_identifier"], null)
  file_name = try(local.m282["file_name"], null)
  file_size = try(local.m282["file_size"], null)
  id = try(local.m282["id"], null)
  mod_time = try(local.m282["mod_time"], null)
  moid = try(local.m282["moid"], null)
  node_id = try(local.m282["node_id"], null)
  object_type = try(local.m282["object_type"], null)
  owners = try(local.m282["owners"], null)
  pid = try(local.m282["pid"], null)
  reason = try(local.m282["reason"], null)
  results = try(local.m282["results"], null)
  serial = try(local.m282["serial"], null)
  shared_scope = try(local.m282["shared_scope"], null)
  status = try(local.m282["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m282["ancestors"], null) == null ? [] : local.m282["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_parent" {
    for_each = try(local.m282["inventory_parent"], null) == null ? [] : local.m282["inventory_parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m282["parent"], null) == null ? [] : local.m282["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m282["permission_resources"], null) == null ? [] : local.m282["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m282["registered_device"], null) == null ? [] : local.m282["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m282["tags"], null) == null ? [] : local.m282["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m282["version_context"], null) == null ? [] : local.m282["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
