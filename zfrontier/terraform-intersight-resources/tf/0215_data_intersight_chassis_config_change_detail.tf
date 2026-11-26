# Sample data source intersight_chassis_config_change_detail — reads ../models/data_intersight_chassis_config_change_detail.yml
locals { m215 = yamldecode(file("${path.module}/../models/data_intersight_chassis_config_change_detail.yml"))["data_intersight_chassis_config_change_detail"] }

data "intersight_chassis_config_change_detail" "n215" {
  account_moid = try(local.m215["account_moid"], null)
  additional_properties = try(local.m215["additional_properties"], null)
  changes = try(local.m215["changes"], null)
  class_id = try(local.m215["class_id"], null)
  config_change_flag = try(local.m215["config_change_flag"], null)
  create_time = try(local.m215["create_time"], null)
  disruptions = try(local.m215["disruptions"], null)
  domain_group_moid = try(local.m215["domain_group_moid"], null)
  id = try(local.m215["id"], null)
  message = try(local.m215["message"], null)
  mod_status = try(local.m215["mod_status"], null)
  mod_time = try(local.m215["mod_time"], null)
  moid = try(local.m215["moid"], null)
  object_type = try(local.m215["object_type"], null)
  owners = try(local.m215["owners"], null)
  results = try(local.m215["results"], null)
  shared_scope = try(local.m215["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m215["ancestors"], null) == null ? [] : local.m215["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_context" {
    for_each = try(local.m215["config_change_context"], null) == null ? [] : local.m215["config_change_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iom_profile" {
    for_each = try(local.m215["iom_profile"], null) == null ? [] : local.m215["iom_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m215["parent"], null) == null ? [] : local.m215["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m215["permission_resources"], null) == null ? [] : local.m215["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m215["profile"], null) == null ? [] : local.m215["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m215["tags"], null) == null ? [] : local.m215["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m215["version_context"], null) == null ? [] : local.m215["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
