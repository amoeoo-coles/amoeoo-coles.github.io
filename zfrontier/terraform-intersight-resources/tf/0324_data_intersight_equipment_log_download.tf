# Sample data source intersight_equipment_log_download — reads ../models/data_intersight_equipment_log_download.yml
locals { m324 = yamldecode(file("${path.module}/../models/data_intersight_equipment_log_download.yml"))["data_intersight_equipment_log_download"] }

data "intersight_equipment_log_download" "n324" {
  account_moid = try(local.m324["account_moid"], null)
  additional_properties = try(local.m324["additional_properties"], null)
  class_id = try(local.m324["class_id"], null)
  create_time = try(local.m324["create_time"], null)
  domain_group_moid = try(local.m324["domain_group_moid"], null)
  id = try(local.m324["id"], null)
  mod_time = try(local.m324["mod_time"], null)
  moid = try(local.m324["moid"], null)
  object_type = try(local.m324["object_type"], null)
  owners = try(local.m324["owners"], null)
  results = try(local.m324["results"], null)
  shared_scope = try(local.m324["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m324["ancestors"], null) == null ? [] : local.m324["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m324["parent"], null) == null ? [] : local.m324["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m324["permission_resources"], null) == null ? [] : local.m324["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m324["server"], null) == null ? [] : local.m324["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m324["tags"], null) == null ? [] : local.m324["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m324["version_context"], null) == null ? [] : local.m324["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
