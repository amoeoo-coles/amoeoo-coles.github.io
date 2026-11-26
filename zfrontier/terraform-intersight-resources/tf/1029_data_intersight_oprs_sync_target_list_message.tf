# Sample data source intersight_oprs_sync_target_list_message — reads ../models/data_intersight_oprs_sync_target_list_message.yml
locals { m1029 = yamldecode(file("${path.module}/../models/data_intersight_oprs_sync_target_list_message.yml"))["data_intersight_oprs_sync_target_list_message"] }

data "intersight_oprs_sync_target_list_message" "n1029" {
  account_moid = try(local.m1029["account_moid"], null)
  additional_properties = try(local.m1029["additional_properties"], null)
  assist_id = try(local.m1029["assist_id"], null)
  class_id = try(local.m1029["class_id"], null)
  create_time = try(local.m1029["create_time"], null)
  domain_group_moid = try(local.m1029["domain_group_moid"], null)
  id = try(local.m1029["id"], null)
  mod_time = try(local.m1029["mod_time"], null)
  moid = try(local.m1029["moid"], null)
  object_type = try(local.m1029["object_type"], null)
  owners = try(local.m1029["owners"], null)
  results = try(local.m1029["results"], null)
  shared_scope = try(local.m1029["shared_scope"], null)
  target_type = try(local.m1029["target_type"], null)
  targets = try(local.m1029["targets"], null)
  time_stamp = try(local.m1029["time_stamp"], null)
  dynamic "ancestors" {
    for_each = try(local.m1029["ancestors"], null) == null ? [] : local.m1029["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assist" {
    for_each = try(local.m1029["assist"], null) == null ? [] : local.m1029["assist"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1029["parent"], null) == null ? [] : local.m1029["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1029["permission_resources"], null) == null ? [] : local.m1029["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1029["tags"], null) == null ? [] : local.m1029["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1029["version_context"], null) == null ? [] : local.m1029["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
