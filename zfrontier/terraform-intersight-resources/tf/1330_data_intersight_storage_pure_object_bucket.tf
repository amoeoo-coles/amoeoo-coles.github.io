# Sample data source intersight_storage_pure_object_bucket — reads ../models/data_intersight_storage_pure_object_bucket.yml
locals { m1330 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_object_bucket.yml"))["data_intersight_storage_pure_object_bucket"] }

data "intersight_storage_pure_object_bucket" "n1330" {
  account_moid = try(local.m1330["account_moid"], null)
  additional_properties = try(local.m1330["additional_properties"], null)
  bucket_name = try(local.m1330["bucket_name"], null)
  bucket_type = try(local.m1330["bucket_type"], null)
  class_id = try(local.m1330["class_id"], null)
  create_time = try(local.m1330["create_time"], null)
  created = try(local.m1330["created"], null)
  destroyed = try(local.m1330["destroyed"], null)
  domain_group_moid = try(local.m1330["domain_group_moid"], null)
  hard_limit_enabled = try(local.m1330["hard_limit_enabled"], null)
  id = try(local.m1330["id"], null)
  mod_time = try(local.m1330["mod_time"], null)
  moid = try(local.m1330["moid"], null)
  name = try(local.m1330["name"], null)
  nr_version = try(local.m1330["nr_version"], null)
  object_count = try(local.m1330["object_count"], null)
  object_store_account_name = try(local.m1330["object_store_account_name"], null)
  object_type = try(local.m1330["object_type"], null)
  owners = try(local.m1330["owners"], null)
  quota_limit = try(local.m1330["quota_limit"], null)
  results = try(local.m1330["results"], null)
  retention_lock = try(local.m1330["retention_lock"], null)
  shared_scope = try(local.m1330["shared_scope"], null)
  uuid = try(local.m1330["uuid"], null)
  vendor = try(local.m1330["vendor"], null)
  versioning = try(local.m1330["versioning"], null)
  dynamic "ancestors" {
    for_each = try(local.m1330["ancestors"], null) == null ? [] : local.m1330["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1330["array"], null) == null ? [] : local.m1330["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "object_store_account" {
    for_each = try(local.m1330["object_store_account"], null) == null ? [] : local.m1330["object_store_account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1330["parent"], null) == null ? [] : local.m1330["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1330["permission_resources"], null) == null ? [] : local.m1330["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1330["registered_device"], null) == null ? [] : local.m1330["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1330["storage_utilization"], null) == null ? [] : local.m1330["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1330["tags"], null) == null ? [] : local.m1330["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1330["version_context"], null) == null ? [] : local.m1330["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
