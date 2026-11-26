# Sample data source intersight_ls_service_profile — reads ../models/data_intersight_ls_service_profile.yml
locals { m809 = yamldecode(file("${path.module}/../models/data_intersight_ls_service_profile.yml"))["data_intersight_ls_service_profile"] }

data "intersight_ls_service_profile" "n809" {
  account_moid = try(local.m809["account_moid"], null)
  additional_properties = try(local.m809["additional_properties"], null)
  assign_state = try(local.m809["assign_state"], null)
  assoc_state = try(local.m809["assoc_state"], null)
  associated_server = try(local.m809["associated_server"], null)
  class_id = try(local.m809["class_id"], null)
  config_state = try(local.m809["config_state"], null)
  create_time = try(local.m809["create_time"], null)
  device_mo_id = try(local.m809["device_mo_id"], null)
  dn = try(local.m809["dn"], null)
  domain_group_moid = try(local.m809["domain_group_moid"], null)
  id = try(local.m809["id"], null)
  mod_time = try(local.m809["mod_time"], null)
  moid = try(local.m809["moid"], null)
  name = try(local.m809["name"], null)
  object_type = try(local.m809["object_type"], null)
  oper_state = try(local.m809["oper_state"], null)
  owners = try(local.m809["owners"], null)
  results = try(local.m809["results"], null)
  rn = try(local.m809["rn"], null)
  shared_scope = try(local.m809["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m809["ancestors"], null) == null ? [] : local.m809["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m809["inventory_device_info"], null) == null ? [] : local.m809["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m809["parent"], null) == null ? [] : local.m809["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m809["permission_resources"], null) == null ? [] : local.m809["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m809["registered_device"], null) == null ? [] : local.m809["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m809["tags"], null) == null ? [] : local.m809["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m809["version_context"], null) == null ? [] : local.m809["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
