# Sample data source intersight_appliance_upgrade — reads ../models/data_intersight_appliance_upgrade.yml
locals { m080 = yamldecode(file("${path.module}/../models/data_intersight_appliance_upgrade.yml"))["data_intersight_appliance_upgrade"] }

data "intersight_appliance_upgrade" "n080" {
  account_moid = try(local.m080["account_moid"], null)
  active = try(local.m080["active"], null)
  additional_properties = try(local.m080["additional_properties"], null)
  all_nodes_pingable = try(local.m080["all_nodes_pingable"], null)
  auto_created = try(local.m080["auto_created"], null)
  class_id = try(local.m080["class_id"], null)
  create_time = try(local.m080["create_time"], null)
  description = try(local.m080["description"], null)
  domain_group_moid = try(local.m080["domain_group_moid"], null)
  elapsed_time = try(local.m080["elapsed_time"], null)
  end_time = try(local.m080["end_time"], null)
  error_code = try(local.m080["error_code"], null)
  fingerprint = try(local.m080["fingerprint"], null)
  id = try(local.m080["id"], null)
  is_rolling_back = try(local.m080["is_rolling_back"], null)
  is_user_triggered = try(local.m080["is_user_triggered"], null)
  messages = try(local.m080["messages"], null)
  mod_time = try(local.m080["mod_time"], null)
  moid = try(local.m080["moid"], null)
  nr_version = try(local.m080["nr_version"], null)
  object_type = try(local.m080["object_type"], null)
  owners = try(local.m080["owners"], null)
  previous_install_attempts = try(local.m080["previous_install_attempts"], null)
  results = try(local.m080["results"], null)
  rollback_needed = try(local.m080["rollback_needed"], null)
  rollback_status = try(local.m080["rollback_status"], null)
  services = try(local.m080["services"], null)
  shared_scope = try(local.m080["shared_scope"], null)
  start_time = try(local.m080["start_time"], null)
  status = try(local.m080["status"], null)
  total_nodes = try(local.m080["total_nodes"], null)
  total_phases = try(local.m080["total_phases"], null)
  ui_packages = try(local.m080["ui_packages"], null)
  dynamic "account" {
    for_each = try(local.m080["account"], null) == null ? [] : local.m080["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m080["ancestors"], null) == null ? [] : local.m080["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m080["completed_phases"], null) == null ? [] : local.m080["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m080["current_phase"], null) == null ? [] : local.m080["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "image_bundle" {
    for_each = try(local.m080["image_bundle"], null) == null ? [] : local.m080["image_bundle"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "node_info" {
    for_each = try(local.m080["node_info"], null) == null ? [] : local.m080["node_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m080["parent"], null) == null ? [] : local.m080["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m080["permission_resources"], null) == null ? [] : local.m080["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "requires" {
    for_each = try(local.m080["requires"], null) == null ? [] : local.m080["requires"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "rollback_phases" {
    for_each = try(local.m080["rollback_phases"], null) == null ? [] : local.m080["rollback_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m080["tags"], null) == null ? [] : local.m080["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m080["version_context"], null) == null ? [] : local.m080["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
