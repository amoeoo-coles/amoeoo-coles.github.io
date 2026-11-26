# Sample data source intersight_cond_alarm_definition — reads ../models/data_intersight_cond_alarm_definition.yml
locals { m263 = yamldecode(file("${path.module}/../models/data_intersight_cond_alarm_definition.yml"))["data_intersight_cond_alarm_definition"] }

data "intersight_cond_alarm_definition" "n263" {
  account_moid = try(local.m263["account_moid"], null)
  additional_properties = try(local.m263["additional_properties"], null)
  class_id = try(local.m263["class_id"], null)
  create_time = try(local.m263["create_time"], null)
  description = try(local.m263["description"], null)
  domain_group_moid = try(local.m263["domain_group_moid"], null)
  id = try(local.m263["id"], null)
  mod_time = try(local.m263["mod_time"], null)
  moid = try(local.m263["moid"], null)
  name = try(local.m263["name"], null)
  object_type = try(local.m263["object_type"], null)
  owners = try(local.m263["owners"], null)
  probable_cause = try(local.m263["probable_cause"], null)
  remediation = try(local.m263["remediation"], null)
  results = try(local.m263["results"], null)
  shared_scope = try(local.m263["shared_scope"], null)
  status = try(local.m263["status"], null)
  system_classifications = try(local.m263["system_classifications"], null)
  dynamic "account" {
    for_each = try(local.m263["account"], null) == null ? [] : local.m263["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "actions" {
    for_each = try(local.m263["actions"], null) == null ? [] : local.m263["actions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m263["ancestors"], null) == null ? [] : local.m263["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "condition" {
    for_each = try(local.m263["condition"], null) == null ? [] : local.m263["condition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m263["device"], null) == null ? [] : local.m263["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m263["parent"], null) == null ? [] : local.m263["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m263["permission_resources"], null) == null ? [] : local.m263["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m263["tags"], null) == null ? [] : local.m263["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "threshold_definition" {
    for_each = try(local.m263["threshold_definition"], null) == null ? [] : local.m263["threshold_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m263["version_context"], null) == null ? [] : local.m263["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
