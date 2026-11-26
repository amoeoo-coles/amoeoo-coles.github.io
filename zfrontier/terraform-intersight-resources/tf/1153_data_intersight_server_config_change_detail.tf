# Sample data source intersight_server_config_change_detail — reads ../models/data_intersight_server_config_change_detail.yml
locals { m1153 = yamldecode(file("${path.module}/../models/data_intersight_server_config_change_detail.yml"))["data_intersight_server_config_change_detail"] }

data "intersight_server_config_change_detail" "n1153" {
  account_moid = try(local.m1153["account_moid"], null)
  additional_properties = try(local.m1153["additional_properties"], null)
  changes = try(local.m1153["changes"], null)
  class_id = try(local.m1153["class_id"], null)
  config_change_flag = try(local.m1153["config_change_flag"], null)
  create_time = try(local.m1153["create_time"], null)
  disruptions = try(local.m1153["disruptions"], null)
  domain_group_moid = try(local.m1153["domain_group_moid"], null)
  id = try(local.m1153["id"], null)
  message = try(local.m1153["message"], null)
  mod_status = try(local.m1153["mod_status"], null)
  mod_time = try(local.m1153["mod_time"], null)
  moid = try(local.m1153["moid"], null)
  object_type = try(local.m1153["object_type"], null)
  owners = try(local.m1153["owners"], null)
  results = try(local.m1153["results"], null)
  shared_scope = try(local.m1153["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1153["ancestors"], null) == null ? [] : local.m1153["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_context" {
    for_each = try(local.m1153["config_change_context"], null) == null ? [] : local.m1153["config_change_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1153["parent"], null) == null ? [] : local.m1153["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1153["permission_resources"], null) == null ? [] : local.m1153["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m1153["profile"], null) == null ? [] : local.m1153["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1153["tags"], null) == null ? [] : local.m1153["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1153["version_context"], null) == null ? [] : local.m1153["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
