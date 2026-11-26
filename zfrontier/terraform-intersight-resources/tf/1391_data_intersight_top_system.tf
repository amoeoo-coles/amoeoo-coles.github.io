# Sample data source intersight_top_system — reads ../models/data_intersight_top_system.yml
locals { m1391 = yamldecode(file("${path.module}/../models/data_intersight_top_system.yml"))["data_intersight_top_system"] }

data "intersight_top_system" "n1391" {
  account_moid = try(local.m1391["account_moid"], null)
  additional_properties = try(local.m1391["additional_properties"], null)
  class_id = try(local.m1391["class_id"], null)
  create_time = try(local.m1391["create_time"], null)
  device_mo_id = try(local.m1391["device_mo_id"], null)
  dn = try(local.m1391["dn"], null)
  domain_group_moid = try(local.m1391["domain_group_moid"], null)
  id = try(local.m1391["id"], null)
  ipv4_address = try(local.m1391["ipv4_address"], null)
  ipv6_address = try(local.m1391["ipv6_address"], null)
  mod_time = try(local.m1391["mod_time"], null)
  mode = try(local.m1391["mode"], null)
  moid = try(local.m1391["moid"], null)
  name = try(local.m1391["name"], null)
  object_type = try(local.m1391["object_type"], null)
  owners = try(local.m1391["owners"], null)
  results = try(local.m1391["results"], null)
  rn = try(local.m1391["rn"], null)
  shared_scope = try(local.m1391["shared_scope"], null)
  time_zone = try(local.m1391["time_zone"], null)
  dynamic "ancestors" {
    for_each = try(local.m1391["ancestors"], null) == null ? [] : local.m1391["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blades" {
    for_each = try(local.m1391["compute_blades"], null) == null ? [] : local.m1391["compute_blades"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_units" {
    for_each = try(local.m1391["compute_rack_units"], null) == null ? [] : local.m1391["compute_rack_units"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m1391["inventory_device_info"], null) == null ? [] : local.m1391["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_controller" {
    for_each = try(local.m1391["management_controller"], null) == null ? [] : local.m1391["management_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_elements" {
    for_each = try(local.m1391["network_elements"], null) == null ? [] : local.m1391["network_elements"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1391["parent"], null) == null ? [] : local.m1391["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1391["permission_resources"], null) == null ? [] : local.m1391["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1391["registered_device"], null) == null ? [] : local.m1391["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1391["tags"], null) == null ? [] : local.m1391["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1391["version_context"], null) == null ? [] : local.m1391["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
