# Sample data source intersight_firmware_board_controller_descriptor — reads ../models/data_intersight_firmware_board_controller_descriptor.yml
locals { m479 = yamldecode(file("${path.module}/../models/data_intersight_firmware_board_controller_descriptor.yml"))["data_intersight_firmware_board_controller_descriptor"] }

data "intersight_firmware_board_controller_descriptor" "n479" {
  account_moid = try(local.m479["account_moid"], null)
  additional_properties = try(local.m479["additional_properties"], null)
  brand_string = try(local.m479["brand_string"], null)
  class_id = try(local.m479["class_id"], null)
  create_time = try(local.m479["create_time"], null)
  description = try(local.m479["description"], null)
  domain_group_moid = try(local.m479["domain_group_moid"], null)
  id = try(local.m479["id"], null)
  label = try(local.m479["label"], null)
  mod_time = try(local.m479["mod_time"], null)
  model = try(local.m479["model"], null)
  moid = try(local.m479["moid"], null)
  nr_version = try(local.m479["nr_version"], null)
  object_type = try(local.m479["object_type"], null)
  owners = try(local.m479["owners"], null)
  results = try(local.m479["results"], null)
  revision = try(local.m479["revision"], null)
  shared_scope = try(local.m479["shared_scope"], null)
  vendor = try(local.m479["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m479["ancestors"], null) == null ? [] : local.m479["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m479["capabilities"], null) == null ? [] : local.m479["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m479["parent"], null) == null ? [] : local.m479["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m479["permission_resources"], null) == null ? [] : local.m479["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m479["tags"], null) == null ? [] : local.m479["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m479["version_context"], null) == null ? [] : local.m479["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
