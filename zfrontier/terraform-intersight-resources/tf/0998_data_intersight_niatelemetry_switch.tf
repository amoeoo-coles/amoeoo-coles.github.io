# Sample data source intersight_niatelemetry_switch — reads ../models/data_intersight_niatelemetry_switch.yml
locals { m998 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_switch.yml"))["data_intersight_niatelemetry_switch"] }

data "intersight_niatelemetry_switch" "n998" {
  account_moid = try(local.m998["account_moid"], null)
  additional_properties = try(local.m998["additional_properties"], null)
  anomaly_status = try(local.m998["anomaly_status"], null)
  class_id = try(local.m998["class_id"], null)
  compensating_control_status = try(local.m998["compensating_control_status"], null)
  compliance_status = try(local.m998["compliance_status"], null)
  create_time = try(local.m998["create_time"], null)
  domain_group_moid = try(local.m998["domain_group_moid"], null)
  fabric_type = try(local.m998["fabric_type"], null)
  hardware_conformance = try(local.m998["hardware_conformance"], null)
  hardware_end_of_vulnerability_support_date = try(local.m998["hardware_end_of_vulnerability_support_date"], null)
  hardware_last_date_of_support = try(local.m998["hardware_last_date_of_support"], null)
  hostname = try(local.m998["hostname"], null)
  id = try(local.m998["id"], null)
  in_band_ip = try(local.m998["in_band_ip"], null)
  ip_address = try(local.m998["ip_address"], null)
  live_protect_agent_status = try(local.m998["live_protect_agent_status"], null)
  live_protect_status = try(local.m998["live_protect_status"], null)
  mod_time = try(local.m998["mod_time"], null)
  model = try(local.m998["model"], null)
  moid = try(local.m998["moid"], null)
  object_type = try(local.m998["object_type"], null)
  operating_system_version = try(local.m998["operating_system_version"], null)
  out_of_band_ip = try(local.m998["out_of_band_ip"], null)
  owners = try(local.m998["owners"], null)
  results = try(local.m998["results"], null)
  role = try(local.m998["role"], null)
  security_advisories_count = try(local.m998["security_advisories_count"], null)
  serial = try(local.m998["serial"], null)
  shared_scope = try(local.m998["shared_scope"], null)
  site = try(local.m998["site"], null)
  software_conformance = try(local.m998["software_conformance"], null)
  software_end_of_vulnerability_support_date = try(local.m998["software_end_of_vulnerability_support_date"], null)
  software_last_date_of_support = try(local.m998["software_last_date_of_support"], null)
  software_version = try(local.m998["software_version"], null)
  strong_asset_id = try(local.m998["strong_asset_id"], null)
  system_up_time = try(local.m998["system_up_time"], null)
  telemetry_enabled = try(local.m998["telemetry_enabled"], null)
  total_hit_count = try(local.m998["total_hit_count"], null)
  vpc_configured = try(local.m998["vpc_configured"], null)
  dynamic "ancestors" {
    for_each = try(local.m998["ancestors"], null) == null ? [] : local.m998["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compensating_controls_details" {
    for_each = try(local.m998["compensating_controls_details"], null) == null ? [] : local.m998["compensating_controls_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m998["fabric"], null) == null ? [] : local.m998["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric_extenders" {
    for_each = try(local.m998["fabric_extenders"], null) == null ? [] : local.m998["fabric_extenders"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "modules" {
    for_each = try(local.m998["modules"], null) == null ? [] : local.m998["modules"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m998["parent"], null) == null ? [] : local.m998["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m998["permission_resources"], null) == null ? [] : local.m998["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "switch_interfaces" {
    for_each = try(local.m998["switch_interfaces"], null) == null ? [] : local.m998["switch_interfaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m998["tags"], null) == null ? [] : local.m998["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m998["version_context"], null) == null ? [] : local.m998["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vpc_data" {
    for_each = try(local.m998["vpc_data"], null) == null ? [] : local.m998["vpc_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
