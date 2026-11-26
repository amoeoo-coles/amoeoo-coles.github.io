# Sample data source intersight_console_console_config — reads ../models/data_intersight_console_console_config.yml
locals { m275 = yamldecode(file("${path.module}/../models/data_intersight_console_console_config.yml"))["data_intersight_console_console_config"] }

data "intersight_console_console_config" "n275" {
  account_moid = try(local.m275["account_moid"], null)
  additional_properties = try(local.m275["additional_properties"], null)
  class_id = try(local.m275["class_id"], null)
  create_time = try(local.m275["create_time"], null)
  data_bits = try(local.m275["data_bits"], null)
  device_mo_id = try(local.m275["device_mo_id"], null)
  dn = try(local.m275["dn"], null)
  domain_group_moid = try(local.m275["domain_group_moid"], null)
  id = try(local.m275["id"], null)
  mod_time = try(local.m275["mod_time"], null)
  moid = try(local.m275["moid"], null)
  object_type = try(local.m275["object_type"], null)
  owners = try(local.m275["owners"], null)
  parity = try(local.m275["parity"], null)
  results = try(local.m275["results"], null)
  rn = try(local.m275["rn"], null)
  shared_scope = try(local.m275["shared_scope"], null)
  speed = try(local.m275["speed"], null)
  stop_bits = try(local.m275["stop_bits"], null)
  dynamic "ancestors" {
    for_each = try(local.m275["ancestors"], null) == null ? [] : local.m275["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m275["network_element"], null) == null ? [] : local.m275["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m275["parent"], null) == null ? [] : local.m275["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m275["permission_resources"], null) == null ? [] : local.m275["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m275["registered_device"], null) == null ? [] : local.m275["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m275["tags"], null) == null ? [] : local.m275["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m275["version_context"], null) == null ? [] : local.m275["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
