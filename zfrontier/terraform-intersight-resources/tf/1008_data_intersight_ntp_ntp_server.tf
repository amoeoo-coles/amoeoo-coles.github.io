# Sample data source intersight_ntp_ntp_server — reads ../models/data_intersight_ntp_ntp_server.yml
locals { m1008 = yamldecode(file("${path.module}/../models/data_intersight_ntp_ntp_server.yml"))["data_intersight_ntp_ntp_server"] }

data "intersight_ntp_ntp_server" "n1008" {
  account_moid = try(local.m1008["account_moid"], null)
  additional_properties = try(local.m1008["additional_properties"], null)
  class_id = try(local.m1008["class_id"], null)
  create_time = try(local.m1008["create_time"], null)
  device_mo_id = try(local.m1008["device_mo_id"], null)
  dn = try(local.m1008["dn"], null)
  domain_group_moid = try(local.m1008["domain_group_moid"], null)
  id = try(local.m1008["id"], null)
  mod_time = try(local.m1008["mod_time"], null)
  moid = try(local.m1008["moid"], null)
  object_type = try(local.m1008["object_type"], null)
  owners = try(local.m1008["owners"], null)
  poll = try(local.m1008["poll"], null)
  results = try(local.m1008["results"], null)
  rn = try(local.m1008["rn"], null)
  server_ip_address = try(local.m1008["server_ip_address"], null)
  shared_scope = try(local.m1008["shared_scope"], null)
  stratum = try(local.m1008["stratum"], null)
  type = try(local.m1008["type"], null)
  vrf_name = try(local.m1008["vrf_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1008["ancestors"], null) == null ? [] : local.m1008["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m1008["network_element"], null) == null ? [] : local.m1008["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1008["parent"], null) == null ? [] : local.m1008["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1008["permission_resources"], null) == null ? [] : local.m1008["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1008["registered_device"], null) == null ? [] : local.m1008["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1008["tags"], null) == null ? [] : local.m1008["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1008["version_context"], null) == null ? [] : local.m1008["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
