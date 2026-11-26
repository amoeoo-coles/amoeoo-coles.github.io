# Sample data source intersight_softwarerepository_cached_image — reads ../models/data_intersight_softwarerepository_cached_image.yml
locals { m1200 = yamldecode(file("${path.module}/../models/data_intersight_softwarerepository_cached_image.yml"))["data_intersight_softwarerepository_cached_image"] }

data "intersight_softwarerepository_cached_image" "n1200" {
  account_moid = try(local.m1200["account_moid"], null)
  action = try(local.m1200["action"], null)
  additional_properties = try(local.m1200["additional_properties"], null)
  cache_state = try(local.m1200["cache_state"], null)
  cached_time = try(local.m1200["cached_time"], null)
  class_id = try(local.m1200["class_id"], null)
  create_time = try(local.m1200["create_time"], null)
  domain_group_moid = try(local.m1200["domain_group_moid"], null)
  download_error = try(local.m1200["download_error"], null)
  download_progress = try(local.m1200["download_progress"], null)
  download_retries = try(local.m1200["download_retries"], null)
  id = try(local.m1200["id"], null)
  last_access_time = try(local.m1200["last_access_time"], null)
  md5sum = try(local.m1200["md5sum"], null)
  mod_time = try(local.m1200["mod_time"], null)
  moid = try(local.m1200["moid"], null)
  object_type = try(local.m1200["object_type"], null)
  original_sha512sum = try(local.m1200["original_sha512sum"], null)
  owners = try(local.m1200["owners"], null)
  path = try(local.m1200["path"], null)
  registered_workflows = try(local.m1200["registered_workflows"], null)
  results = try(local.m1200["results"], null)
  shared_scope = try(local.m1200["shared_scope"], null)
  used_count = try(local.m1200["used_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1200["ancestors"], null) == null ? [] : local.m1200["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "checksum" {
    for_each = try(local.m1200["checksum"], null) == null ? [] : local.m1200["checksum"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file" {
    for_each = try(local.m1200["file"], null) == null ? [] : local.m1200["file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m1200["network_element"], null) == null ? [] : local.m1200["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1200["parent"], null) == null ? [] : local.m1200["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1200["permission_resources"], null) == null ? [] : local.m1200["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1200["tags"], null) == null ? [] : local.m1200["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1200["version_context"], null) == null ? [] : local.m1200["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
