# Sample data source intersight_catalystsdwan_vedge_device — reads ../models/data_intersight_catalystsdwan_vedge_device.yml
locals { m204 = yamldecode(file("${path.module}/../models/data_intersight_catalystsdwan_vedge_device.yml"))["data_intersight_catalystsdwan_vedge_device"] }

data "intersight_catalystsdwan_vedge_device" "n204" {
  account_moid = try(local.m204["account_moid"], null)
  additional_properties = try(local.m204["additional_properties"], null)
  class_id = try(local.m204["class_id"], null)
  config_status_message = try(local.m204["config_status_message"], null)
  create_time = try(local.m204["create_time"], null)
  device_id = try(local.m204["device_id"], null)
  device_mo_id = try(local.m204["device_mo_id"], null)
  device_state = try(local.m204["device_state"], null)
  device_type = try(local.m204["device_type"], null)
  dn = try(local.m204["dn"], null)
  domain_group_moid = try(local.m204["domain_group_moid"], null)
  hardware_version = try(local.m204["hardware_version"], null)
  host_name = try(local.m204["host_name"], null)
  id = try(local.m204["id"], null)
  is_upgraded = try(local.m204["is_upgraded"], null)
  mod_time = try(local.m204["mod_time"], null)
  model = try(local.m204["model"], null)
  moid = try(local.m204["moid"], null)
  name = try(local.m204["name"], null)
  nr_version = try(local.m204["nr_version"], null)
  object_type = try(local.m204["object_type"], null)
  owners = try(local.m204["owners"], null)
  platform_family = try(local.m204["platform_family"], null)
  presence = try(local.m204["presence"], null)
  reachability = try(local.m204["reachability"], null)
  results = try(local.m204["results"], null)
  revision = try(local.m204["revision"], null)
  rn = try(local.m204["rn"], null)
  serial = try(local.m204["serial"], null)
  shared_scope = try(local.m204["shared_scope"], null)
  site_id = try(local.m204["site_id"], null)
  site_name = try(local.m204["site_name"], null)
  sp_organization_name = try(local.m204["sp_organization_name"], null)
  system_ip = try(local.m204["system_ip"], null)
  template_status = try(local.m204["template_status"], null)
  uuid = try(local.m204["uuid"], null)
  validity = try(local.m204["validity"], null)
  vendor = try(local.m204["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m204["ancestors"], null) == null ? [] : local.m204["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m204["device_location"], null) == null ? [] : local.m204["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m204["parent"], null) == null ? [] : local.m204["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m204["permission_resources"], null) == null ? [] : local.m204["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m204["previous_fru"], null) == null ? [] : local.m204["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m204["registered_device"], null) == null ? [] : local.m204["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m204["tags"], null) == null ? [] : local.m204["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m204["version_context"], null) == null ? [] : local.m204["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
