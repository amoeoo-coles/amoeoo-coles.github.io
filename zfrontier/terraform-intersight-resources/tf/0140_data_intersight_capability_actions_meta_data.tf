# Sample data source intersight_capability_actions_meta_data — reads ../models/data_intersight_capability_actions_meta_data.yml
locals { m140 = yamldecode(file("${path.module}/../models/data_intersight_capability_actions_meta_data.yml"))["data_intersight_capability_actions_meta_data"] }

data "intersight_capability_actions_meta_data" "n140" {
  account_moid = try(local.m140["account_moid"], null)
  additional_properties = try(local.m140["additional_properties"], null)
  class_id = try(local.m140["class_id"], null)
  create_time = try(local.m140["create_time"], null)
  domain_group_moid = try(local.m140["domain_group_moid"], null)
  id = try(local.m140["id"], null)
  max_fw_version = try(local.m140["max_fw_version"], null)
  min_fw_version = try(local.m140["min_fw_version"], null)
  mod_time = try(local.m140["mod_time"], null)
  model = try(local.m140["model"], null)
  moid = try(local.m140["moid"], null)
  name = try(local.m140["name"], null)
  object_type = try(local.m140["object_type"], null)
  owners = try(local.m140["owners"], null)
  results = try(local.m140["results"], null)
  sel_log_path = try(local.m140["sel_log_path"], null)
  sel_script_file_path = try(local.m140["sel_script_file_path"], null)
  shared_scope = try(local.m140["shared_scope"], null)
  supported_actions = try(local.m140["supported_actions"], null)
  target_type = try(local.m140["target_type"], null)
  vendor = try(local.m140["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m140["ancestors"], null) == null ? [] : local.m140["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m140["parent"], null) == null ? [] : local.m140["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m140["permission_resources"], null) == null ? [] : local.m140["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m140["tags"], null) == null ? [] : local.m140["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m140["version_context"], null) == null ? [] : local.m140["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
