# Sample data source intersight_equipment_sensor — reads ../models/data_intersight_equipment_sensor.yml
locals { m330 = yamldecode(file("${path.module}/../models/data_intersight_equipment_sensor.yml"))["data_intersight_equipment_sensor"] }

data "intersight_equipment_sensor" "n330" {
  account_moid = try(local.m330["account_moid"], null)
  additional_properties = try(local.m330["additional_properties"], null)
  alarm_status = try(local.m330["alarm_status"], null)
  class_id = try(local.m330["class_id"], null)
  create_time = try(local.m330["create_time"], null)
  device_mo_id = try(local.m330["device_mo_id"], null)
  dn = try(local.m330["dn"], null)
  domain_group_moid = try(local.m330["domain_group_moid"], null)
  id = try(local.m330["id"], null)
  mod_time = try(local.m330["mod_time"], null)
  moid = try(local.m330["moid"], null)
  name = try(local.m330["name"], null)
  object_type = try(local.m330["object_type"], null)
  owners = try(local.m330["owners"], null)
  results = try(local.m330["results"], null)
  rn = try(local.m330["rn"], null)
  shared_scope = try(local.m330["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m330["ancestors"], null) == null ? [] : local.m330["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m330["network_element"], null) == null ? [] : local.m330["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m330["parent"], null) == null ? [] : local.m330["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m330["permission_resources"], null) == null ? [] : local.m330["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m330["registered_device"], null) == null ? [] : local.m330["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m330["tags"], null) == null ? [] : local.m330["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m330["version_context"], null) == null ? [] : local.m330["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
