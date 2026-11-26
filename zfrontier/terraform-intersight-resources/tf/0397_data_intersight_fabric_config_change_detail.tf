# Sample data source intersight_fabric_config_change_detail — reads ../models/data_intersight_fabric_config_change_detail.yml
locals { m397 = yamldecode(file("${path.module}/../models/data_intersight_fabric_config_change_detail.yml"))["data_intersight_fabric_config_change_detail"] }

data "intersight_fabric_config_change_detail" "n397" {
  account_moid = try(local.m397["account_moid"], null)
  additional_properties = try(local.m397["additional_properties"], null)
  changes = try(local.m397["changes"], null)
  class_id = try(local.m397["class_id"], null)
  config_change_flag = try(local.m397["config_change_flag"], null)
  create_time = try(local.m397["create_time"], null)
  disruptions = try(local.m397["disruptions"], null)
  domain_group_moid = try(local.m397["domain_group_moid"], null)
  id = try(local.m397["id"], null)
  message = try(local.m397["message"], null)
  mod_status = try(local.m397["mod_status"], null)
  mod_time = try(local.m397["mod_time"], null)
  moid = try(local.m397["moid"], null)
  object_type = try(local.m397["object_type"], null)
  owners = try(local.m397["owners"], null)
  results = try(local.m397["results"], null)
  shared_scope = try(local.m397["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m397["ancestors"], null) == null ? [] : local.m397["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "config_change_context" {
    for_each = try(local.m397["config_change_context"], null) == null ? [] : local.m397["config_change_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m397["parent"], null) == null ? [] : local.m397["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m397["permission_resources"], null) == null ? [] : local.m397["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profile" {
    for_each = try(local.m397["profile"], null) == null ? [] : local.m397["profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m397["tags"], null) == null ? [] : local.m397["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m397["version_context"], null) == null ? [] : local.m397["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
