# Sample data source intersight_cond_alarm_classification — reads ../models/data_intersight_cond_alarm_classification.yml
locals { m262 = yamldecode(file("${path.module}/../models/data_intersight_cond_alarm_classification.yml"))["data_intersight_cond_alarm_classification"] }

data "intersight_cond_alarm_classification" "n262" {
  account_moid = try(local.m262["account_moid"], null)
  additional_properties = try(local.m262["additional_properties"], null)
  class_id = try(local.m262["class_id"], null)
  create_time = try(local.m262["create_time"], null)
  description = try(local.m262["description"], null)
  domain_group_moid = try(local.m262["domain_group_moid"], null)
  id = try(local.m262["id"], null)
  mod_time = try(local.m262["mod_time"], null)
  moid = try(local.m262["moid"], null)
  name = try(local.m262["name"], null)
  object_type = try(local.m262["object_type"], null)
  owners = try(local.m262["owners"], null)
  results = try(local.m262["results"], null)
  shared_scope = try(local.m262["shared_scope"], null)
  dynamic "alarm_definitions" {
    for_each = try(local.m262["alarm_definitions"], null) == null ? [] : local.m262["alarm_definitions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m262["ancestors"], null) == null ? [] : local.m262["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "applies_to" {
    for_each = try(local.m262["applies_to"], null) == null ? [] : local.m262["applies_to"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m262["parent"], null) == null ? [] : local.m262["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m262["permission_resources"], null) == null ? [] : local.m262["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m262["tags"], null) == null ? [] : local.m262["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m262["version_context"], null) == null ? [] : local.m262["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
