# Sample data source intersight_storage_hyper_flex_storage_container — reads ../models/data_intersight_storage_hyper_flex_storage_container.yml
locals { m1256 = yamldecode(file("${path.module}/../models/data_intersight_storage_hyper_flex_storage_container.yml"))["data_intersight_storage_hyper_flex_storage_container"] }

data "intersight_storage_hyper_flex_storage_container" "n1256" {
  account_moid = try(local.m1256["account_moid"], null)
  additional_properties = try(local.m1256["additional_properties"], null)
  class_id = try(local.m1256["class_id"], null)
  create_time = try(local.m1256["create_time"], null)
  created_time = try(local.m1256["created_time"], null)
  data_block_size = try(local.m1256["data_block_size"], null)
  domain_group_moid = try(local.m1256["domain_group_moid"], null)
  id = try(local.m1256["id"], null)
  in_use = try(local.m1256["in_use"], null)
  last_access_time = try(local.m1256["last_access_time"], null)
  last_modified_time = try(local.m1256["last_modified_time"], null)
  mod_time = try(local.m1256["mod_time"], null)
  moid = try(local.m1256["moid"], null)
  name = try(local.m1256["name"], null)
  object_type = try(local.m1256["object_type"], null)
  owners = try(local.m1256["owners"], null)
  provisioned_capacity = try(local.m1256["provisioned_capacity"], null)
  provisioned_volume_capacity_utilization = try(local.m1256["provisioned_volume_capacity_utilization"], null)
  results = try(local.m1256["results"], null)
  shared_scope = try(local.m1256["shared_scope"], null)
  type = try(local.m1256["type"], null)
  un_compressed_used_bytes = try(local.m1256["un_compressed_used_bytes"], null)
  uuid = try(local.m1256["uuid"], null)
  volume_count = try(local.m1256["volume_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1256["ancestors"], null) == null ? [] : local.m1256["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m1256["cluster"], null) == null ? [] : local.m1256["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1256["parent"], null) == null ? [] : local.m1256["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1256["permission_resources"], null) == null ? [] : local.m1256["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1256["registered_device"], null) == null ? [] : local.m1256["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1256["storage_utilization"], null) == null ? [] : local.m1256["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1256["tags"], null) == null ? [] : local.m1256["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1256["version_context"], null) == null ? [] : local.m1256["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
