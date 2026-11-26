# Sample data source intersight_network_secure_router — reads ../models/data_intersight_network_secure_router.yml
locals { m870 = yamldecode(file("${path.module}/../models/data_intersight_network_secure_router.yml"))["data_intersight_network_secure_router"] }

data "intersight_network_secure_router" "n870" {
  account_moid = try(local.m870["account_moid"], null)
  additional_properties = try(local.m870["additional_properties"], null)
  boot_progress_last_state = try(local.m870["boot_progress_last_state"], null)
  chassis_id = try(local.m870["chassis_id"], null)
  class_id = try(local.m870["class_id"], null)
  create_time = try(local.m870["create_time"], null)
  device_mo_id = try(local.m870["device_mo_id"], null)
  dn = try(local.m870["dn"], null)
  domain_group_moid = try(local.m870["domain_group_moid"], null)
  firmware_version = try(local.m870["firmware_version"], null)
  id = try(local.m870["id"], null)
  is_upgraded = try(local.m870["is_upgraded"], null)
  mod_time = try(local.m870["mod_time"], null)
  model = try(local.m870["model"], null)
  moid = try(local.m870["moid"], null)
  name = try(local.m870["name"], null)
  nr_lifecycle = try(local.m870["nr_lifecycle"], null)
  object_type = try(local.m870["object_type"], null)
  oper_power_state = try(local.m870["oper_power_state"], null)
  oper_reason = try(local.m870["oper_reason"], null)
  owners = try(local.m870["owners"], null)
  package_version = try(local.m870["package_version"], null)
  presence = try(local.m870["presence"], null)
  results = try(local.m870["results"], null)
  revision = try(local.m870["revision"], null)
  rn = try(local.m870["rn"], null)
  serial = try(local.m870["serial"], null)
  shared_scope = try(local.m870["shared_scope"], null)
  slot_id = try(local.m870["slot_id"], null)
  user_label = try(local.m870["user_label"], null)
  vendor = try(local.m870["vendor"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m870["alarm_summary"], null) == null ? [] : local.m870["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m870["ancestors"], null) == null ? [] : local.m870["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "bmc" {
    for_each = try(local.m870["bmc"], null) == null ? [] : local.m870["bmc"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_chassis" {
    for_each = try(local.m870["equipment_chassis"], null) == null ? [] : local.m870["equipment_chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "lan_ports" {
    for_each = try(local.m870["lan_ports"], null) == null ? [] : local.m870["lan_ports"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "locator_led" {
    for_each = try(local.m870["locator_led"], null) == null ? [] : local.m870["locator_led"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m870["parent"], null) == null ? [] : local.m870["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m870["permission_resources"], null) == null ? [] : local.m870["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m870["previous_fru"], null) == null ? [] : local.m870["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m870["registered_device"], null) == null ? [] : local.m870["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m870["tags"], null) == null ? [] : local.m870["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m870["version_context"], null) == null ? [] : local.m870["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
