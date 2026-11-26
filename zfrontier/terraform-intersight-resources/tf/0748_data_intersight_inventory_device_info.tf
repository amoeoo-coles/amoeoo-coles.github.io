# Sample data source intersight_inventory_device_info — reads ../models/data_intersight_inventory_device_info.yml
locals { m748 = yamldecode(file("${path.module}/../models/data_intersight_inventory_device_info.yml"))["data_intersight_inventory_device_info"] }

data "intersight_inventory_device_info" "n748" {
  account_moid = try(local.m748["account_moid"], null)
  additional_properties = try(local.m748["additional_properties"], null)
  class_id = try(local.m748["class_id"], null)
  create_time = try(local.m748["create_time"], null)
  disable_events = try(local.m748["disable_events"], null)
  domain_group_moid = try(local.m748["domain_group_moid"], null)
  event_counter = try(local.m748["event_counter"], null)
  event_counter_enabled = try(local.m748["event_counter_enabled"], null)
  id = try(local.m748["id"], null)
  interval = try(local.m748["interval"], null)
  last_re_inventory_time = try(local.m748["last_re_inventory_time"], null)
  mod_time = try(local.m748["mod_time"], null)
  moid = try(local.m748["moid"], null)
  object_type = try(local.m748["object_type"], null)
  owners = try(local.m748["owners"], null)
  re_inventory_count = try(local.m748["re_inventory_count"], null)
  results = try(local.m748["results"], null)
  shared_scope = try(local.m748["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m748["ancestors"], null) == null ? [] : local.m748["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_member" {
    for_each = try(local.m748["cluster_member"], null) == null ? [] : local.m748["cluster_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "job_info" {
    for_each = try(local.m748["job_info"], null) == null ? [] : local.m748["job_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m748["parent"], null) == null ? [] : local.m748["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m748["permission_resources"], null) == null ? [] : local.m748["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m748["registered_device"], null) == null ? [] : local.m748["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m748["tags"], null) == null ? [] : local.m748["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m748["version_context"], null) == null ? [] : local.m748["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
