# Sample data source intersight_network_license_file — reads ../models/data_intersight_network_license_file.yml
locals { m869 = yamldecode(file("${path.module}/../models/data_intersight_network_license_file.yml"))["data_intersight_network_license_file"] }

data "intersight_network_license_file" "n869" {
  account_moid = try(local.m869["account_moid"], null)
  additional_properties = try(local.m869["additional_properties"], null)
  class_id = try(local.m869["class_id"], null)
  create_time = try(local.m869["create_time"], null)
  device_mo_id = try(local.m869["device_mo_id"], null)
  dn = try(local.m869["dn"], null)
  domain_group_moid = try(local.m869["domain_group_moid"], null)
  expiry_date = try(local.m869["expiry_date"], null)
  feature_name = try(local.m869["feature_name"], null)
  file_id = try(local.m869["file_id"], null)
  host_id = try(local.m869["host_id"], null)
  id = try(local.m869["id"], null)
  mod_time = try(local.m869["mod_time"], null)
  moid = try(local.m869["moid"], null)
  object_type = try(local.m869["object_type"], null)
  owners = try(local.m869["owners"], null)
  results = try(local.m869["results"], null)
  rn = try(local.m869["rn"], null)
  shared_scope = try(local.m869["shared_scope"], null)
  vendor = try(local.m869["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m869["ancestors"], null) == null ? [] : local.m869["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m869["network_element"], null) == null ? [] : local.m869["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m869["parent"], null) == null ? [] : local.m869["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m869["permission_resources"], null) == null ? [] : local.m869["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m869["registered_device"], null) == null ? [] : local.m869["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m869["tags"], null) == null ? [] : local.m869["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m869["version_context"], null) == null ? [] : local.m869["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
