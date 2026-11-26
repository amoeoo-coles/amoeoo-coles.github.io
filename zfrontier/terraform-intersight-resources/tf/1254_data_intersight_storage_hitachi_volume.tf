# Sample data source intersight_storage_hitachi_volume — reads ../models/data_intersight_storage_hitachi_volume.yml
locals { m1254 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_volume.yml"))["data_intersight_storage_hitachi_volume"] }

data "intersight_storage_hitachi_volume" "n1254" {
  account_moid = try(local.m1254["account_moid"], null)
  additional_properties = try(local.m1254["additional_properties"], null)
  attributes = try(local.m1254["attributes"], null)
  class_id = try(local.m1254["class_id"], null)
  clpr_id = try(local.m1254["clpr_id"], null)
  create_time = try(local.m1254["create_time"], null)
  data_reduction_mode = try(local.m1254["data_reduction_mode"], null)
  data_reduction_status = try(local.m1254["data_reduction_status"], null)
  description = try(local.m1254["description"], null)
  domain_group_moid = try(local.m1254["domain_group_moid"], null)
  drive_type = try(local.m1254["drive_type"], null)
  emulation_type = try(local.m1254["emulation_type"], null)
  id = try(local.m1254["id"], null)
  is_full_allocation_enabled = try(local.m1254["is_full_allocation_enabled"], null)
  label = try(local.m1254["label"], null)
  mod_time = try(local.m1254["mod_time"], null)
  moid = try(local.m1254["moid"], null)
  naa_id = try(local.m1254["naa_id"], null)
  name = try(local.m1254["name"], null)
  namespace_id = try(local.m1254["namespace_id"], null)
  num_of_paths = try(local.m1254["num_of_paths"], null)
  nvm_subsystem_id = try(local.m1254["nvm_subsystem_id"], null)
  object_type = try(local.m1254["object_type"], null)
  owners = try(local.m1254["owners"], null)
  parity_group_ids = try(local.m1254["parity_group_ids"], null)
  pool_id = try(local.m1254["pool_id"], null)
  raid_level = try(local.m1254["raid_level"], null)
  raid_type = try(local.m1254["raid_type"], null)
  results = try(local.m1254["results"], null)
  shared_scope = try(local.m1254["shared_scope"], null)
  size = try(local.m1254["size"], null)
  status = try(local.m1254["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m1254["ancestors"], null) == null ? [] : local.m1254["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1254["array"], null) == null ? [] : local.m1254["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1254["parent"], null) == null ? [] : local.m1254["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parity_groups" {
    for_each = try(local.m1254["parity_groups"], null) == null ? [] : local.m1254["parity_groups"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1254["permission_resources"], null) == null ? [] : local.m1254["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pool" {
    for_each = try(local.m1254["pool"], null) == null ? [] : local.m1254["pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1254["registered_device"], null) == null ? [] : local.m1254["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1254["storage_utilization"], null) == null ? [] : local.m1254["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1254["tags"], null) == null ? [] : local.m1254["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1254["version_context"], null) == null ? [] : local.m1254["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
