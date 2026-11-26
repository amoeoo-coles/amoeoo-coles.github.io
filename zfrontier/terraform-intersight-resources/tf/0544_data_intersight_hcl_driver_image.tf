# Sample data source intersight_hcl_driver_image — reads ../models/data_intersight_hcl_driver_image.yml
locals { m544 = yamldecode(file("${path.module}/../models/data_intersight_hcl_driver_image.yml"))["data_intersight_hcl_driver_image"] }

data "intersight_hcl_driver_image" "n544" {
  account_moid = try(local.m544["account_moid"], null)
  additional_properties = try(local.m544["additional_properties"], null)
  class_id = try(local.m544["class_id"], null)
  create_time = try(local.m544["create_time"], null)
  domain_group_moid = try(local.m544["domain_group_moid"], null)
  driver_iso_url = try(local.m544["driver_iso_url"], null)
  id = try(local.m544["id"], null)
  management_type = try(local.m544["management_type"], null)
  mod_time = try(local.m544["mod_time"], null)
  moid = try(local.m544["moid"], null)
  object_type = try(local.m544["object_type"], null)
  owners = try(local.m544["owners"], null)
  results = try(local.m544["results"], null)
  server_pid = try(local.m544["server_pid"], null)
  shared_scope = try(local.m544["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m544["ancestors"], null) == null ? [] : local.m544["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m544["parent"], null) == null ? [] : local.m544["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m544["permission_resources"], null) == null ? [] : local.m544["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m544["tags"], null) == null ? [] : local.m544["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m544["version_context"], null) == null ? [] : local.m544["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
