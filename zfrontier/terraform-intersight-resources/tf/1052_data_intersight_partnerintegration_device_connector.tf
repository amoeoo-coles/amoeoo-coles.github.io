# Sample data source intersight_partnerintegration_device_connector — reads ../models/data_intersight_partnerintegration_device_connector.yml
locals { m1052 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_device_connector.yml"))["data_intersight_partnerintegration_device_connector"] }

data "intersight_partnerintegration_device_connector" "n1052" {
  account_moid = try(local.m1052["account_moid"], null)
  action = try(local.m1052["action"], null)
  additional_properties = try(local.m1052["additional_properties"], null)
  build_start_time = try(local.m1052["build_start_time"], null)
  build_status = try(local.m1052["build_status"], null)
  class_id = try(local.m1052["class_id"], null)
  create_time = try(local.m1052["create_time"], null)
  domain_group_moid = try(local.m1052["domain_group_moid"], null)
  id = try(local.m1052["id"], null)
  image_name = try(local.m1052["image_name"], null)
  mod_time = try(local.m1052["mod_time"], null)
  moid = try(local.m1052["moid"], null)
  name = try(local.m1052["name"], null)
  object_type = try(local.m1052["object_type"], null)
  owners = try(local.m1052["owners"], null)
  results = try(local.m1052["results"], null)
  shared_scope = try(local.m1052["shared_scope"], null)
  src_bucket = try(local.m1052["src_bucket"], null)
  src_file_name = try(local.m1052["src_file_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1052["ancestors"], null) == null ? [] : local.m1052["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "logs" {
    for_each = try(local.m1052["logs"], null) == null ? [] : local.m1052["logs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1052["organization"], null) == null ? [] : local.m1052["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1052["parent"], null) == null ? [] : local.m1052["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1052["permission_resources"], null) == null ? [] : local.m1052["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1052["tags"], null) == null ? [] : local.m1052["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1052["version_context"], null) == null ? [] : local.m1052["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
