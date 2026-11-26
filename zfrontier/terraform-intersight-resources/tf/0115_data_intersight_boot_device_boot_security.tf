# Sample data source intersight_boot_device_boot_security — reads ../models/data_intersight_boot_device_boot_security.yml
locals { m115 = yamldecode(file("${path.module}/../models/data_intersight_boot_device_boot_security.yml"))["data_intersight_boot_device_boot_security"] }

data "intersight_boot_device_boot_security" "n115" {
  account_moid = try(local.m115["account_moid"], null)
  additional_properties = try(local.m115["additional_properties"], null)
  class_id = try(local.m115["class_id"], null)
  create_time = try(local.m115["create_time"], null)
  device_mo_id = try(local.m115["device_mo_id"], null)
  dn = try(local.m115["dn"], null)
  domain_group_moid = try(local.m115["domain_group_moid"], null)
  id = try(local.m115["id"], null)
  mod_time = try(local.m115["mod_time"], null)
  moid = try(local.m115["moid"], null)
  object_type = try(local.m115["object_type"], null)
  owners = try(local.m115["owners"], null)
  results = try(local.m115["results"], null)
  rn = try(local.m115["rn"], null)
  secure_boot = try(local.m115["secure_boot"], null)
  shared_scope = try(local.m115["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m115["ancestors"], null) == null ? [] : local.m115["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_physical" {
    for_each = try(local.m115["compute_physical"], null) == null ? [] : local.m115["compute_physical"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m115["inventory_device_info"], null) == null ? [] : local.m115["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m115["parent"], null) == null ? [] : local.m115["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m115["permission_resources"], null) == null ? [] : local.m115["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m115["registered_device"], null) == null ? [] : local.m115["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m115["tags"], null) == null ? [] : local.m115["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m115["version_context"], null) == null ? [] : local.m115["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
