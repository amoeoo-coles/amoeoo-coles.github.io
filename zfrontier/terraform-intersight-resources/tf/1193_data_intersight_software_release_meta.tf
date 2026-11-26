# Sample data source intersight_software_release_meta — reads ../models/data_intersight_software_release_meta.yml
locals { m1193 = yamldecode(file("${path.module}/../models/data_intersight_software_release_meta.yml"))["data_intersight_software_release_meta"] }

data "intersight_software_release_meta" "n1193" {
  account_moid = try(local.m1193["account_moid"], null)
  additional_properties = try(local.m1193["additional_properties"], null)
  class_id = try(local.m1193["class_id"], null)
  create_time = try(local.m1193["create_time"], null)
  domain_group_moid = try(local.m1193["domain_group_moid"], null)
  id = try(local.m1193["id"], null)
  image_type = try(local.m1193["image_type"], null)
  latest_file_name = try(local.m1193["latest_file_name"], null)
  latest_version = try(local.m1193["latest_version"], null)
  mod_time = try(local.m1193["mod_time"], null)
  moid = try(local.m1193["moid"], null)
  object_type = try(local.m1193["object_type"], null)
  owners = try(local.m1193["owners"], null)
  results = try(local.m1193["results"], null)
  shared_scope = try(local.m1193["shared_scope"], null)
  software_type_id = try(local.m1193["software_type_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1193["ancestors"], null) == null ? [] : local.m1193["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1193["catalog"], null) == null ? [] : local.m1193["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "image" {
    for_each = try(local.m1193["image"], null) == null ? [] : local.m1193["image"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1193["parent"], null) == null ? [] : local.m1193["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1193["permission_resources"], null) == null ? [] : local.m1193["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1193["tags"], null) == null ? [] : local.m1193["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1193["version_context"], null) == null ? [] : local.m1193["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
