# Sample data source intersight_storage_hitachi_host — reads ../models/data_intersight_storage_hitachi_host.yml
locals { m1243 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_host.yml"))["data_intersight_storage_hitachi_host"] }

data "intersight_storage_hitachi_host" "n1243" {
  account_moid = try(local.m1243["account_moid"], null)
  additional_properties = try(local.m1243["additional_properties"], null)
  authentication_mode = try(local.m1243["authentication_mode"], null)
  class_id = try(local.m1243["class_id"], null)
  create_time = try(local.m1243["create_time"], null)
  description = try(local.m1243["description"], null)
  domain_group_moid = try(local.m1243["domain_group_moid"], null)
  host_group_id = try(local.m1243["host_group_id"], null)
  host_group_number = try(local.m1243["host_group_number"], null)
  host_mode_options = try(local.m1243["host_mode_options"], null)
  id = try(local.m1243["id"], null)
  is_chap_mutual = try(local.m1243["is_chap_mutual"], null)
  iscsi_name = try(local.m1243["iscsi_name"], null)
  mod_time = try(local.m1243["mod_time"], null)
  moid = try(local.m1243["moid"], null)
  name = try(local.m1243["name"], null)
  object_type = try(local.m1243["object_type"], null)
  os_type = try(local.m1243["os_type"], null)
  owners = try(local.m1243["owners"], null)
  port_id = try(local.m1243["port_id"], null)
  port_lun_security = try(local.m1243["port_lun_security"], null)
  results = try(local.m1243["results"], null)
  shared_scope = try(local.m1243["shared_scope"], null)
  type = try(local.m1243["type"], null)
  wwn = try(local.m1243["wwn"], null)
  dynamic "ancestors" {
    for_each = try(local.m1243["ancestors"], null) == null ? [] : local.m1243["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1243["array"], null) == null ? [] : local.m1243["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiators" {
    for_each = try(local.m1243["initiators"], null) == null ? [] : local.m1243["initiators"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1243["parent"], null) == null ? [] : local.m1243["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1243["permission_resources"], null) == null ? [] : local.m1243["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1243["registered_device"], null) == null ? [] : local.m1243["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1243["storage_utilization"], null) == null ? [] : local.m1243["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1243["tags"], null) == null ? [] : local.m1243["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1243["version_context"], null) == null ? [] : local.m1243["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
