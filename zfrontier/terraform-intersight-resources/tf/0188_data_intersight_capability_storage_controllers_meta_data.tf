# Sample data source intersight_capability_storage_controllers_meta_data — reads ../models/data_intersight_capability_storage_controllers_meta_data.yml
locals { m188 = yamldecode(file("${path.module}/../models/data_intersight_capability_storage_controllers_meta_data.yml"))["data_intersight_capability_storage_controllers_meta_data"] }

data "intersight_capability_storage_controllers_meta_data" "n188" {
  account_moid = try(local.m188["account_moid"], null)
  additional_properties = try(local.m188["additional_properties"], null)
  class_id = try(local.m188["class_id"], null)
  controller_pid = try(local.m188["controller_pid"], null)
  controller_series = try(local.m188["controller_series"], null)
  controller_type = try(local.m188["controller_type"], null)
  controller_vendor = try(local.m188["controller_vendor"], null)
  create_time = try(local.m188["create_time"], null)
  domain_group_moid = try(local.m188["domain_group_moid"], null)
  id = try(local.m188["id"], null)
  is_hybrid_drive_slots_supported = try(local.m188["is_hybrid_drive_slots_supported"], null)
  mod_time = try(local.m188["mod_time"], null)
  moid = try(local.m188["moid"], null)
  name = try(local.m188["name"], null)
  object_type = try(local.m188["object_type"], null)
  owners = try(local.m188["owners"], null)
  results = try(local.m188["results"], null)
  shared_scope = try(local.m188["shared_scope"], null)
  supported_storage_server_actions = try(local.m188["supported_storage_server_actions"], null)
  target_type = try(local.m188["target_type"], null)
  vendor = try(local.m188["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m188["ancestors"], null) == null ? [] : local.m188["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m188["parent"], null) == null ? [] : local.m188["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m188["permission_resources"], null) == null ? [] : local.m188["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m188["tags"], null) == null ? [] : local.m188["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m188["version_context"], null) == null ? [] : local.m188["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
