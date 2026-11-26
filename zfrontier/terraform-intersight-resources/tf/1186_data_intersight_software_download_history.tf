# Sample data source intersight_software_download_history — reads ../models/data_intersight_software_download_history.yml
locals { m1186 = yamldecode(file("${path.module}/../models/data_intersight_software_download_history.yml"))["data_intersight_software_download_history"] }

data "intersight_software_download_history" "n1186" {
  account_moid = try(local.m1186["account_moid"], null)
  additional_properties = try(local.m1186["additional_properties"], null)
  class_id = try(local.m1186["class_id"], null)
  create_time = try(local.m1186["create_time"], null)
  domain_group_moid = try(local.m1186["domain_group_moid"], null)
  id = try(local.m1186["id"], null)
  mod_time = try(local.m1186["mod_time"], null)
  moid = try(local.m1186["moid"], null)
  name = try(local.m1186["name"], null)
  nr_version = try(local.m1186["nr_version"], null)
  object_type = try(local.m1186["object_type"], null)
  owners = try(local.m1186["owners"], null)
  product = try(local.m1186["product"], null)
  results = try(local.m1186["results"], null)
  shared_scope = try(local.m1186["shared_scope"], null)
  timestamp = try(local.m1186["timestamp"], null)
  user_id_or_email = try(local.m1186["user_id_or_email"], null)
  dynamic "account" {
    for_each = try(local.m1186["account"], null) == null ? [] : local.m1186["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1186["ancestors"], null) == null ? [] : local.m1186["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "image" {
    for_each = try(local.m1186["image"], null) == null ? [] : local.m1186["image"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1186["parent"], null) == null ? [] : local.m1186["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1186["permission_resources"], null) == null ? [] : local.m1186["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1186["tags"], null) == null ? [] : local.m1186["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1186["version_context"], null) == null ? [] : local.m1186["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
