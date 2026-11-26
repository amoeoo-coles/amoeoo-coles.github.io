# Sample data source intersight_network_supervisor_card — reads ../models/data_intersight_network_supervisor_card.yml
locals { m872 = yamldecode(file("${path.module}/../models/data_intersight_network_supervisor_card.yml"))["data_intersight_network_supervisor_card"] }

data "intersight_network_supervisor_card" "n872" {
  account_moid = try(local.m872["account_moid"], null)
  additional_properties = try(local.m872["additional_properties"], null)
  class_id = try(local.m872["class_id"], null)
  create_time = try(local.m872["create_time"], null)
  description = try(local.m872["description"], null)
  device_mo_id = try(local.m872["device_mo_id"], null)
  dn = try(local.m872["dn"], null)
  domain_group_moid = try(local.m872["domain_group_moid"], null)
  hardware_version = try(local.m872["hardware_version"], null)
  id = try(local.m872["id"], null)
  is_upgraded = try(local.m872["is_upgraded"], null)
  mod_time = try(local.m872["mod_time"], null)
  model = try(local.m872["model"], null)
  moid = try(local.m872["moid"], null)
  name = try(local.m872["name"], null)
  number_of_ports = try(local.m872["number_of_ports"], null)
  object_type = try(local.m872["object_type"], null)
  oper_reason = try(local.m872["oper_reason"], null)
  oper_state = try(local.m872["oper_state"], null)
  owners = try(local.m872["owners"], null)
  part_number = try(local.m872["part_number"], null)
  power_state = try(local.m872["power_state"], null)
  presence = try(local.m872["presence"], null)
  results = try(local.m872["results"], null)
  revision = try(local.m872["revision"], null)
  rn = try(local.m872["rn"], null)
  serial = try(local.m872["serial"], null)
  shared_scope = try(local.m872["shared_scope"], null)
  status = try(local.m872["status"], null)
  supervisor_id = try(local.m872["supervisor_id"], null)
  type = try(local.m872["type"], null)
  vendor = try(local.m872["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m872["ancestors"], null) == null ? [] : local.m872["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fc_ports" {
    for_each = try(local.m872["fc_ports"], null) == null ? [] : local.m872["fc_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m872["network_element"], null) == null ? [] : local.m872["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m872["parent"], null) == null ? [] : local.m872["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m872["permission_resources"], null) == null ? [] : local.m872["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m872["previous_fru"], null) == null ? [] : local.m872["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m872["registered_device"], null) == null ? [] : local.m872["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m872["tags"], null) == null ? [] : local.m872["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m872["version_context"], null) == null ? [] : local.m872["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
