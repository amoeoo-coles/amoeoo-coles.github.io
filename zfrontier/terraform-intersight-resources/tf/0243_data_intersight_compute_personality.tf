# Sample data source intersight_compute_personality — reads ../models/data_intersight_compute_personality.yml
locals { m243 = yamldecode(file("${path.module}/../models/data_intersight_compute_personality.yml"))["data_intersight_compute_personality"] }

data "intersight_compute_personality" "n243" {
  account_moid = try(local.m243["account_moid"], null)
  additional_info = try(local.m243["additional_info"], null)
  additional_properties = try(local.m243["additional_properties"], null)
  class_id = try(local.m243["class_id"], null)
  create_time = try(local.m243["create_time"], null)
  device_mo_id = try(local.m243["device_mo_id"], null)
  dn = try(local.m243["dn"], null)
  domain_group_moid = try(local.m243["domain_group_moid"], null)
  id = try(local.m243["id"], null)
  mod_time = try(local.m243["mod_time"], null)
  moid = try(local.m243["moid"], null)
  name = try(local.m243["name"], null)
  object_type = try(local.m243["object_type"], null)
  owners = try(local.m243["owners"], null)
  personality_id = try(local.m243["personality_id"], null)
  results = try(local.m243["results"], null)
  rn = try(local.m243["rn"], null)
  shared_scope = try(local.m243["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m243["ancestors"], null) == null ? [] : local.m243["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m243["compute_blade"], null) == null ? [] : local.m243["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m243["compute_rack_unit"], null) == null ? [] : local.m243["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m243["parent"], null) == null ? [] : local.m243["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m243["permission_resources"], null) == null ? [] : local.m243["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m243["registered_device"], null) == null ? [] : local.m243["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m243["tags"], null) == null ? [] : local.m243["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m243["version_context"], null) == null ? [] : local.m243["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
