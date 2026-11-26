# Sample data source intersight_compute_mapping — reads ../models/data_intersight_compute_mapping.yml
locals { m240 = yamldecode(file("${path.module}/../models/data_intersight_compute_mapping.yml"))["data_intersight_compute_mapping"] }

data "intersight_compute_mapping" "n240" {
  account_moid = try(local.m240["account_moid"], null)
  additional_properties = try(local.m240["additional_properties"], null)
  class_id = try(local.m240["class_id"], null)
  create_time = try(local.m240["create_time"], null)
  device_mo_id = try(local.m240["device_mo_id"], null)
  dn = try(local.m240["dn"], null)
  domain_group_moid = try(local.m240["domain_group_moid"], null)
  file_location = try(local.m240["file_location"], null)
  id = try(local.m240["id"], null)
  identifier = try(local.m240["identifier"], null)
  image_name = try(local.m240["image_name"], null)
  media_types = try(local.m240["media_types"], null)
  mod_time = try(local.m240["mod_time"], null)
  moid = try(local.m240["moid"], null)
  name = try(local.m240["name"], null)
  object_type = try(local.m240["object_type"], null)
  owners = try(local.m240["owners"], null)
  results = try(local.m240["results"], null)
  rn = try(local.m240["rn"], null)
  shared_scope = try(local.m240["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m240["ancestors"], null) == null ? [] : local.m240["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m240["inventory_device_info"], null) == null ? [] : local.m240["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m240["parent"], null) == null ? [] : local.m240["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m240["permission_resources"], null) == null ? [] : local.m240["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m240["registered_device"], null) == null ? [] : local.m240["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m240["tags"], null) == null ? [] : local.m240["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m240["version_context"], null) == null ? [] : local.m240["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vmedia" {
    for_each = try(local.m240["vmedia"], null) == null ? [] : local.m240["vmedia"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
