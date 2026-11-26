# Sample data source intersight_storage_pure_host_lun — reads ../models/data_intersight_storage_pure_host_lun.yml
locals { m1327 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_host_lun.yml"))["data_intersight_storage_pure_host_lun"] }

data "intersight_storage_pure_host_lun" "n1327" {
  account_moid = try(local.m1327["account_moid"], null)
  additional_properties = try(local.m1327["additional_properties"], null)
  class_id = try(local.m1327["class_id"], null)
  create_time = try(local.m1327["create_time"], null)
  domain_group_moid = try(local.m1327["domain_group_moid"], null)
  hlu = try(local.m1327["hlu"], null)
  host_group_name = try(local.m1327["host_group_name"], null)
  host_name = try(local.m1327["host_name"], null)
  id = try(local.m1327["id"], null)
  mod_time = try(local.m1327["mod_time"], null)
  moid = try(local.m1327["moid"], null)
  object_type = try(local.m1327["object_type"], null)
  owners = try(local.m1327["owners"], null)
  results = try(local.m1327["results"], null)
  shared = try(local.m1327["shared"], null)
  shared_scope = try(local.m1327["shared_scope"], null)
  volume_name = try(local.m1327["volume_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1327["ancestors"], null) == null ? [] : local.m1327["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1327["array"], null) == null ? [] : local.m1327["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1327["host"], null) == null ? [] : local.m1327["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_group" {
    for_each = try(local.m1327["host_group"], null) == null ? [] : local.m1327["host_group"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1327["parent"], null) == null ? [] : local.m1327["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1327["permission_resources"], null) == null ? [] : local.m1327["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1327["registered_device"], null) == null ? [] : local.m1327["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1327["tags"], null) == null ? [] : local.m1327["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1327["version_context"], null) == null ? [] : local.m1327["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volume" {
    for_each = try(local.m1327["volume"], null) == null ? [] : local.m1327["volume"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
