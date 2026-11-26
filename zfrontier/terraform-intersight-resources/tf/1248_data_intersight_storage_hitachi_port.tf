# Sample data source intersight_storage_hitachi_port — reads ../models/data_intersight_storage_hitachi_port.yml
locals { m1248 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_port.yml"))["data_intersight_storage_hitachi_port"] }

data "intersight_storage_hitachi_port" "n1248" {
  account_moid = try(local.m1248["account_moid"], null)
  additional_properties = try(local.m1248["additional_properties"], null)
  class_id = try(local.m1248["class_id"], null)
  create_time = try(local.m1248["create_time"], null)
  domain_group_moid = try(local.m1248["domain_group_moid"], null)
  fabric_mode = try(local.m1248["fabric_mode"], null)
  id = try(local.m1248["id"], null)
  ipv4_address = try(local.m1248["ipv4_address"], null)
  ipv6_global_address = try(local.m1248["ipv6_global_address"], null)
  ipv6_link_local_address = try(local.m1248["ipv6_link_local_address"], null)
  iqn = try(local.m1248["iqn"], null)
  is_ipv6_enable = try(local.m1248["is_ipv6_enable"], null)
  loop_id = try(local.m1248["loop_id"], null)
  mod_time = try(local.m1248["mod_time"], null)
  moid = try(local.m1248["moid"], null)
  name = try(local.m1248["name"], null)
  object_type = try(local.m1248["object_type"], null)
  owners = try(local.m1248["owners"], null)
  port_connection = try(local.m1248["port_connection"], null)
  port_lun_security = try(local.m1248["port_lun_security"], null)
  port_mode = try(local.m1248["port_mode"], null)
  port_type = try(local.m1248["port_type"], null)
  results = try(local.m1248["results"], null)
  shared_scope = try(local.m1248["shared_scope"], null)
  shortport_id = try(local.m1248["shortport_id"], null)
  speed = try(local.m1248["speed"], null)
  status = try(local.m1248["status"], null)
  tcp_mtu = try(local.m1248["tcp_mtu"], null)
  type = try(local.m1248["type"], null)
  wwn = try(local.m1248["wwn"], null)
  wwnn = try(local.m1248["wwnn"], null)
  wwpn = try(local.m1248["wwpn"], null)
  dynamic "ancestors" {
    for_each = try(local.m1248["ancestors"], null) == null ? [] : local.m1248["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1248["array"], null) == null ? [] : local.m1248["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1248["parent"], null) == null ? [] : local.m1248["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1248["permission_resources"], null) == null ? [] : local.m1248["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1248["registered_device"], null) == null ? [] : local.m1248["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1248["tags"], null) == null ? [] : local.m1248["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1248["version_context"], null) == null ? [] : local.m1248["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
