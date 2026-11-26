# Sample data source intersight_appliance_device_certificate — reads ../models/data_intersight_appliance_device_certificate.yml
locals { m047 = yamldecode(file("${path.module}/../models/data_intersight_appliance_device_certificate.yml"))["data_intersight_appliance_device_certificate"] }

data "intersight_appliance_device_certificate" "n047" {
  account_moid = try(local.m047["account_moid"], null)
  additional_properties = try(local.m047["additional_properties"], null)
  ca_certificate = try(local.m047["ca_certificate"], null)
  ca_certificate_expiry_time = try(local.m047["ca_certificate_expiry_time"], null)
  certificate_renewal_expiry_time = try(local.m047["certificate_renewal_expiry_time"], null)
  class_id = try(local.m047["class_id"], null)
  configuration_mo_id = try(local.m047["configuration_mo_id"], null)
  create_time = try(local.m047["create_time"], null)
  domain_group_moid = try(local.m047["domain_group_moid"], null)
  end_time = try(local.m047["end_time"], null)
  id = try(local.m047["id"], null)
  last_success_poll_time = try(local.m047["last_success_poll_time"], null)
  messages = try(local.m047["messages"], null)
  mod_time = try(local.m047["mod_time"], null)
  moid = try(local.m047["moid"], null)
  object_type = try(local.m047["object_type"], null)
  owners = try(local.m047["owners"], null)
  results = try(local.m047["results"], null)
  shared_scope = try(local.m047["shared_scope"], null)
  start_time = try(local.m047["start_time"], null)
  status = try(local.m047["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m047["ancestors"], null) == null ? [] : local.m047["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "completed_phases" {
    for_each = try(local.m047["completed_phases"], null) == null ? [] : local.m047["completed_phases"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "current_phase" {
    for_each = try(local.m047["current_phase"], null) == null ? [] : local.m047["current_phase"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m047["parent"], null) == null ? [] : local.m047["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m047["permission_resources"], null) == null ? [] : local.m047["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m047["tags"], null) == null ? [] : local.m047["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m047["version_context"], null) == null ? [] : local.m047["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
